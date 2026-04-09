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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 1;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    default:
      {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 0;
      int v14;
      v14 = v13;
      switch (v12) {
        case 0:
          {
          int v15 = 0;
          int v16 = 0;
          int v17;
          int v18;
          v17 = v15;
          v18 = v16;
          while (true) {
            int v19 = 4;
            int v20 = v3 % v19;
            int v21 = 1;
            int v22 = v20 + v21;
            bool v23 = v18 < v22;
            v17 = v17;
            v18 = v18;
            if (!v23) break;
            int v24 = 1;
            int v25 = v18 + v24;
            v17 = v0;
            v18 = v25;
          }
          v14 = v17;
        }
        default:
          {
          v14 = v0;
        }
        case 1:
          {
          int v26 = 0;
          v14 = v26;
        }
        case 2:
          {
          int v27 = 0;
          int v28 = 0;
          int v29;
          int v30;
          v29 = v27;
          v30 = v28;
          while (true) {
            int v31 = 4;
            int v32 = v3 % v31;
            int v33 = 1;
            int v34 = v32 + v33;
            bool v35 = v30 < v34;
            v29 = v29;
            v30 = v30;
            if (!v35) break;
            int v36 = 4;
            int v37 = v0 + v36;
            int v38 = 1;
            int v39 = v30 + v38;
            v29 = v37;
            v30 = v39;
          }
          v14 = v29;
          break;
        }
      }
      v8 = v14;
      break;
    }
    case 1:
      {
      int v40 = 3;
      int v41 = v3 % v40;
      int v42 = 1;
      int v43 = v0 + v42;
      int v44;
      v44 = v43;
      switch (v41) {
        case 0:
          {
          int v45 = 0;
          bool v46 = v2 != v45;
          int v47;
          if (v46) {
            int v48 = 4;
            v47 = v48;
          } else {
            int v49 = 4;
            int v50 = v0 + v49;
            v47 = v50;
          }
          v44 = v47;
          break;
        }
        case 1:
          {
          int v51 = 2;
          int v52 = v3 % v51;
          int v53;
          v53 = v0;
          switch (v52) {
            default:
              {
              int v54 = 4;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            case 0:
              {
              v53 = v0;
              break;
            }
            case 1:
              {
              int v56 = 0;
              int v57 = v0 + v56;
              v53 = v57;
              break;
            }
          }
          v44 = v53;
        }
        default:
          {
          v44 = v0;
          break;
        }
        case 2:
          {
          v44 = v0;
          break;
        }
      }
      int v58 = 2;
      v8 = v44;
      break;
    }
    case 2:
      {
      int v59 = 0;
      bool v60 = v2 != v59;
      int v61;
      if (v60) {
        int v62 = 0;
        bool v63 = v2 != v62;
        int v64;
        if (v63) {
          int v65 = 0;
          v64 = v65;
        } else {
          int v66 = 3;
          v64 = v66;
        }
        v61 = v64;
      } else {
        v61 = v0;
      }
      v8 = v61;
      break;
    }
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 0;
  int v70 = v69 + v0;
  v1[v70] = v68;
  return;
}

kernel void kernel_main(device int* v71 [[buffer(0)]], device int* v72 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v73 = static_cast<int>(__simt_tid3.x);
  int v74 = 0;
  int v75 = v74 + v73;
  int v76 = v72[v75];
  int v77 = 4;
  int v78 = v77 + v73;
  int v79 = v72[v78];
  helper0(v73, v71, v76, v79, static_cast<int>(__simt_tid3.x));
  uint v80 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82 = 1;
  int v83 = 8;
  int v84 = v83 + v73;
  int v85 = v72[v84];
  int v86 = 0;
  bool v87 = v85 != v86;
  int v88;
  if (v87) {
    uint v89 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v90 = (int)(v89);
    v88 = v90;
  } else {
    int v91 = 0;
    int v92 = 0;
    int v93;
    int v94;
    v93 = v91;
    v94 = v92;
    while (true) {
      int v95 = 4;
      int v96 = v94 * v95;
      int v97 = v96 + v73;
      int v98 = 12;
      int v99 = v98 + v97;
      int v100 = v72[v99];
      int v101 = 0;
      bool v102 = v100 != v101;
      v93 = v93;
      v94 = v94;
      if (!v102) break;
      int v103 = 32;
      int v104 = v103 + v73;
      int v105 = v72[v104];
      int v106 = 0;
      bool v107 = v105 != v106;
      int v108;
      if (v107) {
        uint v109 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v110 = (int)(v109);
        v108 = v110;
      } else {
        int v111 = 0;
        v108 = v111;
      }
      int v112 = 16;
      int v113 = v112 + v73;
      bool v114 = true;
      int v115 = simt_wave_count_bits(v114);
      v71[v113] = v115;
      int v116 = v93 + v108;
      int v117 = 1;
      int v118 = v94 + v117;
      bool v119 = true;
      int v120 = 32;
      int v121 = 4;
      int v122 = v94 * v121;
      int v123 = v120 + v122;
      int v124 = v123 + v73;
      bool v125 = true;
      int v126 = simt_wave_count_bits(v125);
      v71[v124] = v126;
      v93 = v116;
      v94 = v118;
      continue;
      ;
    }
    v88 = v93;
  }
  int v127 = 48;
  int v128 = v127 + v73;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v71[v128] = v130;
  int v131 = 36;
  int v132 = v131 + v73;
  int v133 = v72[v132];
  int v134 = 0;
  bool v135 = v133 != v134;
  int v136;
  if (v135) {
    int v137 = 40;
    int v138 = v137 + v73;
    int v139 = v72[v138];
    int v140 = 3;
    int v141;
    v141 = v140;
    switch (v139) {
      case 0:
        {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v73;
          int v149 = 44;
          int v150 = v149 + v148;
          int v151 = v72[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          v144 = v144;
          v145 = v145;
          if (!v153) break;
          int v154 = v144 + v145;
          int v155 = 1;
          int v156 = v145 + v155;
          bool v157 = true;
          v144 = v154;
          v145 = v156;
          break;
          ;
        }
        v141 = v144;
        break;
      }
      case 1:
        {
        int v158 = 64;
        int v159 = v158 + v73;
        int v160 = v72[v159];
        int v161 = 4;
        int v162 = v73 + v161;
        int v163;
        v163 = v162;
        switch (v160) {
          default:
            {
            int v164 = 3;
            v163 = v164;
            break;
          }
          case 0:
            {
            int v165 = 1;
            int v166 = v73 + v165;
            v163 = v166;
          }
          case 1:
            {
            v163 = v73;
          }
          case 2:
            {
            int v167 = 4;
            int v168 = v73 + v167;
            v163 = v168;
            break;
          }
        }
        bool v169 = true;
        v141 = v163;
      }
      default:
        {
        int v170 = 68;
        int v171 = v170 + v73;
        int v172 = v72[v171];
        int v173 = 0;
        bool v174 = v172 != v173;
        int v175;
        if (v174) {
          int v176 = 4;
          int v177 = v73 + v176;
          v175 = v177;
        } else {
          int v178 = 2;
          v175 = v178;
        }
        v141 = v175;
        break;
      }
      case 2:
        {
        int v179 = 72;
        int v180 = v179 + v73;
        int v181 = v72[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        int v184;
        if (v183) {
          int v185 = 0;
          int v186 = v73 + v185;
          v184 = v186;
        } else {
          v184 = v73;
        }
        v141 = v184;
        break;
      }
    }
    bool v187 = true;
    int v188 = 64;
    int v189 = v188 + v73;
    bool v190 = true;
    int v191 = simt_wave_count_bits(v190);
    v71[v189] = v191;
    v136 = v141;
  } else {
    int v192 = 76;
    int v193 = v192 + v73;
    int v194 = v72[v193];
    int v195 = 1;
    int v196;
    v196 = v195;
    switch (v194) {
      case 0:
        {
        int v197 = 0;
        int v198 = 0;
        int v199;
        int v200;
        v199 = v197;
        v200 = v198;
        while (true) {
          int v201 = 4;
          int v202 = v200 * v201;
          int v203 = v202 + v73;
          int v204 = 80;
          int v205 = v204 + v203;
          int v206 = v72[v205];
          int v207 = 0;
          bool v208 = v206 != v207;
          v199 = v199;
          v200 = v200;
          if (!v208) break;
          int v209 = v199 + v200;
          int v210 = 1;
          int v211 = v200 + v210;
          bool v212 = true;
          v199 = v209;
          v200 = v211;
          continue;
          ;
        }
        v196 = v199;
        break;
      }
      case 1:
        {
        int v213 = 100;
        int v214 = v213 + v73;
        int v215 = v72[v214];
        int v216;
        v216 = v73;
        switch (v215) {
          case 0:
            {
            int v217 = 3;
            int v218 = v73 + v217;
            v216 = v218;
            break;
          }
          default:
            {
            int v219 = 2;
            v216 = v219;
            break;
          }
        }
        v196 = v216;
        break;
      }
      default:
        {
        int v220 = 3;
        int v221 = v73 + v220;
        v196 = v221;
        break;
      }
      case 2:
        {
        int v222 = 0;
        int v223 = 0;
        int v224;
        int v225;
        v224 = v222;
        v225 = v223;
        while (true) {
          int v226 = 4;
          int v227 = v225 * v226;
          int v228 = v227 + v73;
          int v229 = 104;
          int v230 = v229 + v228;
          int v231 = v72[v230];
          int v232 = 0;
          bool v233 = v231 != v232;
          v224 = v224;
          v225 = v225;
          if (!v233) break;
          int v234 = v224 + v225;
          int v235 = 1;
          int v236 = v225 + v235;
          bool v237 = true;
          v224 = v234;
          v225 = v236;
          continue;
          ;
        }
        v196 = v224;
        break;
      }
    }
    v136 = v196;
  }
  int v238 = 80;
  int v239 = v238 + v73;
  bool v240 = true;
  int v241 = simt_wave_count_bits(v240);
  v71[v239] = v241;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
