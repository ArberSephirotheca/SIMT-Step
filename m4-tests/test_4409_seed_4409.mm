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
      bool v22 = true;
      int v23 = simt_wave_count_bits(v22);
      int v24 = 0;
      int v25 = 4;
      int v26 = v16 * v25;
      int v27 = v24 + v26;
      int v28 = v27 + v0;
      v1[v28] = v23;
      int v29 = 1;
      int v30 = v16 + v29;
      v15 = v23;
      v16 = v30;
    }
    int v31 = 1;
    int v32 = v7 + v31;
    v6 = v15;
    v7 = v32;
  }
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35;
  if (v34) {
    int v36 = 4;
    int v37 = v3 % v36;
    int v38 = 0;
    int v39 = v0 + v38;
    int v40;
    v40 = v39;
    switch (v37) {
      case 0:
        {
        int v41 = 4;
        v40 = v41;
      }
      case 1:
        {
        int v42 = 2;
        int v43 = v3 % v42;
        int v44 = 2;
        int v45;
        v45 = v44;
        switch (v43) {
          default:
            {
            int v46 = 3;
            int v47 = v0 + v46;
            v45 = v47;
          }
          case 0:
            {
            v45 = v0;
            break;
          }
        }
        v40 = v45;
        break;
      }
      default:
        {
        v40 = v0;
      }
      case 2:
        {
        int v48 = 1;
        int v49 = v0 + v48;
        v40 = v49;
        break;
      }
    }
    bool v50 = true;
    int v51 = simt_wave_count_bits(v50);
    int v52 = 16;
    int v53 = v52 + v0;
    v1[v53] = v51;
    v35 = v40;
  } else {
    int v54 = 0;
    bool v55 = v2 != v54;
    int v56;
    if (v55) {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        bool v66 = true;
        int v67 = simt_wave_count_bits(v66);
        int v68 = 32;
        int v69 = 4;
        int v70 = v60 * v69;
        int v71 = v68 + v70;
        int v72 = v71 + v0;
        v1[v72] = v67;
        int v73 = 1;
        int v74 = v60 + v73;
        v59 = v67;
        v60 = v74;
      }
      v56 = v59;
    } else {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        bool v78 = true;
        int v79 = simt_wave_count_bits(v78);
        int v80 = 48;
        int v81 = v80 + v0;
        v1[v81] = v79;
        v77 = v79;
      } else {
        bool v82 = true;
        int v83 = simt_wave_count_bits(v82);
        int v84 = 64;
        int v85 = v84 + v0;
        v1[v85] = v83;
        v77 = v83;
      }
      v56 = v77;
    }
    v35 = v56;
  }
  int v86 = 0;
  bool v87 = v2 != v86;
  int v88 = v87 ? v6 : v35;
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
  int v98 = 0;
  bool v99 = v94 != v98;
  if (v99) {
  } else {
    int v100 = 0;
    int v101 = 0;
    int v102;
    int v103;
    v102 = v100;
    v103 = v101;
    while (true) {
      int v104 = 1;
      bool v105 = v103 < v104;
      v102 = v102;
      v103 = v103;
      if (!v105) break;
      int v106 = 2;
      int v107 = v91 % v106;
      uint v108 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v109 = (int)(v108);
      int v110;
      v110 = v109;
      switch (v107) {
        default:
          {
          int v111 = 4;
          int v112 = v110 + v111;
          v110 = v112;
          break;
        }
        case 0:
          {
          int v113 = 1;
          int v114 = v110 + v113;
          v110 = v114;
          break;
        }
      }
      helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
      int v115 = 1;
      int v116 = v103 + v115;
      v102 = v102;
      v103 = v116;
    }
  }
  int v117 = 1;
  int v118 = v91 + v117;
  int v119 = 8;
  int v120 = v119 + v91;
  int v121 = v90[v120];
  int v122 = 0;
  bool v123 = v121 != v122;
  int v124;
  if (v123) {
    int v125 = 0;
    int v126 = v91 + v125;
    v124 = v126;
  } else {
    int v127 = 12;
    int v128 = v127 + v91;
    int v129 = v90[v128];
    int v130 = 4;
    int v131 = v91 + v130;
    int v132;
    v132 = v131;
    switch (v129) {
      default:
        {
        int v133 = 16;
        int v134 = v133 + v91;
        int v135 = v90[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 2;
          v138 = v139;
        } else {
          int v140 = 4;
          v138 = v140;
        }
        v132 = v138;
        break;
      }
      case 0:
        {
        int v141 = 20;
        int v142 = v141 + v91;
        int v143 = v90[v142];
        int v144 = 4;
        int v145 = v91 + v144;
        int v146;
        v146 = v145;
        switch (v143) {
          case 0:
            {
            v146 = v91;
            break;
          }
          default:
            {
            int v147 = 0;
            int v148 = v91 + v147;
            v146 = v148;
            break;
          }
        }
        bool v149 = true;
        v132 = v146;
        break;
      }
    }
    v124 = v132;
  }
  int v150 = 80;
  int v151 = v150 + v91;
  bool v152 = true;
  int v153 = simt_wave_count_bits(v152);
  v89[v151] = v153;
  int v154 = 24;
  int v155 = v154 + v91;
  int v156 = v90[v155];
  uint v157 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v158 = (int)(v157);
  int v159;
  v159 = v158;
  switch (v156) {
    default:
      {
      int v160 = 28;
      int v161 = v160 + v91;
      int v162 = v90[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      int v165;
      if (v164) {
        int v166 = 32;
        int v167 = v166 + v91;
        int v168 = v90[v167];
        int v169;
        v169 = v91;
        switch (v168) {
          case 0:
            {
            v169 = v91;
          }
          case 1:
            {
            int v170 = 2;
            int v171 = v91 + v170;
            v169 = v171;
            break;
          }
          default:
            {
            v169 = v91;
          }
          case 2:
            {
            v169 = v91;
            break;
          }
        }
        v165 = v169;
      } else {
        v165 = v91;
      }
      v159 = v165;
      break;
    }
    case 0:
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
        int v178 = v177 + v91;
        int v179 = 36;
        int v180 = v179 + v178;
        int v181 = v90[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        v174 = v174;
        v175 = v175;
        if (!v183) break;
        int v184 = v174 + v175;
        int v185 = 1;
        int v186 = v175 + v185;
        bool v187 = true;
        v174 = v184;
        v175 = v186;
      }
      v159 = v174;
      break;
    }
    case 1:
      {
      int v188 = 56;
      int v189 = v188 + v91;
      int v190 = v90[v189];
      int v191 = 2;
      int v192 = v91 + v191;
      int v193;
      v193 = v192;
      switch (v190) {
        case 0:
          {
          int v194 = 60;
          int v195 = v194 + v91;
          int v196 = v90[v195];
          int v197 = 2;
          int v198;
          v198 = v197;
          switch (v196) {
            case 0:
              {
              v198 = v91;
            }
            default:
              {
              v198 = v91;
              break;
            }
          }
          v193 = v198;
          break;
        }
        case 1:
          {
          int v199 = 0;
          int v200 = 0;
          int v201;
          int v202;
          v201 = v199;
          v202 = v200;
          while (true) {
            int v203 = 4;
            int v204 = v202 * v203;
            int v205 = v204 + v91;
            int v206 = 64;
            int v207 = v206 + v205;
            int v208 = v90[v207];
            int v209 = 0;
            bool v210 = v208 != v209;
            v201 = v201;
            v202 = v202;
            if (!v210) break;
            int v211 = v201 + v202;
            int v212 = 1;
            int v213 = v202 + v212;
            bool v214 = true;
            v201 = v211;
            v202 = v213;
          }
          v193 = v201;
        }
        case 2:
          {
          int v215 = 84;
          int v216 = v215 + v91;
          int v217 = v90[v216];
          int v218 = 2;
          int v219;
          v219 = v218;
          switch (v217) {
            case 0:
              {
              int v220 = 4;
              v219 = v220;
              break;
            }
            case 1:
              {
              int v221 = 1;
              int v222 = v91 + v221;
              v219 = v222;
            }
            default:
              {
              int v223 = 3;
              int v224 = v91 + v223;
              v219 = v224;
              break;
            }
          }
          v193 = v219;
        }
        default:
          {
          int v225 = 0;
          int v226 = 0;
          int v227;
          int v228;
          v227 = v225;
          v228 = v226;
          while (true) {
            int v229 = 4;
            int v230 = v228 * v229;
            int v231 = v230 + v91;
            int v232 = 88;
            int v233 = v232 + v231;
            int v234 = v90[v233];
            int v235 = 0;
            bool v236 = v234 != v235;
            v227 = v227;
            v228 = v228;
            if (!v236) break;
            int v237 = v227 + v228;
            int v238 = 1;
            int v239 = v228 + v238;
            bool v240 = true;
            v227 = v237;
            v228 = v239;
          }
          v193 = v227;
          break;
        }
      }
      v159 = v193;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
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
