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
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        uint v13 = simt_subgroup_id(__simt_tid);
        int v14 = (int)(v13);
        v12 = v14;
      } else {
        int v15 = 2;
        v12 = v15;
      }
      v9 = v12;
    } else {
      int v16 = 0;
      int v17 = 0;
      int v18;
      int v19;
      v18 = v16;
      v19 = v17;
      while (true) {
        int v20 = 4;
        int v21 = v3 % v20;
        int v22 = 1;
        int v23 = v21 + v22;
        bool v24 = v19 < v23;
        v18 = v18;
        v19 = v19;
        if (!v24) break;
        int v25 = 1;
        int v26 = v0 + v25;
        int v27 = 1;
        int v28 = v19 + v27;
        v18 = v26;
        v19 = v28;
      }
      int v29 = 1;
      int v30 = v0 + v29;
      v9 = v18;
    }
    v6 = v9;
  } else {
    int v31 = 0;
    bool v32 = v2 != v31;
    int v33;
    if (v32) {
      int v34 = 0;
      int v35 = 0;
      int v36;
      int v37;
      v36 = v34;
      v37 = v35;
      while (true) {
        int v38 = 4;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41 = v39 + v40;
        bool v42 = v37 < v41;
        v36 = v36;
        v37 = v37;
        if (!v42) break;
        uint v43 = simt_lane_id(__simt_tid);
        int v44 = (int)(v43);
        int v45 = 1;
        int v46 = v37 + v45;
        v36 = v44;
        v37 = v46;
      }
      uint v47 = simt_subgroup_id(__simt_tid);
      int v48 = (int)(v47);
      v33 = v36;
    } else {
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
        int v58 = 2;
        int v59 = 1;
        int v60 = v52 + v59;
        v51 = v58;
        v52 = v60;
        continue;
        ;
      }
      v33 = v51;
    }
    int v61 = 4;
    v6 = v33;
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 0;
  int v76 = 0;
  int v77;
  int v78;
  v77 = v75;
  v78 = v76;
  while (true) {
    int v79 = 4;
    int v80 = v78 * v79;
    int v81 = v80 + v68;
    int v82 = 8;
    int v83 = v82 + v81;
    int v84 = v67[v83];
    int v85 = 0;
    bool v86 = v84 != v85;
    v77 = v77;
    v78 = v78;
    if (!v86) break;
    int v87 = v77 + v78;
    int v88 = 1;
    int v89 = v78 + v88;
    v77 = v87;
    v78 = v89;
    break;
    ;
  }
  bool v90 = true;
  int v91 = 16;
  int v92 = v91 + v68;
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  v66[v92] = v94;
  uint v95 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v96 = (int)(v95);
  int v97 = 28;
  int v98 = v97 + v68;
  int v99 = v67[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    v102 = v68;
  } else {
    uint v103 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v104 = (int)(v103);
    v102 = v104;
  }
  int v105 = 32;
  int v106 = v105 + v68;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v66[v106] = v108;
  int v109 = 32;
  int v110 = v109 + v68;
  int v111 = v67[v110];
  int v112;
  v112 = v68;
  switch (v111) {
    case 0:
      {
      int v113 = 36;
      int v114 = v113 + v68;
      int v115 = v67[v114];
      int v116 = 3;
      int v117 = v68 + v116;
      int v118;
      v118 = v117;
      switch (v115) {
        default:
          {
          int v119 = 40;
          int v120 = v119 + v68;
          int v121 = v67[v120];
          int v122 = 0;
          int v123;
          v123 = v122;
          switch (v121) {
            case 0:
              {
              int v124 = 2;
              v123 = v124;
              break;
            }
            case 1:
              {
              v123 = v68;
              break;
            }
            default:
              {
              int v125 = 3;
              v123 = v125;
              break;
            }
            case 2:
              {
              int v126 = 4;
              v123 = v126;
              break;
            }
          }
          bool v127 = true;
          v118 = v123;
          break;
        }
        case 0:
          {
          int v128 = 44;
          int v129 = v128 + v68;
          int v130 = v67[v129];
          int v131 = 1;
          int v132 = v68 + v131;
          int v133;
          v133 = v132;
          switch (v130) {
            default:
              {
              v133 = v68;
              break;
            }
            case 0:
              {
              int v134 = 1;
              v133 = v134;
            }
            case 1:
              {
              v133 = v68;
              break;
            }
            case 2:
              {
              int v135 = 4;
              int v136 = v68 + v135;
              v133 = v136;
              break;
            }
          }
          bool v137 = true;
          v118 = v133;
          break;
        }
        case 1:
          {
          int v138 = 48;
          int v139 = v138 + v68;
          int v140 = v67[v139];
          int v141 = 0;
          bool v142 = v140 != v141;
          int v143;
          if (v142) {
            int v144 = 3;
            v143 = v144;
          } else {
            int v145 = 1;
            int v146 = v68 + v145;
            v143 = v146;
          }
          v118 = v143;
          break;
        }
        case 2:
          {
          int v147 = 0;
          int v148 = 0;
          int v149;
          int v150;
          v149 = v147;
          v150 = v148;
          while (true) {
            int v151 = 4;
            int v152 = v150 * v151;
            int v153 = v152 + v68;
            int v154 = 52;
            int v155 = v154 + v153;
            int v156 = v67[v155];
            int v157 = 0;
            bool v158 = v156 != v157;
            v149 = v149;
            v150 = v150;
            if (!v158) break;
            int v159 = v149 + v150;
            int v160 = 1;
            int v161 = v150 + v160;
            v149 = v159;
            v150 = v161;
            break;
            ;
          }
          bool v162 = true;
          v118 = v149;
          break;
        }
      }
      bool v163 = true;
      v112 = v118;
      break;
    }
    default:
      {
      v112 = v68;
      break;
    }
    case 1:
      {
      int v164 = 72;
      int v165 = v164 + v68;
      int v166 = v67[v165];
      int v167 = 0;
      bool v168 = v166 != v167;
      int v169;
      if (v168) {
        int v170 = 1;
        v169 = v170;
      } else {
        int v171 = 76;
        int v172 = v171 + v68;
        int v173 = v67[v172];
        int v174;
        v174 = v68;
        switch (v173) {
          case 0:
            {
            int v175 = 3;
            v174 = v175;
          }
          case 1:
            {
            int v176 = 2;
            v174 = v176;
            break;
          }
          case 2:
            {
            v174 = v68;
          }
          default:
            {
            int v177 = 2;
            v174 = v177;
            break;
          }
        }
        bool v178 = true;
        v169 = v174;
      }
      v112 = v169;
      break;
    }
    case 2:
      {
      int v179 = 80;
      int v180 = v179 + v68;
      int v181 = v67[v180];
      int v182 = 1;
      int v183;
      v183 = v182;
      switch (v181) {
        default:
          {
          int v184 = 84;
          int v185 = v184 + v68;
          int v186 = v67[v185];
          int v187 = 3;
          int v188;
          v188 = v187;
          switch (v186) {
            case 0:
              {
              v188 = v68;
              break;
            }
            default:
              {
              int v189 = 1;
              v188 = v189;
              break;
            }
            case 1:
              {
              int v190 = 0;
              v188 = v190;
              break;
            }
            case 2:
              {
              int v191 = 4;
              v188 = v191;
              break;
            }
          }
          bool v192 = true;
          v183 = v188;
          break;
        }
        case 0:
          {
          int v193 = 0;
          int v194 = 0;
          int v195;
          int v196;
          v195 = v193;
          v196 = v194;
          while (true) {
            int v197 = 4;
            int v198 = v196 * v197;
            int v199 = v198 + v68;
            int v200 = 88;
            int v201 = v200 + v199;
            int v202 = v67[v201];
            int v203 = 0;
            bool v204 = v202 != v203;
            v195 = v195;
            v196 = v196;
            if (!v204) break;
            int v205 = v195 + v196;
            int v206 = 1;
            int v207 = v196 + v206;
            v195 = v205;
            v196 = v207;
          }
          bool v208 = true;
          v183 = v195;
        }
        case 1:
          {
          int v209 = 108;
          int v210 = v209 + v68;
          int v211 = v67[v210];
          int v212 = 2;
          int v213 = v68 + v212;
          int v214;
          v214 = v213;
          switch (v211) {
            default:
              {
              v214 = v68;
              break;
            }
            case 0:
              {
              v214 = v68;
            }
            case 1:
              {
              int v215 = 1;
              int v216 = v68 + v215;
              v214 = v216;
              break;
            }
            case 2:
              {
              int v217 = 4;
              int v218 = v68 + v217;
              v214 = v218;
              break;
            }
          }
          bool v219 = true;
          v183 = v214;
          break;
        }
      }
      bool v220 = true;
      v112 = v183;
      break;
    }
  }
  bool v221 = true;
  int v222 = 48;
  int v223 = v222 + v68;
  bool v224 = true;
  int v225 = simt_wave_count_bits(v224);
  v66[v223] = v225;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
