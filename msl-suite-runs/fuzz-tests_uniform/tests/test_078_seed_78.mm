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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 0;
          int v22 = v0 + v21;
          v20 = v22;
        } else {
          int v23 = 2;
          int v24 = v0 + v23;
          v20 = v24;
        }
        int v25 = 1;
        int v26 = v12 + v25;
        v11 = v20;
        v12 = v26;
      }
      int v27 = 2;
      int v28 = v0 + v27;
      v8 = v11;
      break;
    }
    case 0:
      {
      int v29 = 2;
      int v30 = v3 % v29;
      int v31 = 1;
      int v32;
      v32 = v31;
      switch (v30) {
        case 0:
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
            default:
              {
              int v38 = 4;
              int v39 = v0 + v38;
              v37 = v39;
              break;
            }
            case 1:
              {
              int v40 = 3;
              int v41 = v0 + v40;
              v37 = v41;
              break;
            }
          }
          v32 = v37;
          break;
        }
        default:
          {
          v32 = v0;
          break;
        }
      }
      int v42 = 1;
      v8 = v32;
    }
    case 1:
      {
      int v43 = 0;
      bool v44 = v2 != v43;
      int v45;
      if (v44) {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 2;
          int v50 = v0 + v49;
          v48 = v50;
        }
        int v51 = 1;
        v45 = v48;
      } else {
        int v52;
        v52 = v0;
        switch (v3) {
          default:
            {
            v52 = v0;
            break;
          }
          case 0:
            {
            int v53 = 4;
            int v54 = v0 + v53;
            v52 = v54;
            break;
          }
        }
        v45 = v52;
      }
      v8 = v45;
      break;
    }
  }
  bool v55 = true;
  int v56 = simt_wave_count_bits(v55);
  int v57 = 0;
  int v58 = v57 + v0;
  v1[v58] = v56;
  return;
}

kernel void kernel_main(device int* v59 [[buffer(0)]], device int* v60 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v61 = static_cast<int>(__simt_tid3.x);
  int v62 = 0;
  int v63 = v62 + v61;
  int v64 = v60[v63];
  int v65 = 4;
  int v66 = v65 + v61;
  int v67 = v60[v66];
  helper0(v61, v59, v64, v67, static_cast<int>(__simt_tid3.x));
  int v68 = 8;
  int v69 = v68 + v61;
  int v70 = v60[v69];
  int v71 = 0;
  bool v72 = v70 != v71;
  int v73;
  if (v72) {
    int v74 = 0;
    int v75 = 0;
    int v76;
    int v77;
    v76 = v74;
    v77 = v75;
    while (true) {
      int v78 = 4;
      int v79 = v77 * v78;
      int v80 = v79 + v61;
      int v81 = 12;
      int v82 = v81 + v80;
      int v83 = v60[v82];
      int v84 = 0;
      bool v85 = v83 != v84;
      v76 = v76;
      v77 = v77;
      if (!v85) break;
      int v86 = v76 + v77;
      int v87 = 1;
      int v88 = v77 + v87;
      v76 = v86;
      v77 = v88;
    }
    bool v89 = true;
    v73 = v76;
  } else {
    int v90 = 0;
    int v91 = 0;
    int v92;
    int v93;
    v92 = v90;
    v93 = v91;
    while (true) {
      int v94 = 4;
      int v95 = v93 * v94;
      int v96 = v95 + v61;
      int v97 = 32;
      int v98 = v97 + v96;
      int v99 = v60[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      v92 = v92;
      v93 = v93;
      if (!v101) break;
      int v102 = v92 + v93;
      int v103 = 1;
      int v104 = v93 + v103;
      v92 = v102;
      v93 = v104;
      continue;
      ;
    }
    bool v105 = true;
    v73 = v92;
  }
  int v106 = 16;
  int v107 = v106 + v61;
  bool v108 = true;
  int v109 = simt_wave_count_bits(v108);
  v59[v107] = v109;
  int v110 = 52;
  int v111 = v110 + v61;
  int v112 = v60[v111];
  int v113 = 0;
  bool v114 = v112 != v113;
  int v115;
  if (v114) {
    int v116 = 56;
    int v117 = v116 + v61;
    int v118 = v60[v117];
    int v119 = 0;
    bool v120 = v118 != v119;
    int v121;
    if (v120) {
      int v122 = 60;
      int v123 = v122 + v61;
      int v124 = v60[v123];
      int v125 = 3;
      int v126;
      v126 = v125;
      switch (v124) {
        default:
          {
          v126 = v61;
          break;
        }
        case 0:
          {
          int v127 = 4;
          v126 = v127;
          break;
        }
        case 1:
          {
          int v128 = 0;
          v126 = v128;
          break;
        }
        case 2:
          {
          int v129 = 2;
          v126 = v129;
          break;
        }
      }
      bool v130 = true;
      v121 = v126;
    } else {
      int v131 = 0;
      int v132 = 0;
      int v133;
      int v134;
      v133 = v131;
      v134 = v132;
      while (true) {
        int v135 = 4;
        int v136 = v134 * v135;
        int v137 = v136 + v61;
        int v138 = 64;
        int v139 = v138 + v137;
        int v140 = v60[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        v133 = v133;
        v134 = v134;
        if (!v142) break;
        int v143 = v133 + v134;
        int v144 = 1;
        int v145 = v134 + v144;
        v133 = v143;
        v134 = v145;
        break;
        ;
      }
      bool v146 = true;
      v121 = v133;
    }
    v115 = v121;
  } else {
    int v147 = 0;
    int v148 = 0;
    int v149;
    int v150;
    v149 = v147;
    v150 = v148;
    while (true) {
      int v151 = 4;
      int v152 = v150 * v151;
      int v153 = v152 + v61;
      int v154 = 84;
      int v155 = v154 + v153;
      int v156 = v60[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      v149 = v149;
      v150 = v150;
      if (!v158) break;
      uint v159 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v160 = (int)(v159);
      int v161 = v149 + v160;
      int v162 = 1;
      int v163 = v150 + v162;
      v149 = v161;
      v150 = v163;
    }
    bool v164 = true;
    v115 = v149;
  }
  int v165 = 32;
  int v166 = v165 + v61;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v59[v166] = v168;
  int v169 = 104;
  int v170 = v169 + v61;
  int v171 = v60[v170];
  int v172 = 0;
  bool v173 = v171 != v172;
  int v174;
  if (v173) {
    int v175 = 0;
    int v176 = 0;
    int v177;
    int v178;
    v177 = v175;
    v178 = v176;
    while (true) {
      int v179 = 4;
      int v180 = v178 * v179;
      int v181 = v180 + v61;
      int v182 = 108;
      int v183 = v182 + v181;
      int v184 = v60[v183];
      int v185 = 0;
      bool v186 = v184 != v185;
      v177 = v177;
      v178 = v178;
      if (!v186) break;
      uint v187 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v188 = (int)(v187);
      int v189 = v177 + v188;
      int v190 = 1;
      int v191 = v178 + v190;
      v177 = v189;
      v178 = v191;
      continue;
      ;
    }
    bool v192 = true;
    v174 = v177;
  } else {
    int v193 = 128;
    int v194 = v193 + v61;
    int v195 = v60[v194];
    int v196 = 0;
    bool v197 = v195 != v196;
    int v198;
    if (v197) {
      int v199 = 132;
      int v200 = v199 + v61;
      int v201 = v60[v200];
      uint v202 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v203 = (int)(v202);
      int v204;
      v204 = v203;
      switch (v201) {
        case 0:
          {
          int v205 = 1;
          int v206 = v61 + v205;
          v204 = v206;
        }
        case 1:
          {
          v204 = v61;
          break;
        }
        case 2:
          {
          int v207 = 4;
          int v208 = v61 + v207;
          v204 = v208;
        }
        default:
          {
          v204 = v61;
          break;
        }
      }
      bool v209 = true;
      v198 = v204;
    } else {
      int v210 = 136;
      int v211 = v210 + v61;
      int v212 = v60[v211];
      uint v213 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v214 = (int)(v213);
      int v215;
      v215 = v214;
      switch (v212) {
        case 0:
          {
          int v216 = 0;
          v215 = v216;
        }
        default:
          {
          int v217 = 1;
          int v218 = v61 + v217;
          v215 = v218;
          break;
        }
      }
      bool v219 = true;
      v198 = v215;
    }
    v174 = v198;
  }
  int v220 = 48;
  int v221 = v220 + v61;
  bool v222 = true;
  int v223 = simt_wave_count_bits(v222);
  v59[v221] = v223;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
