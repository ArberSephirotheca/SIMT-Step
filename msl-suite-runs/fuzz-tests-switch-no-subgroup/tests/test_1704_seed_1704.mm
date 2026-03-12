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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
      int v13 = 3;
      int v14 = v3 % v13;
      int v15 = 0;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v14) {
        case 0:
          {
          int v18 = 1;
          int v19 = v0 + v18;
          v17 = v19;
          break;
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
            int v29 = 1;
            int v30 = 1;
            int v31 = v23 + v30;
            v22 = v29;
            v23 = v31;
            continue;
            ;
          }
          v17 = v22;
          break;
        }
        default:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 2;
            int v42 = 1;
            int v43 = v35 + v42;
            v34 = v41;
            v35 = v43;
          }
          v17 = v34;
          break;
        }
        case 2:
          {
          v17 = v0;
          break;
        }
      }
      v12 = v17;
      break;
    }
    case 0:
      {
      int v44 = 0;
      bool v45 = v2 != v44;
      int v46;
      if (v45) {
        int v47 = 0;
        int v48 = 0;
        int v49;
        int v50;
        v49 = v47;
        v50 = v48;
        while (true) {
          int v51 = 4;
          int v52 = v3 % v51;
          int v53 = 1;
          int v54 = v52 + v53;
          bool v55 = v50 < v54;
          v49 = v49;
          v50 = v50;
          if (!v55) break;
          int v56 = 1;
          int v57 = v50 + v56;
          v49 = v0;
          v50 = v57;
          break;
          ;
        }
        v46 = v49;
      } else {
        int v58 = 3;
        int v59 = v3 % v58;
        int v60;
        v60 = v0;
        switch (v59) {
          default:
            {
            int v61 = 3;
            v60 = v61;
            break;
          }
          case 0:
            {
            int v62 = 3;
            v60 = v62;
            break;
          }
          case 1:
            {
            int v63 = 4;
            v60 = v63;
            break;
          }
        }
        int v64 = 4;
        v46 = v60;
      }
      v12 = v46;
      break;
    }
    case 1:
      {
      int v65 = 0;
      int v66 = 0;
      int v67;
      int v68;
      v67 = v65;
      v68 = v66;
      while (true) {
        int v69 = 4;
        int v70 = v3 % v69;
        int v71 = 1;
        int v72 = v70 + v71;
        bool v73 = v68 < v72;
        v67 = v67;
        v68 = v68;
        if (!v73) break;
        int v74 = 0;
        int v75 = 0;
        int v76;
        int v77;
        v76 = v74;
        v77 = v75;
        while (true) {
          int v78 = 4;
          int v79 = v3 % v78;
          int v80 = 1;
          int v81 = v79 + v80;
          bool v82 = v77 < v81;
          v76 = v76;
          v77 = v77;
          if (!v82) break;
          int v83 = 1;
          int v84 = v77 + v83;
          v76 = v0;
          v77 = v84;
        }
        int v85 = 1;
        int v86 = v68 + v85;
        v67 = v76;
        v68 = v86;
      }
      v12 = v67;
      break;
    }
  }
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  int v89 = 16;
  int v90 = v89 + v0;
  v1[v90] = v88;
  int v91 = 0;
  bool v92 = v2 != v91;
  int v93 = v92 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v94 [[buffer(0)]], device int* v95 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v96 = static_cast<int>(__simt_tid3.x);
  int v97 = 0;
  int v98 = v97 + v96;
  int v99 = v95[v98];
  int v100 = 4;
  int v101 = v100 + v96;
  int v102 = v95[v101];
  helper0(v96, v94, v99, v102, static_cast<int>(__simt_tid3.x));
  int v103 = 8;
  int v104 = v103 + v96;
  int v105 = v95[v104];
  int v106 = 4;
  int v107;
  v107 = v106;
  switch (v105) {
    case 0:
      {
      int v108 = 0;
      int v109 = 0;
      int v110;
      int v111;
      v110 = v108;
      v111 = v109;
      while (true) {
        int v112 = 4;
        int v113 = v111 * v112;
        int v114 = v113 + v96;
        int v115 = 12;
        int v116 = v115 + v114;
        int v117 = v95[v116];
        int v118 = 0;
        bool v119 = v117 != v118;
        v110 = v110;
        v111 = v111;
        if (!v119) break;
        int v120 = v110 + v96;
        int v121 = 1;
        int v122 = v111 + v121;
        bool v123 = true;
        v110 = v120;
        v111 = v122;
      }
      v107 = v110;
      break;
    }
    case 1:
      {
      int v124 = 32;
      int v125 = v124 + v96;
      int v126 = v95[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 36;
        int v131 = v130 + v96;
        int v132 = v95[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        int v135;
        if (v134) {
          int v136 = 0;
          int v137 = v96 + v136;
          v135 = v137;
        } else {
          int v138 = 2;
          int v139 = v96 + v138;
          v135 = v139;
        }
        v129 = v135;
      } else {
        int v140 = 4;
        v129 = v140;
      }
      v107 = v129;
      break;
    }
    default:
      {
      int v141 = 40;
      int v142 = v141 + v96;
      int v143 = v95[v142];
      int v144;
      v144 = v96;
      switch (v143) {
        case 0:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v96;
            int v152 = 44;
            int v153 = v152 + v151;
            int v154 = v95[v153];
            int v155 = 0;
            bool v156 = v154 != v155;
            v147 = v147;
            v148 = v148;
            if (!v156) break;
            int v157 = v147 + v148;
            int v158 = 1;
            int v159 = v148 + v158;
            bool v160 = true;
            v147 = v157;
            v148 = v159;
          }
          v144 = v147;
          break;
        }
        case 1:
          {
          int v161 = 4;
          int v162 = v96 + v161;
          v144 = v162;
          break;
        }
        case 2:
          {
          int v163 = 64;
          int v164 = v163 + v96;
          int v165 = v95[v164];
          int v166;
          v166 = v96;
          switch (v165) {
            case 0:
              {
              int v167 = 3;
              int v168 = v96 + v167;
              v166 = v168;
            }
            default:
              {
              int v169 = 1;
              int v170 = v96 + v169;
              v166 = v170;
              break;
            }
          }
          v144 = v166;
          break;
        }
        default:
          {
          int v171 = 68;
          int v172 = v171 + v96;
          int v173 = v95[v172];
          int v174 = 2;
          int v175;
          v175 = v174;
          switch (v173) {
            case 0:
              {
              int v176 = 3;
              int v177 = v96 + v176;
              v175 = v177;
            }
            case 1:
              {
              int v178 = 3;
              int v179 = v96 + v178;
              v175 = v179;
              break;
            }
            case 2:
              {
              v175 = v96;
              break;
            }
            default:
              {
              v175 = v96;
              break;
            }
          }
          v144 = v175;
          break;
        }
      }
      bool v180 = true;
      v107 = v144;
      break;
    }
    case 2:
      {
      int v181 = 72;
      int v182 = v181 + v96;
      int v183 = v95[v182];
      int v184;
      v184 = v96;
      switch (v183) {
        case 0:
          {
          int v185 = 0;
          int v186 = 0;
          int v187;
          int v188;
          v187 = v185;
          v188 = v186;
          while (true) {
            int v189 = 4;
            int v190 = v188 * v189;
            int v191 = v190 + v96;
            int v192 = 76;
            int v193 = v192 + v191;
            int v194 = v95[v193];
            int v195 = 0;
            bool v196 = v194 != v195;
            v187 = v187;
            v188 = v188;
            if (!v196) break;
            int v197 = v187 + v188;
            int v198 = 1;
            int v199 = v188 + v198;
            bool v200 = true;
            v187 = v197;
            v188 = v199;
          }
          v184 = v187;
          break;
        }
        case 1:
          {
          int v201 = 0;
          int v202 = 0;
          int v203;
          int v204;
          v203 = v201;
          v204 = v202;
          while (true) {
            int v205 = 4;
            int v206 = v204 * v205;
            int v207 = v206 + v96;
            int v208 = 96;
            int v209 = v208 + v207;
            int v210 = v95[v209];
            int v211 = 0;
            bool v212 = v210 != v211;
            v203 = v203;
            v204 = v204;
            if (!v212) break;
            int v213 = v203 + v204;
            int v214 = 1;
            int v215 = v204 + v214;
            bool v216 = true;
            v203 = v213;
            v204 = v215;
            continue;
            ;
          }
          v184 = v203;
          break;
        }
        default:
          {
          int v217 = 116;
          int v218 = v217 + v96;
          int v219 = v95[v218];
          int v220 = 0;
          bool v221 = v219 != v220;
          int v222;
          if (v221) {
            int v223 = 4;
            int v224 = v96 + v223;
            v222 = v224;
          } else {
            int v225 = 4;
            v222 = v225;
          }
          v184 = v222;
          break;
        }
      }
      bool v226 = true;
      v107 = v184;
      break;
    }
  }
  bool v227 = true;
  int v228 = 32;
  int v229 = v228 + v96;
  bool v230 = true;
  int v231 = simt_wave_count_bits(v230);
  v94[v229] = v231;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
