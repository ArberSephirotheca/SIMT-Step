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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13;
    v13 = v0;
    switch (v3) {
      default:
        {
        int v14 = 3;
        int v15 = v3 % v14;
        int v16 = 4;
        int v17 = v0 + v16;
        int v18;
        v18 = v17;
        switch (v15) {
          case 0:
            {
            int v19 = 2;
            v18 = v19;
            break;
          }
          default:
            {
            int v20 = 3;
            int v21 = v0 + v20;
            v18 = v21;
            break;
          }
          case 1:
            {
            v18 = v0;
            break;
          }
        }
        v13 = v18;
        break;
      }
      case 0:
        {
        v13 = v0;
        break;
      }
    }
    bool v22 = true;
    int v23 = simt_wave_count_bits(v22);
    int v24 = 0;
    int v25 = 4;
    int v26 = v7 * v25;
    int v27 = v24 + v26;
    int v28 = v27 + v0;
    v1[v28] = v23;
    int v29 = 1;
    int v30 = v7 + v29;
    v6 = v13;
    v7 = v30;
  }
  return;
}

kernel void kernel_main(device int* v31 [[buffer(0)]], device int* v32 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v33 = static_cast<int>(__simt_tid3.x);
  int v34 = 0;
  int v35 = v34 + v33;
  int v36 = v32[v35];
  int v37 = 4;
  int v38 = v37 + v33;
  int v39 = v32[v38];
  int v40 = 0;
  bool v41 = v36 != v40;
  if (v41) {
  } else {
    int v42 = 8;
    int v43 = v42 + v33;
    int v44 = v32[v43];
    int v45 = 0;
    bool v46 = v44 != v45;
    if (v46) {
      helper0(v33, v31, v36, v39, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v47 = 12;
  int v48 = v47 + v33;
  int v49 = v32[v48];
  int v50 = 3;
  int v51;
  v51 = v50;
  switch (v49) {
    case 0:
      {
      int v52 = 16;
      int v53 = v52 + v33;
      int v54 = v32[v53];
      int v55;
      v55 = v33;
      switch (v54) {
        default:
          {
          v55 = v33;
          break;
        }
        case 0:
          {
          int v56 = 20;
          int v57 = v56 + v33;
          int v58 = v32[v57];
          int v59 = 3;
          int v60;
          v60 = v59;
          switch (v58) {
            default:
              {
              v60 = v33;
              break;
            }
            case 0:
              {
              v60 = v33;
            }
            case 1:
              {
              v60 = v33;
              break;
            }
            case 2:
              {
              v60 = v33;
              break;
            }
          }
          bool v61 = true;
          v55 = v60;
          break;
        }
        case 1:
          {
          int v62 = 24;
          int v63 = v62 + v33;
          int v64 = v32[v63];
          int v65 = 1;
          int v66 = v33 + v65;
          int v67;
          v67 = v66;
          switch (v64) {
            case 0:
              {
              int v68 = 3;
              int v69 = v33 + v68;
              v67 = v69;
            }
            default:
              {
              int v70 = 1;
              v67 = v70;
              break;
            }
          }
          v55 = v67;
          break;
        }
      }
      v51 = v55;
    }
    case 1:
      {
      int v71 = 28;
      int v72 = v71 + v33;
      int v73 = v32[v72];
      int v74 = 0;
      bool v75 = v73 != v74;
      int v76;
      if (v75) {
        int v77 = 4;
        int v78 = v33 + v77;
        v76 = v78;
      } else {
        int v79 = 32;
        int v80 = v79 + v33;
        int v81 = v32[v80];
        int v82 = 1;
        int v83 = v33 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          default:
            {
            v84 = v33;
            break;
          }
          case 0:
            {
            v84 = v33;
            break;
          }
        }
        v76 = v84;
      }
      v51 = v76;
      break;
    }
    case 2:
      {
      int v85 = 36;
      int v86 = v85 + v33;
      int v87 = v32[v86];
      int v88 = 4;
      int v89;
      v89 = v88;
      switch (v87) {
        case 0:
          {
          int v90 = 3;
          v89 = v90;
          break;
        }
        default:
          {
          int v91 = 40;
          int v92 = v91 + v33;
          int v93 = v32[v92];
          int v94 = 0;
          bool v95 = v93 != v94;
          int v96;
          if (v95) {
            v96 = v33;
          } else {
            int v97 = 3;
            v96 = v97;
          }
          v89 = v96;
          break;
        }
        case 1:
          {
          int v98 = 44;
          int v99 = v98 + v33;
          int v100 = v32[v99];
          int v101 = 3;
          int v102 = v33 + v101;
          int v103;
          v103 = v102;
          switch (v100) {
            case 0:
              {
              int v104 = 1;
              v103 = v104;
            }
            case 1:
              {
              int v105 = 0;
              int v106 = v33 + v105;
              v103 = v106;
              break;
            }
            default:
              {
              int v107 = 1;
              v103 = v107;
              break;
            }
          }
          v89 = v103;
          break;
        }
      }
      bool v108 = true;
      v51 = v89;
      break;
    }
    default:
      {
      int v109 = 48;
      int v110 = v109 + v33;
      int v111 = v32[v110];
      int v112 = 0;
      bool v113 = v111 != v112;
      int v114;
      if (v113) {
        int v115 = 52;
        int v116 = v115 + v33;
        int v117 = v32[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        int v120;
        if (v119) {
          v120 = v33;
        } else {
          int v121 = 2;
          int v122 = v33 + v121;
          v120 = v122;
        }
        v114 = v120;
      } else {
        int v123 = 56;
        int v124 = v123 + v33;
        int v125 = v32[v124];
        int v126 = 3;
        int v127 = v33 + v126;
        int v128;
        v128 = v127;
        switch (v125) {
          case 0:
            {
            v128 = v33;
            break;
          }
          default:
            {
            int v129 = 2;
            int v130 = v33 + v129;
            v128 = v130;
          }
          case 1:
            {
            int v131 = 0;
            v128 = v131;
            break;
          }
          case 2:
            {
            int v132 = 4;
            v128 = v132;
            break;
          }
        }
        v114 = v128;
      }
      v51 = v114;
      break;
    }
  }
  int v133 = 1;
  int v134 = 60;
  int v135 = v134 + v33;
  int v136 = v32[v135];
  uint v137 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v138 = (int)(v137);
  int v139;
  v139 = v138;
  switch (v136) {
    case 0:
      {
      int v140 = 64;
      int v141 = v140 + v33;
      int v142 = v32[v141];
      int v143 = 0;
      int v144;
      v144 = v143;
      switch (v142) {
        default:
          {
          int v145 = 68;
          int v146 = v145 + v33;
          int v147 = v32[v146];
          int v148 = 0;
          int v149;
          v149 = v148;
          switch (v147) {
            case 0:
              {
              int v150 = 2;
              v149 = v150;
            }
            default:
              {
              int v151 = 3;
              int v152 = v33 + v151;
              v149 = v152;
              break;
            }
          }
          bool v153 = true;
          v144 = v149;
          break;
        }
        case 0:
          {
          int v154 = 72;
          int v155 = v154 + v33;
          int v156 = v32[v155];
          int v157 = 3;
          int v158 = v33 + v157;
          int v159;
          v159 = v158;
          switch (v156) {
            default:
              {
              int v160 = 0;
              int v161 = v33 + v160;
              v159 = v161;
              break;
            }
            case 0:
              {
              int v162 = 4;
              int v163 = v33 + v162;
              v159 = v163;
              break;
            }
          }
          bool v164 = true;
          v144 = v159;
          break;
        }
        case 1:
          {
          int v165 = 0;
          int v166 = 0;
          int v167;
          int v168;
          v167 = v165;
          v168 = v166;
          while (true) {
            int v169 = 4;
            int v170 = v168 * v169;
            int v171 = v170 + v33;
            int v172 = 76;
            int v173 = v172 + v171;
            int v174 = v32[v173];
            int v175 = 0;
            bool v176 = v174 != v175;
            v167 = v167;
            v168 = v168;
            if (!v176) break;
            int v177 = v167 + v168;
            int v178 = 1;
            int v179 = v168 + v178;
            bool v180 = true;
            v167 = v177;
            v168 = v179;
            continue;
            ;
          }
          v144 = v167;
          break;
        }
        case 2:
          {
          int v181 = 96;
          int v182 = v181 + v33;
          int v183 = v32[v182];
          int v184 = 4;
          int v185 = v33 + v184;
          int v186;
          v186 = v185;
          switch (v183) {
            case 0:
              {
              int v187 = 1;
              int v188 = v33 + v187;
              v186 = v188;
              break;
            }
            case 1:
              {
              int v189 = 3;
              int v190 = v33 + v189;
              v186 = v190;
              break;
            }
            default:
              {
              int v191 = 2;
              int v192 = v33 + v191;
              v186 = v192;
              break;
            }
          }
          v144 = v186;
          break;
        }
      }
      v139 = v144;
    }
    default:
      {
      int v193 = 100;
      int v194 = v193 + v33;
      int v195 = v32[v194];
      int v196 = 0;
      bool v197 = v195 != v196;
      int v198;
      if (v197) {
        int v199 = 1;
        v198 = v199;
      } else {
        int v200 = 0;
        int v201 = 0;
        int v202;
        int v203;
        v202 = v200;
        v203 = v201;
        while (true) {
          int v204 = 4;
          int v205 = v203 * v204;
          int v206 = v205 + v33;
          int v207 = 104;
          int v208 = v207 + v206;
          int v209 = v32[v208];
          int v210 = 0;
          bool v211 = v209 != v210;
          v202 = v202;
          v203 = v203;
          if (!v211) break;
          int v212 = v202 + v203;
          int v213 = 1;
          int v214 = v203 + v213;
          bool v215 = true;
          v202 = v212;
          v203 = v214;
        }
        v198 = v202;
      }
      v139 = v198;
    }
    case 1:
      {
      int v216 = 1;
      int v217 = v33 + v216;
      v139 = v217;
      break;
    }
  }
  bool v218 = true;
  int v219 = 16;
  int v220 = v219 + v33;
  bool v221 = true;
  int v222 = simt_wave_count_bits(v221);
  v31[v220] = v222;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
