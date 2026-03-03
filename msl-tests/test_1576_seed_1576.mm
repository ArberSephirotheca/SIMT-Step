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
  int v5 = v3 % v4;
  int v6 = 2;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 0;
        int v18 = 0;
        int v19;
        int v20;
        v19 = v17;
        v20 = v18;
        while (true) {
          int v21 = 4;
          int v22 = v3 % v21;
          int v23 = 1;
          int v24 = v22 + v23;
          bool v25 = v20 < v24;
          v19 = v19;
          v20 = v20;
          if (!v25) break;
          int v26 = 1;
          int v27 = 1;
          int v28 = v20 + v27;
          v19 = v26;
          v20 = v28;
        }
        int v29 = 2;
        int v30 = 1;
        int v31 = v11 + v30;
        v10 = v19;
        v11 = v31;
      }
      int v32 = 2;
      v7 = v10;
      break;
    }
    case 1:
      {
      int v33 = 2;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        default:
          {
          int v36 = 4;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39 = v0 + v38;
          int v40;
          v40 = v39;
          switch (v37) {
            case 0:
              {
              int v41 = 4;
              v40 = v41;
              break;
            }
            case 1:
              {
              int v42 = 0;
              int v43 = v0 + v42;
              v40 = v43;
              break;
            }
            default:
              {
              int v44 = 2;
              v40 = v44;
            }
            case 2:
              {
              int v45 = 0;
              int v46 = v0 + v45;
              v40 = v46;
              break;
            }
          }
          int v47 = 1;
          v35 = v40;
          break;
        }
        case 0:
          {
          int v48 = 4;
          int v49 = v3 % v48;
          int v50 = 3;
          int v51;
          v51 = v50;
          switch (v49) {
            case 0:
              {
              int v52 = 4;
              int v53 = v0 + v52;
              v51 = v53;
              break;
            }
            case 1:
              {
              int v54 = 4;
              int v55 = v0 + v54;
              v51 = v55;
              break;
            }
            default:
              {
              int v56 = 3;
              int v57 = v0 + v56;
              v51 = v57;
              break;
            }
            case 2:
              {
              v51 = v0;
              break;
            }
          }
          int v58 = 0;
          v35 = v51;
          break;
        }
        case 1:
          {
          int v59 = 2;
          int v60 = v3 % v59;
          int v61;
          v61 = v0;
          switch (v60) {
            default:
              {
              v61 = v0;
            }
            case 0:
              {
              int v62 = 0;
              int v63 = v0 + v62;
              v61 = v63;
              break;
            }
            case 1:
              {
              v61 = v0;
              break;
            }
          }
          int v64 = 0;
          int v65 = v0 + v64;
          v35 = v61;
          break;
        }
      }
      v7 = v35;
      break;
    }
    default:
      {
      int v66 = 4;
      int v67 = v3 % v66;
      int v68;
      v68 = v0;
      switch (v67) {
        case 0:
          {
          int v69 = 2;
          int v70 = v3 % v69;
          int v71 = 0;
          int v72;
          v72 = v71;
          switch (v70) {
            case 0:
              {
              int v73 = 0;
              v72 = v73;
              break;
            }
            default:
              {
              int v74 = 0;
              v72 = v74;
            }
            case 1:
              {
              int v75 = 4;
              v72 = v75;
              break;
            }
          }
          v68 = v72;
          break;
        }
        case 1:
          {
          int v76 = 2;
          int v77 = v3 % v76;
          int v78 = 4;
          int v79;
          v79 = v78;
          switch (v77) {
            case 0:
              {
              v79 = v0;
              break;
            }
            default:
              {
              v79 = v0;
            }
            case 1:
              {
              int v80 = 0;
              v79 = v80;
              break;
            }
          }
          int v81 = 3;
          int v82 = v0 + v81;
          v68 = v79;
          break;
        }
        default:
          {
          v68 = v0;
          break;
        }
        case 2:
          {
          int v83 = 1;
          int v84 = v0 + v83;
          v68 = v84;
          break;
        }
      }
      v7 = v68;
      break;
    }
  }
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  int v87 = 0;
  int v88 = v87 + v0;
  v1[v88] = v86;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 8;
  int v99 = v98 + v91;
  int v100 = v90[v99];
  int v101 = 0;
  int v102;
  v102 = v101;
  switch (v100) {
    case 0:
      {
      int v103 = 12;
      int v104 = v103 + v91;
      int v105 = v90[v104];
      int v106 = 3;
      int v107 = v91 + v106;
      int v108;
      v108 = v107;
      switch (v105) {
        case 0:
          {
          int v109 = 3;
          int v110 = v91 + v109;
          v108 = v110;
        }
        case 1:
          {
          int v111 = 16;
          int v112 = v111 + v91;
          int v113 = v90[v112];
          int v114 = 0;
          bool v115 = v113 != v114;
          int v116;
          if (v115) {
            int v117 = 2;
            v116 = v117;
          } else {
            int v118 = 4;
            int v119 = v91 + v118;
            v116 = v119;
          }
          v108 = v116;
          break;
        }
        default:
          {
          int v120 = 20;
          int v121 = v120 + v91;
          int v122 = v90[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          int v125;
          if (v124) {
            int v126 = 4;
            v125 = v126;
          } else {
            v125 = v91;
          }
          v108 = v125;
          break;
        }
        case 2:
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
            int v133 = v132 + v91;
            int v134 = 24;
            int v135 = v134 + v133;
            int v136 = v90[v135];
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
          }
          bool v142 = true;
          v108 = v129;
          break;
        }
      }
      bool v143 = true;
      v102 = v108;
    }
    case 1:
      {
      int v144 = 0;
      int v145 = 0;
      int v146;
      int v147;
      v146 = v144;
      v147 = v145;
      while (true) {
        int v148 = 4;
        int v149 = v147 * v148;
        int v150 = v149 + v91;
        int v151 = 44;
        int v152 = v151 + v150;
        int v153 = v90[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = v146 + v147;
        int v157 = 1;
        int v158 = v147 + v157;
        v146 = v156;
        v147 = v158;
        break;
        ;
      }
      bool v159 = true;
      v102 = v146;
      break;
    }
    case 2:
      {
      int v160 = 4;
      int v161 = v91 + v160;
      v102 = v161;
    }
    default:
      {
      int v162 = 64;
      int v163 = v162 + v91;
      int v164 = v90[v163];
      int v165 = 1;
      int v166 = v91 + v165;
      int v167;
      v167 = v166;
      switch (v164) {
        case 0:
          {
          int v168 = 3;
          v167 = v168;
          break;
        }
        default:
          {
          int v169 = 2;
          int v170 = v91 + v169;
          v167 = v170;
          break;
        }
        case 1:
          {
          int v171 = 68;
          int v172 = v171 + v91;
          int v173 = v90[v172];
          int v174;
          v174 = v91;
          switch (v173) {
            default:
              {
              int v175 = 1;
              v174 = v175;
              break;
            }
            case 0:
              {
              v174 = v91;
              break;
            }
            case 1:
              {
              int v176 = 1;
              v174 = v176;
              break;
            }
          }
          bool v177 = true;
          v167 = v174;
          break;
        }
      }
      bool v178 = true;
      v102 = v167;
      break;
    }
  }
  bool v179 = true;
  int v180 = 16;
  int v181 = v180 + v91;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v89[v181] = v183;
  uint v184 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v185 = (int)(v184);
  int v186 = 72;
  int v187 = v186 + v91;
  int v188 = v90[v187];
  int v189 = 0;
  bool v190 = v188 != v189;
  int v191;
  if (v190) {
    int v192 = 0;
    int v193 = 0;
    int v194;
    int v195;
    v194 = v192;
    v195 = v193;
    while (true) {
      int v196 = 4;
      int v197 = v195 * v196;
      int v198 = v197 + v91;
      int v199 = 76;
      int v200 = v199 + v198;
      int v201 = v90[v200];
      int v202 = 0;
      bool v203 = v201 != v202;
      v194 = v194;
      v195 = v195;
      if (!v203) break;
      int v204 = 96;
      int v205 = v204 + v91;
      int v206 = v90[v205];
      int v207;
      v207 = v91;
      switch (v206) {
        case 0:
          {
          int v208 = 3;
          int v209 = v91 + v208;
          v207 = v209;
          break;
        }
        default:
          {
          int v210 = 2;
          int v211 = v91 + v210;
          v207 = v211;
          break;
        }
        case 1:
          {
          int v212 = 3;
          v207 = v212;
          break;
        }
      }
      bool v213 = true;
      int v214 = v194 + v207;
      int v215 = 1;
      int v216 = v195 + v215;
      v194 = v214;
      v195 = v216;
      break;
      ;
    }
    bool v217 = true;
    v191 = v194;
  } else {
    int v218 = 100;
    int v219 = v218 + v91;
    int v220 = v90[v219];
    uint v221 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v222 = (int)(v221);
    int v223;
    v223 = v222;
    switch (v220) {
      case 0:
        {
        int v224 = 104;
        int v225 = v224 + v91;
        int v226 = v90[v225];
        int v227;
        v227 = v91;
        switch (v226) {
          default:
            {
            v227 = v91;
            break;
          }
          case 0:
            {
            v227 = v91;
            break;
          }
          case 1:
            {
            v227 = v91;
            break;
          }
        }
        bool v228 = true;
        v223 = v227;
        break;
      }
      default:
        {
        int v229 = 3;
        v223 = v229;
        break;
      }
    }
    bool v230 = true;
    v191 = v223;
  }
  int v231 = 32;
  int v232 = v231 + v91;
  bool v233 = true;
  int v234 = simt_wave_count_bits(v233);
  v89[v232] = v234;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
