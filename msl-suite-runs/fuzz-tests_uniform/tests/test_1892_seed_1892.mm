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
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10 = 3;
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v9) {
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
            int v22 = 0;
            int v23 = 1;
            int v24 = v16 + v23;
            v15 = v22;
            v16 = v24;
          }
          v12 = v15;
          break;
        }
        case 1:
          {
          int v25 = 0;
          bool v26 = v2 != v25;
          int v27;
          if (v26) {
            int v28 = 2;
            int v29 = v0 + v28;
            v27 = v29;
          } else {
            int v30 = 1;
            int v31 = v0 + v30;
            v27 = v31;
          }
          int v32 = 2;
          v12 = v27;
        }
        default:
          {
          int v33 = 2;
          int v34 = v3 % v33;
          int v35 = 4;
          int v36 = v0 + v35;
          int v37;
          v37 = v36;
          switch (v34) {
            case 0:
              {
              v37 = v0;
              break;
            }
            case 1:
              {
              int v38 = 4;
              v37 = v38;
              break;
            }
            default:
              {
              v37 = v0;
              break;
            }
          }
          v12 = v37;
          break;
        }
      }
      int v39 = 4;
      int v40 = v0 + v39;
      v7 = v12;
      break;
    }
    case 1:
      {
      int v41 = 3;
      int v42 = v3 % v41;
      int v43;
      v43 = v0;
      switch (v42) {
        case 0:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 1;
            int v54 = 1;
            int v55 = v47 + v54;
            v46 = v53;
            v47 = v55;
          }
          int v56 = 0;
          v43 = v46;
        }
        case 1:
          {
          int v57 = 0;
          int v58 = 0;
          int v59;
          int v60;
          v59 = v57;
          v60 = v58;
          while (true) {
            int v61 = 4;
            int v62 = v3 % v61;
            int v63 = 1;
            int v64 = v62 + v63;
            bool v65 = v60 < v64;
            v59 = v59;
            v60 = v60;
            if (!v65) break;
            int v66 = 4;
            int v67 = v0 + v66;
            int v68 = 1;
            int v69 = v60 + v68;
            v59 = v67;
            v60 = v69;
          }
          v43 = v59;
          break;
        }
        default:
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
            int v79 = 1;
            int v80 = v73 + v79;
            v72 = v0;
            v73 = v80;
          }
          v43 = v72;
          break;
        }
      }
      int v81 = 1;
      int v82 = v0 + v81;
      v7 = v43;
    }
    default:
      {
      int v83 = 2;
      int v84 = v3 % v83;
      int v85 = 1;
      int v86 = v0 + v85;
      int v87;
      v87 = v86;
      switch (v84) {
        case 0:
          {
          int v88 = 1;
          int v89 = v0 + v88;
          int v90;
          v90 = v89;
          switch (v3) {
            default:
              {
              v90 = v0;
              break;
            }
            case 0:
              {
              v90 = v0;
              break;
            }
          }
          int v91 = 1;
          int v92 = v0 + v91;
          v87 = v90;
          break;
        }
        default:
          {
          int v93 = 0;
          int v94 = 0;
          int v95;
          int v96;
          v95 = v93;
          v96 = v94;
          while (true) {
            int v97 = 4;
            int v98 = v3 % v97;
            int v99 = 1;
            int v100 = v98 + v99;
            bool v101 = v96 < v100;
            v95 = v95;
            v96 = v96;
            if (!v101) break;
            int v102 = 1;
            int v103 = v96 + v102;
            v95 = v0;
            v96 = v103;
            continue;
            ;
          }
          int v104 = 1;
          v87 = v95;
          break;
        }
      }
      v7 = v87;
      break;
    }
  }
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  int v107 = 0;
  int v108 = v107 + v0;
  v1[v108] = v106;
  return;
}

kernel void kernel_main(device int* v109 [[buffer(0)]], device int* v110 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v111 = static_cast<int>(__simt_tid3.x);
  int v112 = 0;
  int v113 = v112 + v111;
  int v114 = v110[v113];
  int v115 = 4;
  int v116 = v115 + v111;
  int v117 = v110[v116];
  helper0(v111, v109, v114, v117, static_cast<int>(__simt_tid3.x));
  int v118 = 8;
  int v119 = v118 + v111;
  int v120 = v110[v119];
  uint v121 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v122 = (int)(v121);
  int v123;
  v123 = v122;
  switch (v120) {
    case 0:
      {
      int v124 = 12;
      int v125 = v124 + v111;
      int v126 = v110[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 16;
        int v131 = v130 + v111;
        int v132 = v110[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        int v135;
        if (v134) {
          int v136 = 3;
          v135 = v136;
        } else {
          int v137 = 1;
          int v138 = v111 + v137;
          v135 = v138;
        }
        v129 = v135;
      } else {
        v129 = v111;
      }
      v123 = v129;
      break;
    }
    case 1:
      {
      int v139 = 4;
      int v140 = v111 + v139;
      v123 = v140;
      break;
    }
    default:
      {
      v123 = v111;
      break;
    }
    case 2:
      {
      int v141 = 1;
      int v142 = v111 + v141;
      v123 = v142;
      break;
    }
  }
  bool v143 = true;
  int v144 = 16;
  int v145 = v144 + v111;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v109[v145] = v147;
  int v148 = 20;
  int v149 = v148 + v111;
  int v150 = v110[v149];
  int v151 = 0;
  bool v152 = v150 != v151;
  int v153;
  if (v152) {
    int v154 = 0;
    int v155 = 0;
    int v156;
    int v157;
    v156 = v154;
    v157 = v155;
    while (true) {
      int v158 = 4;
      int v159 = v157 * v158;
      int v160 = v159 + v111;
      int v161 = 24;
      int v162 = v161 + v160;
      int v163 = v110[v162];
      int v164 = 0;
      bool v165 = v163 != v164;
      v156 = v156;
      v157 = v157;
      if (!v165) break;
      int v166 = v156 + v157;
      int v167 = 1;
      int v168 = v157 + v167;
      v156 = v166;
      v157 = v168;
    }
    bool v169 = true;
    v153 = v156;
  } else {
    int v170 = 44;
    int v171 = v170 + v111;
    int v172 = v110[v171];
    int v173 = 0;
    bool v174 = v172 != v173;
    int v175;
    if (v174) {
      int v176 = 0;
      int v177 = 0;
      int v178;
      int v179;
      v178 = v176;
      v179 = v177;
      while (true) {
        int v180 = 4;
        int v181 = v179 * v180;
        int v182 = v181 + v111;
        int v183 = 48;
        int v184 = v183 + v182;
        int v185 = v110[v184];
        int v186 = 0;
        bool v187 = v185 != v186;
        v178 = v178;
        v179 = v179;
        if (!v187) break;
        int v188 = v178 + v179;
        int v189 = 1;
        int v190 = v179 + v189;
        v178 = v188;
        v179 = v190;
      }
      bool v191 = true;
      v175 = v178;
    } else {
      int v192 = 68;
      int v193 = v192 + v111;
      int v194 = v110[v193];
      int v195 = 4;
      int v196;
      v196 = v195;
      switch (v194) {
        default:
          {
          int v197 = 1;
          v196 = v197;
        }
        case 0:
          {
          v196 = v111;
          break;
        }
        case 1:
          {
          int v198 = 3;
          v196 = v198;
          break;
        }
        case 2:
          {
          int v199 = 0;
          int v200 = v111 + v199;
          v196 = v200;
          break;
        }
      }
      bool v201 = true;
      v175 = v196;
    }
    v153 = v175;
  }
  int v202 = 32;
  int v203 = v202 + v111;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v109[v203] = v205;
  int v206 = 0;
  int v207 = 0;
  int v208;
  int v209;
  v208 = v206;
  v209 = v207;
  while (true) {
    int v210 = 4;
    int v211 = v209 * v210;
    int v212 = v211 + v111;
    int v213 = 72;
    int v214 = v213 + v212;
    int v215 = v110[v214];
    int v216 = 0;
    bool v217 = v215 != v216;
    v208 = v208;
    v209 = v209;
    if (!v217) break;
    uint v218 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v219 = (int)(v218);
    int v220 = v208 + v219;
    int v221 = 1;
    int v222 = v209 + v221;
    v208 = v220;
    v209 = v222;
  }
  bool v223 = true;
  int v224 = 48;
  int v225 = v224 + v111;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v109[v225] = v227;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 92; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
