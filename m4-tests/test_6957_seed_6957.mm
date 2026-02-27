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
    bool v17 = true;
    int v18 = simt_wave_count_bits(v17);
    int v19 = 16;
    int v20 = 4;
    int v21 = v11 * v20;
    int v22 = v19 + v21;
    int v23 = v22 + v0;
    v1[v23] = v18;
    int v24 = 1;
    int v25 = v11 + v24;
    v10 = v18;
    v11 = v25;
  }
  int v26 = 0;
  bool v27 = v2 != v26;
  int v28 = v27 ? v5 : v10;
  int v29 = 2;
  int v30 = v3 % v29;
  int v31 = 1;
  int v32 = v0 + v31;
  int v33;
  v33 = v32;
  switch (v30) {
    case 0:
      {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39;
        v39 = v0;
        switch (v38) {
          default:
            {
            v39 = v0;
            break;
          }
          case 0:
            {
            int v40 = 2;
            v39 = v40;
            break;
          }
          case 1:
            {
            int v41 = 0;
            v39 = v41;
            break;
          }
        }
        v36 = v39;
      } else {
        int v42 = 2;
        int v43 = v3 % v42;
        int v44;
        v44 = v0;
        switch (v43) {
          default:
            {
            int v45 = 2;
            v44 = v45;
            break;
          }
          case 0:
            {
            int v46 = 4;
            int v47 = v0 + v46;
            v44 = v47;
            break;
          }
          case 1:
            {
            int v48 = 4;
            int v49 = v0 + v48;
            v44 = v49;
            break;
          }
        }
        v36 = v44;
      }
      v33 = v36;
      break;
    }
    default:
      {
      int v50 = 1;
      v33 = v50;
      break;
    }
    case 1:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 2;
        int v55 = v3 % v54;
        int v56 = 1;
        int v57 = v0 + v56;
        int v58;
        v58 = v57;
        switch (v55) {
          case 0:
            {
            int v59 = 0;
            v58 = v59;
            break;
          }
          default:
            {
            int v60 = 3;
            int v61 = v0 + v60;
            v58 = v61;
            break;
          }
        }
        v53 = v58;
      } else {
        int v62 = 0;
        int v63 = 0;
        int v64;
        int v65;
        v64 = v62;
        v65 = v63;
        while (true) {
          int v66 = 4;
          int v67 = v3 % v66;
          int v68 = 1;
          int v69 = v67 + v68;
          bool v70 = v65 < v69;
          v64 = v64;
          v65 = v65;
          if (!v70) break;
          int v71 = 0;
          int v72 = v0 + v71;
          int v73 = 1;
          int v74 = v65 + v73;
          v64 = v72;
          v65 = v74;
        }
        v53 = v64;
      }
      v33 = v53;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 32;
  int v78 = v77 + v0;
  v1[v78] = v76;
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v28 : v33;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  uint v94 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v95 = (int)(v94);
  int v96;
  v96 = v95;
  switch (v93) {
    case 0:
      {
      int v97 = 12;
      int v98 = v97 + v84;
      int v99 = v83[v98];
      int v100;
      v100 = v84;
      switch (v99) {
        case 0:
          {
          int v101 = 0;
          int v102 = 0;
          int v103;
          int v104;
          v103 = v101;
          v104 = v102;
          while (true) {
            int v105 = 4;
            int v106 = v104 * v105;
            int v107 = v106 + v84;
            int v108 = 16;
            int v109 = v108 + v107;
            int v110 = v83[v109];
            int v111 = 0;
            bool v112 = v110 != v111;
            v103 = v103;
            v104 = v104;
            if (!v112) break;
            int v113 = v103 + v104;
            int v114 = 1;
            int v115 = v104 + v114;
            bool v116 = true;
            v103 = v113;
            v104 = v115;
          }
          v100 = v103;
          break;
        }
        case 1:
          {
          int v117 = 36;
          int v118 = v117 + v84;
          int v119 = v83[v118];
          int v120 = 0;
          int v121;
          v121 = v120;
          switch (v119) {
            case 0:
              {
              int v122 = 0;
              v121 = v122;
              break;
            }
            default:
              {
              v121 = v84;
              break;
            }
          }
          v100 = v121;
        }
        default:
          {
          int v123 = 3;
          int v124 = v84 + v123;
          v100 = v124;
          break;
        }
        case 2:
          {
          int v125 = 40;
          int v126 = v125 + v84;
          int v127 = v83[v126];
          int v128;
          v128 = v84;
          switch (v127) {
            case 0:
              {
              int v129 = 0;
              v128 = v129;
              break;
            }
            case 1:
              {
              v128 = v84;
              break;
            }
            case 2:
              {
              int v130 = 1;
              v128 = v130;
              break;
            }
            default:
              {
              int v131 = 3;
              v128 = v131;
              break;
            }
          }
          v100 = v128;
          break;
        }
      }
      v96 = v100;
      break;
    }
    case 1:
      {
      int v132 = 44;
      int v133 = v132 + v84;
      int v134 = v83[v133];
      int v135;
      v135 = v84;
      switch (v134) {
        case 0:
          {
          int v136 = 48;
          int v137 = v136 + v84;
          int v138 = v83[v137];
          int v139 = 3;
          int v140 = v84 + v139;
          int v141;
          v141 = v140;
          switch (v138) {
            default:
              {
              int v142 = 4;
              v141 = v142;
              break;
            }
            case 0:
              {
              v141 = v84;
            }
            case 1:
              {
              int v143 = 1;
              int v144 = v84 + v143;
              v141 = v144;
            }
            case 2:
              {
              int v145 = 1;
              int v146 = v84 + v145;
              v141 = v146;
              break;
            }
          }
          bool v147 = true;
          v135 = v141;
          break;
        }
        default:
          {
          int v148 = 52;
          int v149 = v148 + v84;
          int v150 = v83[v149];
          int v151 = 2;
          int v152;
          v152 = v151;
          switch (v150) {
            case 0:
              {
              int v153 = 1;
              v152 = v153;
            }
            case 1:
              {
              int v154 = 0;
              int v155 = v84 + v154;
              v152 = v155;
              break;
            }
            case 2:
              {
              int v156 = 4;
              int v157 = v84 + v156;
              v152 = v157;
              break;
            }
            default:
              {
              int v158 = 0;
              v152 = v158;
              break;
            }
          }
          v135 = v152;
          break;
        }
        case 1:
          {
          int v159 = 56;
          int v160 = v159 + v84;
          int v161 = v83[v160];
          int v162 = 4;
          int v163 = v84 + v162;
          int v164;
          v164 = v163;
          switch (v161) {
            case 0:
              {
              v164 = v84;
              break;
            }
            default:
              {
              int v165 = 4;
              v164 = v165;
              break;
            }
          }
          v135 = v164;
          break;
        }
        case 2:
          {
          int v166 = 60;
          int v167 = v166 + v84;
          int v168 = v83[v167];
          int v169;
          v169 = v84;
          switch (v168) {
            default:
              {
              int v170 = 3;
              v169 = v170;
              break;
            }
            case 0:
              {
              v169 = v84;
              break;
            }
            case 1:
              {
              v169 = v84;
              break;
            }
          }
          v135 = v169;
          break;
        }
      }
      bool v171 = true;
      v96 = v135;
      break;
    }
    default:
      {
      int v172 = 0;
      int v173 = 0;
      int v174;
      int v175;
      v174 = v172;
      v175 = v173;
      while (true) {
        int v176 = 4;
        int v177 = v175 * v176;
        int v178 = v177 + v84;
        int v179 = 64;
        int v180 = v179 + v178;
        int v181 = v83[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = 84;
        int v185 = v184 + v84;
        int v186 = v83[v185];
        int v187 = 0;
        bool v188 = v186 != v187;
        int v189;
        if (v188) {
          int v190 = 0;
          int v191 = v84 + v190;
          v189 = v191;
        } else {
          int v192 = 3;
          int v193 = v84 + v192;
          v189 = v193;
        }
        int v194 = v174 + v189;
        int v195 = 1;
        int v196 = v175 + v195;
        bool v197 = true;
        v174 = v194;
        v175 = v196;
        continue;
        ;
      }
      v96 = v174;
      break;
    }
  }
  int v198 = 88;
  int v199 = v198 + v84;
  int v200 = v83[v199];
  int v201 = 2;
  int v202 = v84 + v201;
  int v203;
  v203 = v202;
  switch (v200) {
    case 0:
      {
      int v204 = 0;
      int v205 = 0;
      int v206;
      int v207;
      v206 = v204;
      v207 = v205;
      while (true) {
        int v208 = 4;
        int v209 = v207 * v208;
        int v210 = v209 + v84;
        int v211 = 92;
        int v212 = v211 + v210;
        int v213 = v83[v212];
        int v214 = 0;
        bool v215 = v213 != v214;
        v206 = v206;
        v207 = v207;
        if (!v215) break;
        int v216 = v206 + v207;
        int v217 = 1;
        int v218 = v207 + v217;
        bool v219 = true;
        v206 = v216;
        v207 = v218;
      }
      v203 = v206;
      break;
    }
    default:
      {
      int v220 = 112;
      int v221 = v220 + v84;
      int v222 = v83[v221];
      int v223;
      v223 = v84;
      switch (v222) {
        case 0:
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
            int v230 = v229 + v84;
            int v231 = 116;
            int v232 = v231 + v230;
            int v233 = v83[v232];
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
          v223 = v226;
        }
        default:
          {
          int v240 = 2;
          int v241 = v84 + v240;
          v223 = v241;
          break;
        }
        case 1:
          {
          int v242 = 136;
          int v243 = v242 + v84;
          int v244 = v83[v243];
          int v245 = 1;
          int v246;
          v246 = v245;
          switch (v244) {
            default:
              {
              v246 = v84;
            }
            case 0:
              {
              int v247 = 4;
              v246 = v247;
              break;
            }
          }
          v223 = v246;
          break;
        }
      }
      v203 = v223;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
