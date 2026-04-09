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
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
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
        int v26 = v19 + v25;
        v18 = v0;
        v19 = v26;
      }
      int v27 = 4;
      int v28 = 1;
      int v29 = v10 + v28;
      v9 = v18;
      v10 = v29;
      continue;
      ;
    }
    int v30 = 3;
    v6 = v9;
  } else {
    int v31 = 3;
    int v32 = v3 % v31;
    int v33;
    v33 = v0;
    switch (v32) {
      case 0:
        {
        int v34 = 3;
        int v35 = v3 % v34;
        int v36 = 0;
        int v37;
        v37 = v36;
        switch (v35) {
          default:
            {
            int v38 = 0;
            v37 = v38;
            break;
          }
          case 0:
            {
            v37 = v0;
            break;
          }
          case 1:
            {
            v37 = v0;
            break;
          }
        }
        int v39 = 3;
        v33 = v37;
        break;
      }
      case 1:
        {
        int v40 = 0;
        bool v41 = v2 != v40;
        int v42;
        if (v41) {
          v42 = v0;
        } else {
          int v43 = 4;
          v42 = v43;
        }
        int v44 = 3;
        v33 = v42;
      }
      case 2:
        {
        int v45 = 1;
        int v46 = v0 + v45;
        v33 = v46;
        break;
      }
      default:
        {
        int v47 = 3;
        int v48 = v3 % v47;
        int v49 = 4;
        int v50;
        v50 = v49;
        switch (v48) {
          case 0:
            {
            int v51 = 3;
            v50 = v51;
            break;
          }
          default:
            {
            int v52 = 3;
            v50 = v52;
            break;
          }
          case 1:
            {
            int v53 = 1;
            v50 = v53;
          }
          case 2:
            {
            v50 = v0;
            break;
          }
        }
        v33 = v50;
        break;
      }
    }
    uint v54 = simt_lane_id(__simt_tid);
    int v55 = (int)(v54);
    v6 = v33;
  }
  bool v56 = true;
  int v57 = simt_wave_count_bits(v56);
  int v58 = 0;
  int v59 = v58 + v0;
  v1[v59] = v57;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    int v75 = 12;
    int v76 = v75 + v62;
    int v77 = v61[v76];
    int v78 = 0;
    int v79 = v62 + v78;
    int v80;
    v80 = v79;
    switch (v77) {
      case 0:
        {
        int v81 = 16;
        int v82 = v81 + v62;
        int v83 = v61[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        int v86;
        if (v85) {
          v86 = v62;
        } else {
          int v87 = 4;
          v86 = v87;
        }
        v80 = v86;
        break;
      }
      default:
        {
        int v88 = 20;
        int v89 = v88 + v62;
        int v90 = v61[v89];
        int v91 = 3;
        int v92;
        v92 = v91;
        switch (v90) {
          default:
            {
            int v93 = 1;
            int v94 = v62 + v93;
            v92 = v94;
          }
          case 0:
            {
            v92 = v62;
          }
          case 1:
            {
            v92 = v62;
          }
          case 2:
            {
            v92 = v62;
            break;
          }
        }
        bool v95 = true;
        v80 = v92;
        break;
      }
    }
    bool v96 = true;
    v74 = v80;
  } else {
    int v97 = 24;
    int v98 = v97 + v62;
    int v99 = v61[v98];
    int v100 = 0;
    int v101;
    v101 = v100;
    switch (v99) {
      case 0:
        {
        int v102 = 0;
        int v103 = 0;
        int v104;
        int v105;
        v104 = v102;
        v105 = v103;
        while (true) {
          int v106 = 4;
          int v107 = v105 * v106;
          int v108 = v107 + v62;
          int v109 = 28;
          int v110 = v109 + v108;
          int v111 = v61[v110];
          int v112 = 0;
          bool v113 = v111 != v112;
          v104 = v104;
          v105 = v105;
          if (!v113) break;
          int v114 = v104 + v105;
          int v115 = 1;
          int v116 = v105 + v115;
          v104 = v114;
          v105 = v116;
        }
        bool v117 = true;
        v101 = v104;
        break;
      }
      default:
        {
        int v118 = 48;
        int v119 = v118 + v62;
        int v120 = v61[v119];
        int v121 = 4;
        int v122 = v62 + v121;
        int v123;
        v123 = v122;
        switch (v120) {
          case 0:
            {
            v123 = v62;
            break;
          }
          case 1:
            {
            int v124 = 4;
            int v125 = v62 + v124;
            v123 = v125;
            break;
          }
          default:
            {
            v123 = v62;
            break;
          }
        }
        bool v126 = true;
        v101 = v123;
        break;
      }
      case 1:
        {
        int v127 = 2;
        v101 = v127;
        break;
      }
    }
    bool v128 = true;
    v74 = v101;
  }
  int v129 = 16;
  int v130 = v129 + v62;
  bool v131 = true;
  int v132 = simt_wave_count_bits(v131);
  v60[v130] = v132;
  uint v133 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v134 = (int)(v133);
  int v135 = 52;
  int v136 = v135 + v62;
  int v137 = v61[v136];
  uint v138 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v139 = (int)(v138);
  int v140;
  v140 = v139;
  switch (v137) {
    case 0:
      {
      int v141 = 56;
      int v142 = v141 + v62;
      int v143 = v61[v142];
      int v144 = 2;
      int v145 = v62 + v144;
      int v146;
      v146 = v145;
      switch (v143) {
        case 0:
          {
          int v147 = 2;
          int v148 = v62 + v147;
          v146 = v148;
          break;
        }
        default:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v62;
            int v156 = 60;
            int v157 = v156 + v155;
            int v158 = v61[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            v151 = v161;
            v152 = v163;
            continue;
            ;
          }
          bool v164 = true;
          v146 = v151;
          break;
        }
      }
      bool v165 = true;
      v140 = v146;
      break;
    }
    case 1:
      {
      int v166 = 80;
      int v167 = v166 + v62;
      int v168 = v61[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 0;
        int v173 = 0;
        int v174;
        int v175;
        v174 = v172;
        v175 = v173;
        while (true) {
          int v176 = 4;
          int v177 = v175 * v176;
          int v178 = v177 + v62;
          int v179 = 84;
          int v180 = v179 + v178;
          int v181 = v61[v180];
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
          continue;
          ;
        }
        bool v187 = true;
        v171 = v174;
      } else {
        int v188 = 104;
        int v189 = v188 + v62;
        int v190 = v61[v189];
        int v191 = 0;
        bool v192 = v190 != v191;
        int v193;
        if (v192) {
          int v194 = 2;
          v193 = v194;
        } else {
          v193 = v62;
        }
        v171 = v193;
      }
      v140 = v171;
      break;
    }
    case 2:
      {
      int v195 = 108;
      int v196 = v195 + v62;
      int v197 = v61[v196];
      int v198 = 0;
      bool v199 = v197 != v198;
      int v200;
      if (v199) {
        v200 = v62;
      } else {
        int v201 = 0;
        int v202 = 0;
        int v203;
        int v204;
        v203 = v201;
        v204 = v202;
        while (true) {
          int v205 = 4;
          int v206 = v204 * v205;
          int v207 = v206 + v62;
          int v208 = 112;
          int v209 = v208 + v207;
          int v210 = v61[v209];
          int v211 = 0;
          bool v212 = v210 != v211;
          v203 = v203;
          v204 = v204;
          if (!v212) break;
          int v213 = v203 + v204;
          int v214 = 1;
          int v215 = v204 + v214;
          v203 = v213;
          v204 = v215;
        }
        bool v216 = true;
        v200 = v203;
      }
      v140 = v200;
      break;
    }
    default:
      {
      int v217 = 132;
      int v218 = v217 + v62;
      int v219 = v61[v218];
      int v220 = 2;
      int v221 = v62 + v220;
      int v222;
      v222 = v221;
      switch (v219) {
        case 0:
          {
          int v223 = 136;
          int v224 = v223 + v62;
          int v225 = v61[v224];
          int v226 = 0;
          int v227;
          v227 = v226;
          switch (v225) {
            default:
              {
              int v228 = 3;
              int v229 = v62 + v228;
              v227 = v229;
            }
            case 0:
              {
              int v230 = 4;
              v227 = v230;
              break;
            }
          }
          bool v231 = true;
          v222 = v227;
          break;
        }
        case 1:
          {
          int v232 = 4;
          v222 = v232;
          break;
        }
        case 2:
          {
          int v233 = 140;
          int v234 = v233 + v62;
          int v235 = v61[v234];
          int v236;
          v236 = v62;
          switch (v235) {
            default:
              {
              v236 = v62;
              break;
            }
            case 0:
              {
              v236 = v62;
              break;
            }
          }
          bool v237 = true;
          v222 = v236;
          break;
        }
        default:
          {
          int v238 = 144;
          int v239 = v238 + v62;
          int v240 = v61[v239];
          int v241;
          v241 = v62;
          switch (v240) {
            case 0:
              {
              v241 = v62;
              break;
            }
            case 1:
              {
              int v242 = 2;
              int v243 = v62 + v242;
              v241 = v243;
              break;
            }
            case 2:
              {
              v241 = v62;
            }
            default:
              {
              int v244 = 4;
              int v245 = v62 + v244;
              v241 = v245;
              break;
            }
          }
          bool v246 = true;
          v222 = v241;
          break;
        }
      }
      bool v247 = true;
      v140 = v222;
      break;
    }
  }
  bool v248 = true;
  int v249 = 32;
  int v250 = v249 + v62;
  bool v251 = true;
  int v252 = simt_wave_count_bits(v251);
  v60[v250] = v252;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 148; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
