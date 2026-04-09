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
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10 = 4;
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
            int v22 = 2;
            int v23 = v0 + v22;
            int v24 = 1;
            int v25 = v16 + v24;
            v15 = v23;
            v16 = v25;
          }
          v12 = v15;
          break;
        }
        case 1:
          {
          int v26 = 2;
          int v27 = v3 % v26;
          int v28 = 1;
          int v29;
          v29 = v28;
          switch (v27) {
            case 0:
              {
              int v30 = 2;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
            case 1:
              {
              int v32 = 2;
              v29 = v32;
              break;
            }
            default:
              {
              int v33 = 0;
              int v34 = v0 + v33;
              v29 = v34;
              break;
            }
          }
          v12 = v29;
        }
        default:
          {
          int v35 = 4;
          v12 = v35;
          break;
        }
      }
      v7 = v12;
      break;
    }
    default:
      {
      int v36 = 3;
      int v37 = v3 % v36;
      int v38 = 1;
      int v39;
      v39 = v38;
      switch (v37) {
        case 0:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 0;
            int v50 = 1;
            int v51 = v43 + v50;
            v42 = v49;
            v43 = v51;
          }
          v39 = v42;
        }
        case 1:
          {
          int v52 = 0;
          v39 = v52;
          break;
        }
        case 2:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            int v56 = 1;
            int v57 = v0 + v56;
            v55 = v57;
          } else {
            int v58 = 4;
            v55 = v58;
          }
          v39 = v55;
          break;
        }
        default:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            int v62 = 4;
            v61 = v62;
          } else {
            v61 = v0;
          }
          v39 = v61;
          break;
        }
      }
      v7 = v39;
      break;
    }
    case 1:
      {
      int v63 = 2;
      int v64 = v3 % v63;
      int v65 = 3;
      int v66 = v0 + v65;
      int v67;
      v67 = v66;
      switch (v64) {
        case 0:
          {
          int v68 = 0;
          int v69 = 0;
          int v70;
          int v71;
          v70 = v68;
          v71 = v69;
          while (true) {
            int v72 = 4;
            int v73 = v3 % v72;
            int v74 = 1;
            int v75 = v73 + v74;
            bool v76 = v71 < v75;
            v70 = v70;
            v71 = v71;
            if (!v76) break;
            int v77 = 2;
            int v78 = v0 + v77;
            int v79 = 1;
            int v80 = v71 + v79;
            v70 = v78;
            v71 = v80;
          }
          v67 = v70;
          break;
        }
        case 1:
          {
          int v81 = 2;
          v67 = v81;
          break;
        }
        default:
          {
          int v82 = 2;
          int v83 = v3 % v82;
          int v84 = 4;
          int v85 = v0 + v84;
          int v86;
          v86 = v85;
          switch (v83) {
            default:
              {
              int v87 = 0;
              int v88 = v0 + v87;
              v86 = v88;
              break;
            }
            case 0:
              {
              int v89 = 3;
              int v90 = v0 + v89;
              v86 = v90;
              break;
            }
          }
          int v91 = 2;
          v67 = v86;
          break;
        }
      }
      v7 = v67;
      break;
    }
  }
  bool v92 = true;
  int v93 = simt_wave_count_bits(v92);
  int v94 = 0;
  int v95 = v94 + v0;
  v1[v95] = v93;
  return;
}

kernel void kernel_main(device int* v96 [[buffer(0)]], device int* v97 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v98 = static_cast<int>(__simt_tid3.x);
  int v99 = 0;
  int v100 = v99 + v98;
  int v101 = v97[v100];
  int v102 = 4;
  int v103 = v102 + v98;
  int v104 = v97[v103];
  helper0(v98, v96, v101, v104, static_cast<int>(__simt_tid3.x));
  uint v105 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v106 = (int)(v105);
  int v107 = 8;
  int v108 = v107 + v98;
  int v109 = v97[v108];
  int v110;
  v110 = v98;
  switch (v109) {
    case 0:
      {
      int v111 = 12;
      int v112 = v111 + v98;
      int v113 = v97[v112];
      int v114 = 2;
      int v115;
      v115 = v114;
      switch (v113) {
        case 0:
          {
          int v116 = 2;
          int v117 = v98 + v116;
          v115 = v117;
          break;
        }
        case 1:
          {
          int v118 = 0;
          int v119 = 0;
          int v120;
          int v121;
          v120 = v118;
          v121 = v119;
          while (true) {
            int v122 = 4;
            int v123 = v121 * v122;
            int v124 = v123 + v98;
            int v125 = 16;
            int v126 = v125 + v124;
            int v127 = v97[v126];
            int v128 = 0;
            bool v129 = v127 != v128;
            v120 = v120;
            v121 = v121;
            if (!v129) break;
            int v130 = v120 + v121;
            int v131 = 1;
            int v132 = v121 + v131;
            bool v133 = true;
            v120 = v130;
            v121 = v132;
            break;
            ;
          }
          v115 = v120;
          break;
        }
        default:
          {
          int v134 = 36;
          int v135 = v134 + v98;
          int v136 = v97[v135];
          int v137 = 0;
          bool v138 = v136 != v137;
          int v139;
          if (v138) {
            int v140 = 4;
            int v141 = v98 + v140;
            v139 = v141;
          } else {
            v139 = v98;
          }
          v115 = v139;
          break;
        }
        case 2:
          {
          int v142 = 40;
          int v143 = v142 + v98;
          int v144 = v97[v143];
          int v145 = 0;
          bool v146 = v144 != v145;
          int v147;
          if (v146) {
            int v148 = 0;
            v147 = v148;
          } else {
            int v149 = 2;
            v147 = v149;
          }
          v115 = v147;
          break;
        }
      }
      v110 = v115;
    }
    case 1:
      {
      int v150 = 0;
      int v151 = 0;
      int v152;
      int v153;
      v152 = v150;
      v153 = v151;
      while (true) {
        int v154 = 4;
        int v155 = v153 * v154;
        int v156 = v155 + v98;
        int v157 = 44;
        int v158 = v157 + v156;
        int v159 = v97[v158];
        int v160 = 0;
        bool v161 = v159 != v160;
        v152 = v152;
        v153 = v153;
        if (!v161) break;
        int v162 = 64;
        int v163 = v162 + v98;
        int v164 = v97[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        int v167;
        if (v166) {
          v167 = v98;
        } else {
          v167 = v98;
        }
        int v168 = v152 + v167;
        int v169 = 1;
        int v170 = v153 + v169;
        bool v171 = true;
        v152 = v168;
        v153 = v170;
        break;
        ;
      }
      v110 = v152;
    }
    default:
      {
      int v172 = 68;
      int v173 = v172 + v98;
      int v174 = v97[v173];
      int v175 = 0;
      bool v176 = v174 != v175;
      int v177;
      if (v176) {
        int v178 = 72;
        int v179 = v178 + v98;
        int v180 = v97[v179];
        int v181 = 3;
        int v182 = v98 + v181;
        int v183;
        v183 = v182;
        switch (v180) {
          case 0:
            {
            int v184 = 0;
            int v185 = v98 + v184;
            v183 = v185;
            break;
          }
          default:
            {
            int v186 = 4;
            int v187 = v98 + v186;
            v183 = v187;
            break;
          }
        }
        v177 = v183;
      } else {
        int v188 = 0;
        int v189 = 0;
        int v190;
        int v191;
        v190 = v188;
        v191 = v189;
        while (true) {
          int v192 = 4;
          int v193 = v191 * v192;
          int v194 = v193 + v98;
          int v195 = 76;
          int v196 = v195 + v194;
          int v197 = v97[v196];
          int v198 = 0;
          bool v199 = v197 != v198;
          v190 = v190;
          v191 = v191;
          if (!v199) break;
          int v200 = v190 + v191;
          int v201 = 1;
          int v202 = v191 + v201;
          bool v203 = true;
          v190 = v200;
          v191 = v202;
        }
        v177 = v190;
      }
      v110 = v177;
      break;
    }
  }
  int v204 = 96;
  int v205 = v204 + v98;
  int v206 = v97[v205];
  int v207 = 0;
  bool v208 = v206 != v207;
  int v209;
  if (v208) {
    int v210 = 100;
    int v211 = v210 + v98;
    int v212 = v97[v211];
    int v213 = 0;
    int v214 = v98 + v213;
    int v215;
    v215 = v214;
    switch (v212) {
      case 0:
        {
        int v216 = 104;
        int v217 = v216 + v98;
        int v218 = v97[v217];
        int v219 = 0;
        bool v220 = v218 != v219;
        int v221;
        if (v220) {
          int v222 = 2;
          v221 = v222;
        } else {
          int v223 = 0;
          v221 = v223;
        }
        v215 = v221;
      }
      case 1:
        {
        int v224 = 0;
        int v225 = 0;
        int v226;
        int v227;
        v226 = v224;
        v227 = v225;
        while (true) {
          int v228 = 4;
          int v229 = v227 * v228;
          int v230 = v229 + v98;
          int v231 = 108;
          int v232 = v231 + v230;
          int v233 = v97[v232];
          int v234 = 0;
          bool v235 = v233 != v234;
          v226 = v226;
          v227 = v227;
          if (!v235) break;
          int v236 = v226 + v227;
          int v237 = 1;
          int v238 = v227 + v237;
          bool v239 = true;
          v226 = v236;
          v227 = v238;
        }
        v215 = v226;
        break;
      }
      default:
        {
        int v240 = 128;
        int v241 = v240 + v98;
        int v242 = v97[v241];
        int v243 = 1;
        int v244 = v98 + v243;
        int v245;
        v245 = v244;
        switch (v242) {
          default:
            {
            v245 = v98;
            break;
          }
          case 0:
            {
            v245 = v98;
            break;
          }
        }
        v215 = v245;
        break;
      }
    }
    v209 = v215;
  } else {
    int v246 = 3;
    int v247 = v98 + v246;
    v209 = v247;
  }
  int v248 = 16;
  int v249 = v248 + v98;
  bool v250 = true;
  int v251 = simt_wave_count_bits(v250);
  v96[v249] = v251;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
