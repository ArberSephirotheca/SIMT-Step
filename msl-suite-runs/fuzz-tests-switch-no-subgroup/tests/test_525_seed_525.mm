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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
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
          int v20 = 1;
          int v21 = v13 + v20;
          v12 = v19;
          v13 = v21;
        }
        v9 = v12;
      } else {
        int v22 = 2;
        int v23 = v3 % v22;
        int v24 = 3;
        int v25 = v0 + v24;
        int v26;
        v26 = v25;
        switch (v23) {
          case 0:
            {
            int v27 = 2;
            v26 = v27;
            break;
          }
          case 1:
            {
            int v28 = 2;
            v26 = v28;
          }
          default:
            {
            v26 = v0;
            break;
          }
        }
        v9 = v26;
      }
      v6 = v9;
    }
    case 1:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
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
          int v41 = 4;
          int v42 = v0 + v41;
          int v43 = 1;
          int v44 = v35 + v43;
          v34 = v42;
          v35 = v44;
          break;
          ;
        }
        v31 = v34;
      } else {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          v47 = v0;
        } else {
          int v48 = 0;
          v47 = v48;
        }
        v31 = v47;
      }
      v6 = v31;
    }
    default:
      {
      int v49 = 0;
      int v50 = 0;
      int v51;
      int v52;
      v51 = v49;
      v52 = v50;
      while (true) {
        int v53 = 4;
        int v54 = v3 % v53;
        int v55 = 1;
        int v56 = v54 + v55;
        bool v57 = v52 < v56;
        v51 = v51;
        v52 = v52;
        if (!v57) break;
        int v58 = 2;
        int v59 = 1;
        int v60 = v52 + v59;
        v51 = v58;
        v52 = v60;
      }
      v6 = v51;
    }
    case 2:
      {
      int v61 = 0;
      int v62 = 0;
      int v63;
      int v64;
      v63 = v61;
      v64 = v62;
      while (true) {
        int v65 = 4;
        int v66 = v3 % v65;
        int v67 = 1;
        int v68 = v66 + v67;
        bool v69 = v64 < v68;
        v63 = v63;
        v64 = v64;
        if (!v69) break;
        int v70 = 3;
        int v71 = v3 % v70;
        int v72 = 0;
        int v73 = v0 + v72;
        int v74;
        v74 = v73;
        switch (v71) {
          case 0:
            {
            v74 = v0;
            break;
          }
          case 1:
            {
            v74 = v0;
            break;
          }
          case 2:
            {
            v74 = v0;
            break;
          }
          default:
            {
            v74 = v0;
            break;
          }
        }
        int v75 = 1;
        int v76 = v64 + v75;
        v63 = v74;
        v64 = v76;
      }
      v6 = v63;
      break;
    }
  }
  bool v77 = true;
  int v78 = simt_wave_count_bits(v77);
  int v79 = 0;
  int v80 = v79 + v0;
  v1[v80] = v78;
  return;
}

kernel void kernel_main(device int* v81 [[buffer(0)]], device int* v82 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v83 = static_cast<int>(__simt_tid3.x);
  int v84 = 0;
  int v85 = v84 + v83;
  int v86 = v82[v85];
  int v87 = 4;
  int v88 = v87 + v83;
  int v89 = v82[v88];
  int v90 = 0;
  bool v91 = v86 != v90;
  if (v91) {
    int v92 = 8;
    int v93 = v92 + v83;
    int v94 = v82[v93];
    int v95 = 0;
    bool v96 = v94 != v95;
    if (v96) {
    } else {
      helper0(v83, v81, v86, v89, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v97 = 12;
  int v98 = v97 + v83;
  int v99 = v82[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    int v103 = 16;
    int v104 = v103 + v83;
    int v105 = v82[v104];
    int v106 = 0;
    bool v107 = v105 != v106;
    int v108;
    if (v107) {
      int v109 = 20;
      int v110 = v109 + v83;
      int v111 = v82[v110];
      int v112 = 0;
      int v113;
      v113 = v112;
      switch (v111) {
        case 0:
          {
          v113 = v83;
          break;
        }
        case 1:
          {
          v113 = v83;
        }
        case 2:
          {
          v113 = v83;
          break;
        }
        default:
          {
          v113 = v83;
          break;
        }
      }
      v108 = v113;
    } else {
      int v114 = 24;
      int v115 = v114 + v83;
      int v116 = v82[v115];
      int v117 = 3;
      int v118 = v83 + v117;
      int v119;
      v119 = v118;
      switch (v116) {
        default:
          {
          int v120 = 4;
          v119 = v120;
          break;
        }
        case 0:
          {
          int v121 = 0;
          int v122 = v83 + v121;
          v119 = v122;
          break;
        }
      }
      bool v123 = true;
      int v124 = 16;
      int v125 = v124 + v83;
      bool v126 = true;
      int v127 = simt_wave_count_bits(v126);
      v81[v125] = v127;
      v108 = v119;
    }
    int v128 = 32;
    int v129 = v128 + v83;
    bool v130 = true;
    int v131 = simt_wave_count_bits(v130);
    v81[v129] = v131;
    v102 = v108;
  } else {
    int v132 = 28;
    int v133 = v132 + v83;
    int v134 = v82[v133];
    int v135;
    v135 = v83;
    switch (v134) {
      default:
        {
        v135 = v83;
        break;
      }
      case 0:
        {
        int v136 = 0;
        v135 = v136;
        break;
      }
      case 1:
        {
        int v137 = 0;
        v135 = v137;
        break;
      }
      case 2:
        {
        int v138 = 32;
        int v139 = v138 + v83;
        int v140 = v82[v139];
        int v141 = 2;
        int v142 = v83 + v141;
        int v143;
        v143 = v142;
        switch (v140) {
          case 0:
            {
            int v144 = 0;
            int v145 = v83 + v144;
            v143 = v145;
            break;
          }
          default:
            {
            int v146 = 1;
            int v147 = v83 + v146;
            v143 = v147;
            break;
          }
          case 1:
            {
            v143 = v83;
            break;
          }
        }
        bool v148 = true;
        v135 = v143;
        break;
      }
    }
    v102 = v135;
  }
  int v149 = 48;
  int v150 = v149 + v83;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v81[v150] = v152;
  int v153 = 36;
  int v154 = v153 + v83;
  int v155 = v82[v154];
  int v156 = 2;
  int v157 = v83 + v156;
  int v158;
  v158 = v157;
  switch (v155) {
    case 0:
      {
      int v159 = 40;
      int v160 = v159 + v83;
      int v161 = v82[v160];
      int v162;
      v162 = v83;
      switch (v161) {
        case 0:
          {
          int v163 = 4;
          v162 = v163;
        }
        case 1:
          {
          int v164 = 44;
          int v165 = v164 + v83;
          int v166 = v82[v165];
          int v167;
          v167 = v83;
          switch (v166) {
            case 0:
              {
              int v168 = 3;
              int v169 = v83 + v168;
              v167 = v169;
              break;
            }
            default:
              {
              v167 = v83;
              break;
            }
          }
          v162 = v167;
        }
        default:
          {
          int v170 = 48;
          int v171 = v170 + v83;
          int v172 = v82[v171];
          int v173 = 0;
          bool v174 = v172 != v173;
          int v175;
          if (v174) {
            int v176 = 2;
            int v177 = v83 + v176;
            v175 = v177;
          } else {
            int v178 = 4;
            v175 = v178;
          }
          v162 = v175;
          break;
        }
        case 2:
          {
          int v179 = 0;
          int v180 = 0;
          int v181;
          int v182;
          v181 = v179;
          v182 = v180;
          while (true) {
            int v183 = 4;
            int v184 = v182 * v183;
            int v185 = v184 + v83;
            int v186 = 52;
            int v187 = v186 + v185;
            int v188 = v82[v187];
            int v189 = 0;
            bool v190 = v188 != v189;
            v181 = v181;
            v182 = v182;
            if (!v190) break;
            int v191 = v181 + v182;
            int v192 = 1;
            int v193 = v182 + v192;
            bool v194 = true;
            v181 = v191;
            v182 = v193;
            continue;
            ;
          }
          v162 = v181;
          break;
        }
      }
      bool v195 = true;
      v158 = v162;
    }
    default:
      {
      int v196 = 72;
      int v197 = v196 + v83;
      int v198 = v82[v197];
      int v199 = 1;
      int v200;
      v200 = v199;
      switch (v198) {
        case 0:
          {
          int v201 = 76;
          int v202 = v201 + v83;
          int v203 = v82[v202];
          int v204 = 0;
          bool v205 = v203 != v204;
          int v206;
          if (v205) {
            v206 = v83;
          } else {
            int v207 = 0;
            int v208 = v83 + v207;
            v206 = v208;
          }
          v200 = v206;
          break;
        }
        case 1:
          {
          int v209 = 0;
          int v210 = 0;
          int v211;
          int v212;
          v211 = v209;
          v212 = v210;
          while (true) {
            int v213 = 4;
            int v214 = v212 * v213;
            int v215 = v214 + v83;
            int v216 = 80;
            int v217 = v216 + v215;
            int v218 = v82[v217];
            int v219 = 0;
            bool v220 = v218 != v219;
            v211 = v211;
            v212 = v212;
            if (!v220) break;
            int v221 = v211 + v212;
            int v222 = 1;
            int v223 = v212 + v222;
            bool v224 = true;
            v211 = v221;
            v212 = v223;
            break;
            ;
          }
          v200 = v211;
          break;
        }
        case 2:
          {
          v200 = v83;
          break;
        }
        default:
          {
          int v225 = 100;
          int v226 = v225 + v83;
          int v227 = v82[v226];
          int v228 = 0;
          bool v229 = v227 != v228;
          int v230;
          if (v229) {
            v230 = v83;
          } else {
            int v231 = 1;
            int v232 = v83 + v231;
            v230 = v232;
          }
          v200 = v230;
          break;
        }
      }
      v158 = v200;
      break;
    }
  }
  int v233 = 0;
  int v234 = 0;
  int v235;
  int v236;
  v235 = v233;
  v236 = v234;
  while (true) {
    int v237 = 4;
    int v238 = v236 * v237;
    int v239 = v238 + v83;
    int v240 = 104;
    int v241 = v240 + v239;
    int v242 = v82[v241];
    int v243 = 0;
    bool v244 = v242 != v243;
    v235 = v235;
    v236 = v236;
    if (!v244) break;
    int v245 = v235 + v236;
    int v246 = 1;
    int v247 = v236 + v246;
    bool v248 = true;
    int v249 = 64;
    int v250 = 4;
    int v251 = v236 * v250;
    int v252 = v249 + v251;
    int v253 = v252 + v83;
    bool v254 = true;
    int v255 = simt_wave_count_bits(v254);
    v81[v253] = v255;
    v235 = v245;
    v236 = v247;
    break;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
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
