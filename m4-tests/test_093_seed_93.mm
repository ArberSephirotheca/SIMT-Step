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
  int v29 = 0;
  int v30 = 0;
  int v31;
  int v32;
  v31 = v29;
  v32 = v30;
  while (true) {
    int v33 = 4;
    int v34 = v3 % v33;
    int v35 = 1;
    int v36 = v34 + v35;
    bool v37 = v32 < v36;
    v31 = v31;
    v32 = v32;
    if (!v37) break;
    bool v38 = true;
    int v39 = simt_wave_count_bits(v38);
    int v40 = 32;
    int v41 = 4;
    int v42 = v32 * v41;
    int v43 = v40 + v42;
    int v44 = v43 + v0;
    v1[v44] = v39;
    int v45 = 1;
    int v46 = v32 + v45;
    v31 = v39;
    v32 = v46;
  }
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v28 : v31;
  int v50 = 3;
  int v51 = v3 % v50;
  uint v52 = simt_subgroup_id(__simt_tid);
  int v53 = (int)(v52);
  int v54;
  v54 = v53;
  switch (v51) {
    case 0:
      {
      int v55;
      v55 = v0;
      switch (v3) {
        case 0:
          {
          int v56 = 2;
          int v57 = v3 % v56;
          int v58;
          v58 = v0;
          switch (v57) {
            case 0:
              {
              int v59 = 0;
              int v60 = v0 + v59;
              v58 = v60;
              break;
            }
            default:
              {
              v58 = v0;
              break;
            }
            case 1:
              {
              int v61 = 1;
              v58 = v61;
              break;
            }
          }
          int v62 = 1;
          v55 = v58;
          break;
        }
        default:
          {
          int v63 = 2;
          int v64 = v3 % v63;
          int v65;
          v65 = v0;
          switch (v64) {
            default:
              {
              int v66 = 0;
              v65 = v66;
              break;
            }
            case 0:
              {
              int v67 = 2;
              int v68 = v0 + v67;
              v65 = v68;
              break;
            }
            case 1:
              {
              int v69 = 2;
              int v70 = v0 + v69;
              v65 = v70;
              break;
            }
          }
          v55 = v65;
          break;
        }
      }
      v54 = v55;
      break;
    }
    default:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v3 % v75;
        int v77 = 1;
        int v78 = v76 + v77;
        bool v79 = v74 < v78;
        v73 = v73;
        v74 = v74;
        if (!v79) break;
        int v80 = 1;
        int v81 = v74 + v80;
        v73 = v0;
        v74 = v81;
      }
      v54 = v73;
      break;
    }
    case 1:
      {
      int v82 = 0;
      int v83 = 0;
      int v84;
      int v85;
      v84 = v82;
      v85 = v83;
      while (true) {
        int v86 = 4;
        int v87 = v3 % v86;
        int v88 = 1;
        int v89 = v87 + v88;
        bool v90 = v85 < v89;
        v84 = v84;
        v85 = v85;
        if (!v90) break;
        int v91 = 0;
        int v92;
        v92 = v91;
        switch (v3) {
          default:
            {
            v92 = v0;
          }
          case 0:
            {
            v92 = v0;
            break;
          }
        }
        int v93 = 4;
        int v94 = 1;
        int v95 = v85 + v94;
        v84 = v92;
        v85 = v95;
        break;
        ;
      }
      v54 = v84;
      break;
    }
  }
  bool v96 = true;
  int v97 = simt_wave_count_bits(v96);
  int v98 = 48;
  int v99 = v98 + v0;
  v1[v99] = v97;
  int v100 = 0;
  bool v101 = v2 != v100;
  int v102 = v101 ? v49 : v54;
  return;
}

kernel void kernel_main(device int* v103 [[buffer(0)]], device int* v104 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v105 = static_cast<int>(__simt_tid3.x);
  int v106 = 0;
  int v107 = v106 + v105;
  int v108 = v104[v107];
  int v109 = 4;
  int v110 = v109 + v105;
  int v111 = v104[v110];
  helper0(v105, v103, v108, v111, static_cast<int>(__simt_tid3.x));
  int v112 = 0;
  int v113 = 0;
  int v114;
  int v115;
  v114 = v112;
  v115 = v113;
  while (true) {
    int v116 = 4;
    int v117 = v115 * v116;
    int v118 = v117 + v105;
    int v119 = 8;
    int v120 = v119 + v118;
    int v121 = v104[v120];
    int v122 = 0;
    bool v123 = v121 != v122;
    v114 = v114;
    v115 = v115;
    if (!v123) break;
    int v124 = 28;
    int v125 = v124 + v105;
    int v126 = v104[v125];
    int v127 = 0;
    bool v128 = v126 != v127;
    int v129;
    if (v128) {
      uint v130 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v131 = (int)(v130);
      v129 = v131;
    } else {
      int v132 = 4;
      v129 = v132;
    }
    int v133 = 64;
    int v134 = v133 + v105;
    bool v135 = true;
    int v136 = simt_wave_count_bits(v135);
    v103[v134] = v136;
    int v137 = v114 + v129;
    int v138 = 1;
    int v139 = v115 + v138;
    bool v140 = true;
    int v141 = 80;
    int v142 = 4;
    int v143 = v115 * v142;
    int v144 = v141 + v143;
    int v145 = v144 + v105;
    bool v146 = true;
    int v147 = simt_wave_count_bits(v146);
    v103[v145] = v147;
    v114 = v137;
    v115 = v139;
  }
  int v148 = 32;
  int v149 = v148 + v105;
  int v150 = v104[v149];
  uint v151 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v152 = (int)(v151);
  int v153;
  v153 = v152;
  switch (v150) {
    case 0:
      {
      int v154 = 36;
      int v155 = v154 + v105;
      int v156 = v104[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      int v159;
      if (v158) {
        int v160 = 40;
        int v161 = v160 + v105;
        int v162 = v104[v161];
        int v163;
        v163 = v105;
        switch (v162) {
          case 0:
            {
            int v164 = 4;
            int v165 = v105 + v164;
            v163 = v165;
            break;
          }
          case 1:
            {
            v163 = v105;
            break;
          }
          case 2:
            {
            int v166 = 1;
            v163 = v166;
            break;
          }
          default:
            {
            int v167 = 4;
            int v168 = v105 + v167;
            v163 = v168;
            break;
          }
        }
        v159 = v163;
      } else {
        int v169 = 44;
        int v170 = v169 + v105;
        int v171 = v104[v170];
        int v172 = 0;
        int v173;
        v173 = v172;
        switch (v171) {
          default:
            {
            int v174 = 3;
            int v175 = v105 + v174;
            v173 = v175;
          }
          case 0:
            {
            v173 = v105;
            break;
          }
        }
        v159 = v173;
      }
      v153 = v159;
      break;
    }
    case 1:
      {
      int v176 = 48;
      int v177 = v176 + v105;
      int v178 = v104[v177];
      int v179 = 4;
      int v180;
      v180 = v179;
      switch (v178) {
        default:
          {
          int v181 = 0;
          int v182 = 0;
          int v183;
          int v184;
          v183 = v181;
          v184 = v182;
          while (true) {
            int v185 = 4;
            int v186 = v184 * v185;
            int v187 = v186 + v105;
            int v188 = 52;
            int v189 = v188 + v187;
            int v190 = v104[v189];
            int v191 = 0;
            bool v192 = v190 != v191;
            v183 = v183;
            v184 = v184;
            if (!v192) break;
            int v193 = v183 + v184;
            int v194 = 1;
            int v195 = v184 + v194;
            bool v196 = true;
            v183 = v193;
            v184 = v195;
            continue;
            ;
          }
          v180 = v183;
          break;
        }
        case 0:
          {
          int v197 = 2;
          v180 = v197;
          break;
        }
      }
      v153 = v180;
      break;
    }
    case 2:
      {
      int v198 = 72;
      int v199 = v198 + v105;
      int v200 = v104[v199];
      int v201;
      v201 = v105;
      switch (v200) {
        default:
          {
          int v202 = 76;
          int v203 = v202 + v105;
          int v204 = v104[v203];
          int v205 = 0;
          int v206 = v105 + v205;
          int v207;
          v207 = v206;
          switch (v204) {
            case 0:
              {
              int v208 = 4;
              v207 = v208;
              break;
            }
            case 1:
              {
              v207 = v105;
              break;
            }
            default:
              {
              int v209 = 1;
              v207 = v209;
              break;
            }
            case 2:
              {
              int v210 = 2;
              v207 = v210;
              break;
            }
          }
          v201 = v207;
        }
        case 0:
          {
          int v211 = 80;
          int v212 = v211 + v105;
          int v213 = v104[v212];
          int v214 = 0;
          bool v215 = v213 != v214;
          int v216;
          if (v215) {
            int v217 = 2;
            v216 = v217;
          } else {
            v216 = v105;
          }
          v201 = v216;
          break;
        }
        case 1:
          {
          int v218 = 0;
          int v219 = 0;
          int v220;
          int v221;
          v220 = v218;
          v221 = v219;
          while (true) {
            int v222 = 4;
            int v223 = v221 * v222;
            int v224 = v223 + v105;
            int v225 = 84;
            int v226 = v225 + v224;
            int v227 = v104[v226];
            int v228 = 0;
            bool v229 = v227 != v228;
            v220 = v220;
            v221 = v221;
            if (!v229) break;
            int v230 = v220 + v221;
            int v231 = 1;
            int v232 = v221 + v231;
            bool v233 = true;
            v220 = v230;
            v221 = v232;
            break;
            ;
          }
          v201 = v220;
          break;
        }
        case 2:
          {
          int v234 = 104;
          int v235 = v234 + v105;
          int v236 = v104[v235];
          int v237 = 0;
          bool v238 = v236 != v237;
          int v239;
          if (v238) {
            v239 = v105;
          } else {
            v239 = v105;
          }
          v201 = v239;
          break;
        }
      }
      bool v240 = true;
      v153 = v201;
    }
    default:
      {
      int v241 = 108;
      int v242 = v241 + v105;
      int v243 = v104[v242];
      int v244 = 3;
      int v245;
      v245 = v244;
      switch (v243) {
        default:
          {
          v245 = v105;
        }
        case 0:
          {
          v245 = v105;
          break;
        }
      }
      v153 = v245;
      break;
    }
  }
  bool v246 = true;
  int v247 = 96;
  int v248 = v247 + v105;
  bool v249 = true;
  int v250 = simt_wave_count_bits(v249);
  v103[v248] = v250;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
