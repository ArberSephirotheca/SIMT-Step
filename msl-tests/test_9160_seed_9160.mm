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
  int v5 = 3;
  int v6 = v3 % v5;
  uint v7 = simt_lane_id(__simt_tid);
  int v8 = (int)(v7);
  int v9;
  v9 = v8;
  switch (v6) {
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 4;
          v21 = v22;
        } else {
          v21 = v0;
        }
        int v23 = 1;
        int v24 = v13 + v23;
        v12 = v21;
        v13 = v24;
        continue;
        ;
      }
      int v25 = 4;
      int v26 = v0 + v25;
      v9 = v12;
      break;
    }
    case 1:
      {
      int v27 = 3;
      int v28 = v3 % v27;
      int v29 = 0;
      int v30 = v0 + v29;
      int v31;
      v31 = v30;
      switch (v28) {
        case 0:
          {
          int v32 = 2;
          int v33 = v3 % v32;
          int v34;
          v34 = v0;
          switch (v33) {
            default:
              {
              int v35 = 3;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            case 0:
              {
              int v37 = 0;
              v34 = v37;
              break;
            }
          }
          v31 = v34;
          break;
        }
        case 1:
          {
          int v38 = 3;
          int v39 = v3 % v38;
          int v40 = 2;
          int v41;
          v41 = v40;
          switch (v39) {
            case 0:
              {
              int v42 = 0;
              int v43 = v0 + v42;
              v41 = v43;
            }
            case 1:
              {
              int v44 = 1;
              int v45 = v0 + v44;
              v41 = v45;
            }
            default:
              {
              v41 = v0;
              break;
            }
          }
          v31 = v41;
          break;
        }
        default:
          {
          int v46 = 3;
          int v47 = v3 % v46;
          int v48 = 4;
          int v49 = v0 + v48;
          int v50;
          v50 = v49;
          switch (v47) {
            case 0:
              {
              v50 = v0;
              break;
            }
            case 1:
              {
              int v51 = 2;
              v50 = v51;
            }
            case 2:
              {
              v50 = v0;
              break;
            }
            default:
              {
              int v52 = 2;
              v50 = v52;
              break;
            }
          }
          int v53 = 4;
          v31 = v50;
          break;
        }
        case 2:
          {
          int v54 = 3;
          int v55 = v3 % v54;
          int v56 = 2;
          int v57;
          v57 = v56;
          switch (v55) {
            case 0:
              {
              v57 = v0;
            }
            case 1:
              {
              int v58 = 2;
              v57 = v58;
              break;
            }
            default:
              {
              int v59 = 3;
              v57 = v59;
              break;
            }
          }
          int v60 = 3;
          int v61 = v0 + v60;
          v31 = v57;
          break;
        }
      }
      int v62 = 3;
      int v63 = v0 + v62;
      v9 = v31;
      break;
    }
    case 2:
      {
      v9 = v0;
      break;
    }
    default:
      {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v3 % v68;
        int v70 = 1;
        int v71 = v69 + v70;
        bool v72 = v67 < v71;
        v66 = v66;
        v67 = v67;
        if (!v72) break;
        int v73 = 2;
        int v74 = v3 % v73;
        int v75 = 0;
        int v76 = v0 + v75;
        int v77;
        v77 = v76;
        switch (v74) {
          case 0:
            {
            int v78 = 0;
            int v79 = v0 + v78;
            v77 = v79;
            break;
          }
          default:
            {
            int v80 = 1;
            v77 = v80;
            break;
          }
          case 1:
            {
            int v81 = 3;
            v77 = v81;
            break;
          }
        }
        int v82 = 1;
        int v83 = v67 + v82;
        v66 = v77;
        v67 = v83;
        break;
        ;
      }
      int v84 = 2;
      int v85 = v0 + v84;
      v9 = v66;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  int v90 = 0;
  bool v91 = v2 != v90;
  int v92 = v91 ? v4 : v9;
  return;
}

kernel void kernel_main(device int* v93 [[buffer(0)]], device int* v94 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v95 = static_cast<int>(__simt_tid3.x);
  int v96 = 0;
  int v97 = v96 + v95;
  int v98 = v94[v97];
  int v99 = 4;
  int v100 = v99 + v95;
  int v101 = v94[v100];
  helper0(v95, v93, v98, v101, static_cast<int>(__simt_tid3.x));
  int v102 = 8;
  int v103 = v102 + v95;
  int v104 = v94[v103];
  int v105 = 0;
  bool v106 = v104 != v105;
  int v107;
  if (v106) {
    int v108 = 12;
    int v109 = v108 + v95;
    int v110 = v94[v109];
    int v111 = 4;
    int v112 = v95 + v111;
    int v113;
    v113 = v112;
    switch (v110) {
      case 0:
        {
        int v114 = 16;
        int v115 = v114 + v95;
        int v116 = v94[v115];
        int v117;
        v117 = v95;
        switch (v116) {
          default:
            {
            v117 = v95;
            break;
          }
          case 0:
            {
            int v118 = 2;
            int v119 = v95 + v118;
            v117 = v119;
            break;
          }
          case 1:
            {
            int v120 = 2;
            v117 = v120;
            break;
          }
          case 2:
            {
            int v121 = 4;
            int v122 = v95 + v121;
            v117 = v122;
            break;
          }
        }
        bool v123 = true;
        v113 = v117;
      }
      default:
        {
        int v124 = 0;
        v113 = v124;
      }
      case 1:
        {
        int v125 = 3;
        int v126 = v95 + v125;
        v113 = v126;
        break;
      }
    }
    bool v127 = true;
    v107 = v113;
  } else {
    int v128 = 20;
    int v129 = v128 + v95;
    int v130 = v94[v129];
    int v131 = 0;
    bool v132 = v130 != v131;
    int v133;
    if (v132) {
      uint v134 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v135 = (int)(v134);
      v133 = v135;
    } else {
      uint v136 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v137 = (int)(v136);
      v133 = v137;
    }
    v107 = v133;
  }
  int v138 = 16;
  int v139 = v138 + v95;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v93[v139] = v141;
  int v142 = 24;
  int v143 = v142 + v95;
  int v144 = v94[v143];
  int v145 = 2;
  int v146;
  v146 = v145;
  switch (v144) {
    case 0:
      {
      int v147 = 28;
      int v148 = v147 + v95;
      int v149 = v94[v148];
      int v150 = 3;
      int v151;
      v151 = v150;
      switch (v149) {
        case 0:
          {
          int v152 = 32;
          int v153 = v152 + v95;
          int v154 = v94[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          int v157;
          if (v156) {
            v157 = v95;
          } else {
            v157 = v95;
          }
          v151 = v157;
          break;
        }
        default:
          {
          int v158 = 2;
          v151 = v158;
          break;
        }
      }
      bool v159 = true;
      v146 = v151;
      break;
    }
    case 1:
      {
      int v160 = 2;
      int v161 = v95 + v160;
      v146 = v161;
    }
    case 2:
      {
      int v162 = 36;
      int v163 = v162 + v95;
      int v164 = v94[v163];
      int v165;
      v165 = v95;
      switch (v164) {
        default:
          {
          int v166 = 40;
          int v167 = v166 + v95;
          int v168 = v94[v167];
          int v169;
          v169 = v95;
          switch (v168) {
            case 0:
              {
              v169 = v95;
              break;
            }
            default:
              {
              v169 = v95;
              break;
            }
            case 1:
              {
              v169 = v95;
              break;
            }
            case 2:
              {
              int v170 = 4;
              int v171 = v95 + v170;
              v169 = v171;
              break;
            }
          }
          bool v172 = true;
          v165 = v169;
          break;
        }
        case 0:
          {
          int v173 = 4;
          int v174 = v95 + v173;
          v165 = v174;
          break;
        }
        case 1:
          {
          int v175 = 44;
          int v176 = v175 + v95;
          int v177 = v94[v176];
          int v178 = 4;
          int v179 = v95 + v178;
          int v180;
          v180 = v179;
          switch (v177) {
            case 0:
              {
              v180 = v95;
              break;
            }
            default:
              {
              v180 = v95;
              break;
            }
            case 1:
              {
              v180 = v95;
              break;
            }
          }
          bool v181 = true;
          v165 = v180;
          break;
        }
      }
      bool v182 = true;
      v146 = v165;
    }
    default:
      {
      int v183 = 48;
      int v184 = v183 + v95;
      int v185 = v94[v184];
      int v186 = 0;
      int v187;
      v187 = v186;
      switch (v185) {
        case 0:
          {
          int v188 = 0;
          int v189 = 0;
          int v190;
          int v191;
          v190 = v188;
          v191 = v189;
          while (true) {
            int v192 = 4;
            int v193 = v191 * v192;
            int v194 = v193 + v95;
            int v195 = 52;
            int v196 = v195 + v194;
            int v197 = v94[v196];
            int v198 = 0;
            bool v199 = v197 != v198;
            v190 = v190;
            v191 = v191;
            if (!v199) break;
            int v200 = v190 + v191;
            int v201 = 1;
            int v202 = v191 + v201;
            v190 = v200;
            v191 = v202;
          }
          bool v203 = true;
          v187 = v190;
          break;
        }
        case 1:
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
            int v210 = v209 + v95;
            int v211 = 72;
            int v212 = v211 + v210;
            int v213 = v94[v212];
            int v214 = 0;
            bool v215 = v213 != v214;
            v206 = v206;
            v207 = v207;
            if (!v215) break;
            int v216 = v206 + v207;
            int v217 = 1;
            int v218 = v207 + v217;
            v206 = v216;
            v207 = v218;
          }
          bool v219 = true;
          v187 = v206;
          break;
        }
        case 2:
          {
          int v220 = 92;
          int v221 = v220 + v95;
          int v222 = v94[v221];
          int v223 = 0;
          bool v224 = v222 != v223;
          int v225;
          if (v224) {
            v225 = v95;
          } else {
            int v226 = 0;
            int v227 = v95 + v226;
            v225 = v227;
          }
          v187 = v225;
          break;
        }
        default:
          {
          int v228 = 96;
          int v229 = v228 + v95;
          int v230 = v94[v229];
          int v231 = 0;
          bool v232 = v230 != v231;
          int v233;
          if (v232) {
            v233 = v95;
          } else {
            int v234 = 4;
            int v235 = v95 + v234;
            v233 = v235;
          }
          v187 = v233;
          break;
        }
      }
      bool v236 = true;
      v146 = v187;
      break;
    }
  }
  bool v237 = true;
  int v238 = 32;
  int v239 = v238 + v95;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v93[v239] = v241;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
