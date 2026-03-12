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
  int v6 = 0;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9;
      v9 = v0;
      switch (v3) {
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
            int v19 = 1;
            int v20 = v0 + v19;
            int v21 = 1;
            int v22 = v13 + v21;
            v12 = v20;
            v13 = v22;
          }
          v9 = v12;
        }
        default:
          {
          int v23 = 2;
          int v24 = v3 % v23;
          int v25 = 2;
          int v26 = v0 + v25;
          int v27;
          v27 = v26;
          switch (v24) {
            default:
              {
              int v28 = 4;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
            case 0:
              {
              v27 = v0;
              break;
            }
            case 1:
              {
              int v30 = 4;
              int v31 = v0 + v30;
              v27 = v31;
              break;
            }
          }
          int v32 = 1;
          v9 = v27;
          break;
        }
      }
      v8 = v9;
      break;
    }
    case 1:
      {
      int v33 = 0;
      bool v34 = v2 != v33;
      int v35;
      if (v34) {
        int v36 = 4;
        v35 = v36;
      } else {
        int v37 = 3;
        int v38 = v3 % v37;
        int v39 = 3;
        int v40 = v0 + v39;
        int v41;
        v41 = v40;
        switch (v38) {
          default:
            {
            int v42 = 4;
            v41 = v42;
            break;
          }
          case 0:
            {
            int v43 = 1;
            v41 = v43;
            break;
          }
          case 1:
            {
            int v44 = 0;
            v41 = v44;
            break;
          }
        }
        v35 = v41;
      }
      v8 = v35;
      break;
    }
    case 2:
      {
      int v45 = 3;
      int v46 = v3 % v45;
      int v47 = 3;
      int v48;
      v48 = v47;
      switch (v46) {
        case 0:
          {
          int v49 = 4;
          int v50 = v3 % v49;
          int v51 = 1;
          int v52 = v0 + v51;
          int v53;
          v53 = v52;
          switch (v50) {
            case 0:
              {
              int v54 = 4;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            default:
              {
              int v56 = 0;
              int v57 = v0 + v56;
              v53 = v57;
              break;
            }
            case 1:
              {
              int v58 = 4;
              v53 = v58;
              break;
            }
            case 2:
              {
              int v59 = 3;
              int v60 = v0 + v59;
              v53 = v60;
              break;
            }
          }
          int v61 = 2;
          int v62 = v0 + v61;
          v48 = v53;
          break;
        }
        default:
          {
          int v63 = 0;
          int v64 = 0;
          int v65;
          int v66;
          v65 = v63;
          v66 = v64;
          while (true) {
            int v67 = 4;
            int v68 = v3 % v67;
            int v69 = 1;
            int v70 = v68 + v69;
            bool v71 = v66 < v70;
            v65 = v65;
            v66 = v66;
            if (!v71) break;
            int v72 = 4;
            int v73 = v0 + v72;
            int v74 = 1;
            int v75 = v66 + v74;
            v65 = v73;
            v66 = v75;
          }
          v48 = v65;
          break;
        }
        case 1:
          {
          int v76 = 3;
          int v77 = v3 % v76;
          int v78;
          v78 = v0;
          switch (v77) {
            case 0:
              {
              v78 = v0;
            }
            case 1:
              {
              int v79 = 0;
              v78 = v79;
              break;
            }
            default:
              {
              int v80 = 2;
              int v81 = v0 + v80;
              v78 = v81;
              break;
            }
          }
          v48 = v78;
          break;
        }
        case 2:
          {
          int v82 = 2;
          v48 = v82;
          break;
        }
      }
      int v83 = 2;
      int v84 = v0 + v83;
      v8 = v48;
      break;
    }
    default:
      {
      int v85 = 2;
      int v86 = v3 % v85;
      int v87 = 1;
      int v88 = v0 + v87;
      int v89;
      v89 = v88;
      switch (v86) {
        case 0:
          {
          int v90 = 2;
          int v91 = v3 % v90;
          int v92 = 1;
          int v93;
          v93 = v92;
          switch (v91) {
            default:
              {
              v93 = v0;
              break;
            }
            case 0:
              {
              int v94 = 3;
              int v95 = v0 + v94;
              v93 = v95;
              break;
            }
            case 1:
              {
              v93 = v0;
              break;
            }
          }
          v89 = v93;
          break;
        }
        default:
          {
          int v96 = 0;
          bool v97 = v2 != v96;
          int v98;
          if (v97) {
            v98 = v0;
          } else {
            v98 = v0;
          }
          v89 = v98;
        }
        case 1:
          {
          int v99 = 0;
          bool v100 = v2 != v99;
          int v101;
          if (v100) {
            int v102 = 2;
            int v103 = v0 + v102;
            v101 = v103;
          } else {
            v101 = v0;
          }
          v89 = v101;
          break;
        }
      }
      int v104 = 3;
      v8 = v89;
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
  int v118 = 0;
  int v119 = 0;
  int v120;
  int v121;
  v120 = v118;
  v121 = v119;
  while (true) {
    int v122 = 4;
    int v123 = v121 * v122;
    int v124 = v123 + v111;
    int v125 = 8;
    int v126 = v125 + v124;
    int v127 = v110[v126];
    int v128 = 0;
    bool v129 = v127 != v128;
    v120 = v120;
    v121 = v121;
    if (!v129) break;
    int v130 = 28;
    int v131 = v130 + v111;
    int v132 = v110[v131];
    int v133;
    v133 = v111;
    switch (v132) {
      default:
        {
        int v134 = 32;
        int v135 = v134 + v111;
        int v136 = v110[v135];
        int v137;
        v137 = v111;
        switch (v136) {
          case 0:
            {
            v137 = v111;
            break;
          }
          default:
            {
            int v138 = 3;
            int v139 = v111 + v138;
            v137 = v139;
            break;
          }
        }
        bool v140 = true;
        v133 = v137;
        break;
      }
      case 0:
        {
        int v141 = 0;
        int v142 = 0;
        int v143;
        int v144;
        v143 = v141;
        v144 = v142;
        while (true) {
          int v145 = 4;
          int v146 = v144 * v145;
          int v147 = v146 + v111;
          int v148 = 36;
          int v149 = v148 + v147;
          int v150 = v110[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          v143 = v143;
          v144 = v144;
          if (!v152) break;
          int v153 = v143 + v144;
          int v154 = 1;
          int v155 = v144 + v154;
          bool v156 = true;
          v143 = v153;
          v144 = v155;
          break;
          ;
        }
        v133 = v143;
      }
      case 1:
        {
        int v157 = 56;
        int v158 = v157 + v111;
        int v159 = v110[v158];
        int v160 = 2;
        int v161;
        v161 = v160;
        switch (v159) {
          case 0:
            {
            int v162 = 2;
            v161 = v162;
            break;
          }
          case 1:
            {
            v161 = v111;
            break;
          }
          case 2:
            {
            int v163 = 3;
            int v164 = v111 + v163;
            v161 = v164;
            break;
          }
          default:
            {
            int v165 = 2;
            v161 = v165;
            break;
          }
        }
        bool v166 = true;
        v133 = v161;
        break;
      }
    }
    int v167 = v120 + v133;
    int v168 = 1;
    int v169 = v121 + v168;
    bool v170 = true;
    int v171 = 16;
    int v172 = 4;
    int v173 = v121 * v172;
    int v174 = v171 + v173;
    int v175 = v174 + v111;
    bool v176 = true;
    int v177 = simt_wave_count_bits(v176);
    v109[v175] = v177;
    v120 = v167;
    v121 = v169;
  }
  int v178 = 60;
  int v179 = v178 + v111;
  int v180 = v110[v179];
  int v181 = 0;
  bool v182 = v180 != v181;
  int v183;
  if (v182) {
    int v184 = 64;
    int v185 = v184 + v111;
    int v186 = v110[v185];
    int v187 = 0;
    bool v188 = v186 != v187;
    int v189;
    if (v188) {
      int v190 = 68;
      int v191 = v190 + v111;
      int v192 = v110[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 0;
        v195 = v196;
      } else {
        int v197 = 3;
        int v198 = v111 + v197;
        v195 = v198;
      }
      int v199 = 32;
      int v200 = v199 + v111;
      bool v201 = true;
      int v202 = simt_wave_count_bits(v201);
      v109[v200] = v202;
      v189 = v195;
    } else {
      uint v203 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v204 = (int)(v203);
      v189 = v204;
    }
    int v205 = 48;
    int v206 = v205 + v111;
    bool v207 = true;
    int v208 = simt_wave_count_bits(v207);
    v109[v206] = v208;
    v183 = v189;
  } else {
    int v209 = 0;
    int v210 = 0;
    int v211;
    int v212;
    v211 = v209;
    v212 = v210;
    while (true) {
      int v213 = 4;
      int v214 = v212 * v213;
      int v215 = v214 + v111;
      int v216 = 72;
      int v217 = v216 + v215;
      int v218 = v110[v217];
      int v219 = 0;
      bool v220 = v218 != v219;
      v211 = v211;
      v212 = v212;
      if (!v220) break;
      int v221 = 92;
      int v222 = v221 + v111;
      int v223 = v110[v222];
      int v224 = 0;
      bool v225 = v223 != v224;
      int v226;
      if (v225) {
        uint v227 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v228 = (int)(v227);
        v226 = v228;
      } else {
        int v229 = 0;
        v226 = v229;
      }
      int v230 = 64;
      int v231 = v230 + v111;
      bool v232 = true;
      int v233 = simt_wave_count_bits(v232);
      v109[v231] = v233;
      int v234 = v211 + v226;
      int v235 = 1;
      int v236 = v212 + v235;
      bool v237 = true;
      int v238 = 80;
      int v239 = 4;
      int v240 = v212 * v239;
      int v241 = v238 + v240;
      int v242 = v241 + v111;
      bool v243 = true;
      int v244 = simt_wave_count_bits(v243);
      v109[v242] = v244;
      v211 = v234;
      v212 = v236;
      break;
      ;
    }
    v183 = v211;
  }
  int v245 = 96;
  int v246 = v245 + v111;
  bool v247 = true;
  int v248 = simt_wave_count_bits(v247);
  v109[v246] = v248;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
