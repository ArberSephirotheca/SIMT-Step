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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 3;
  int v7 = v3 % v6;
  int v8;
  v8 = v0;
  switch (v7) {
    case 0:
      {
      int v9 = 0;
      int v10 = v0 + v9;
      v8 = v10;
    }
    default:
      {
      int v11 = 3;
      int v12 = v3 % v11;
      int v13 = 0;
      int v14 = v0 + v13;
      int v15;
      v15 = v14;
      switch (v12) {
        default:
          {
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
          v15 = v18;
          break;
        }
        case 0:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 4;
            int v38 = v0 + v37;
            int v39 = 1;
            int v40 = v31 + v39;
            v30 = v38;
            v31 = v40;
          }
          int v41 = 1;
          v15 = v30;
          break;
        }
        case 1:
          {
          int v42 = 0;
          bool v43 = v2 != v42;
          int v44;
          if (v43) {
            int v45 = 2;
            int v46 = v0 + v45;
            v44 = v46;
          } else {
            int v47 = 0;
            v44 = v47;
          }
          v15 = v44;
          break;
        }
        case 2:
          {
          int v48 = 3;
          int v49 = v3 % v48;
          int v50 = 0;
          int v51 = v0 + v50;
          int v52;
          v52 = v51;
          switch (v49) {
            default:
              {
              int v53 = 4;
              int v54 = v0 + v53;
              v52 = v54;
              break;
            }
            case 0:
              {
              int v55 = 2;
              int v56 = v0 + v55;
              v52 = v56;
              break;
            }
            case 1:
              {
              int v57 = 3;
              int v58 = v0 + v57;
              v52 = v58;
            }
            case 2:
              {
              v52 = v0;
              break;
            }
          }
          int v59 = 3;
          int v60 = v0 + v59;
          v15 = v52;
          break;
        }
      }
      int v61 = 1;
      v8 = v15;
      break;
    }
    case 1:
      {
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
        int v71 = 3;
        int v72 = v0 + v71;
        int v73 = 1;
        int v74 = v65 + v73;
        v64 = v72;
        v65 = v74;
      }
      int v75 = 2;
      v8 = v64;
      break;
    }
    case 2:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        v78 = v0;
      } else {
        int v79 = 4;
        int v80 = v0 + v79;
        v78 = v80;
      }
      int v81 = 1;
      v8 = v78;
      break;
    }
  }
  bool v82 = true;
  int v83 = simt_wave_count_bits(v82);
  int v84 = 0;
  int v85 = v84 + v0;
  v1[v85] = v83;
  int v86 = 0;
  bool v87 = v2 != v86;
  int v88 = v87 ? v5 : v8;
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
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 8;
  int v99 = v98 + v91;
  int v100 = v90[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    int v104 = 12;
    int v105 = v104 + v91;
    int v106 = v90[v105];
    int v107;
    v107 = v91;
    switch (v106) {
      default:
        {
        int v108 = 16;
        int v109 = v108 + v91;
        int v110 = v90[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          int v114 = 3;
          v113 = v114;
        } else {
          v113 = v91;
        }
        v107 = v113;
        break;
      }
      case 0:
        {
        int v115 = 4;
        v107 = v115;
        break;
      }
      case 1:
        {
        int v116 = 20;
        int v117 = v116 + v91;
        int v118 = v90[v117];
        int v119 = 1;
        int v120;
        v120 = v119;
        switch (v118) {
          case 0:
            {
            int v121 = 2;
            v120 = v121;
          }
          default:
            {
            int v122 = 2;
            v120 = v122;
          }
          case 1:
            {
            int v123 = 1;
            int v124 = v91 + v123;
            v120 = v124;
            break;
          }
        }
        bool v125 = true;
        v107 = v120;
        break;
      }
      case 2:
        {
        int v126 = 24;
        int v127 = v126 + v91;
        int v128 = v90[v127];
        int v129 = 3;
        int v130 = v91 + v129;
        int v131;
        v131 = v130;
        switch (v128) {
          default:
            {
            v131 = v91;
            break;
          }
          case 0:
            {
            int v132 = 4;
            v131 = v132;
            break;
          }
          case 1:
            {
            int v133 = 0;
            v131 = v133;
            break;
          }
          case 2:
            {
            int v134 = 3;
            v131 = v134;
            break;
          }
        }
        bool v135 = true;
        v107 = v131;
        break;
      }
    }
    bool v136 = true;
    v103 = v107;
  } else {
    int v137 = 4;
    v103 = v137;
  }
  int v138 = 16;
  int v139 = v138 + v91;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v89[v139] = v141;
  int v142 = 4;
  int v143 = v91 + v142;
  int v144 = 28;
  int v145 = v144 + v91;
  int v146 = v90[v145];
  int v147 = 4;
  int v148;
  v148 = v147;
  switch (v146) {
    case 0:
      {
      int v149 = 32;
      int v150 = v149 + v91;
      int v151 = v90[v150];
      int v152 = 0;
      int v153 = v91 + v152;
      int v154;
      v154 = v153;
      switch (v151) {
        case 0:
          {
          int v155 = 36;
          int v156 = v155 + v91;
          int v157 = v90[v156];
          int v158 = 0;
          bool v159 = v157 != v158;
          int v160;
          if (v159) {
            v160 = v91;
          } else {
            int v161 = 0;
            v160 = v161;
          }
          v154 = v160;
          break;
        }
        case 1:
          {
          int v162 = 4;
          int v163 = v91 + v162;
          v154 = v163;
          break;
        }
        case 2:
          {
          int v164 = 40;
          int v165 = v164 + v91;
          int v166 = v90[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            int v170 = 0;
            v169 = v170;
          } else {
            int v171 = 0;
            v169 = v171;
          }
          v154 = v169;
          break;
        }
        default:
          {
          int v172 = 44;
          int v173 = v172 + v91;
          int v174 = v90[v173];
          int v175 = 3;
          int v176;
          v176 = v175;
          switch (v174) {
            case 0:
              {
              int v177 = 0;
              int v178 = v91 + v177;
              v176 = v178;
              break;
            }
            case 1:
              {
              int v179 = 0;
              v176 = v179;
              break;
            }
            default:
              {
              int v180 = 1;
              int v181 = v91 + v180;
              v176 = v181;
              break;
            }
          }
          bool v182 = true;
          v154 = v176;
          break;
        }
      }
      bool v183 = true;
      v148 = v154;
      break;
    }
    default:
      {
      int v184 = 48;
      int v185 = v184 + v91;
      int v186 = v90[v185];
      int v187 = 4;
      int v188 = v91 + v187;
      int v189;
      v189 = v188;
      switch (v186) {
        default:
          {
          int v190 = 52;
          int v191 = v190 + v91;
          int v192 = v90[v191];
          int v193 = 0;
          int v194 = v91 + v193;
          int v195;
          v195 = v194;
          switch (v192) {
            case 0:
              {
              int v196 = 1;
              v195 = v196;
            }
            default:
              {
              int v197 = 4;
              int v198 = v91 + v197;
              v195 = v198;
            }
            case 1:
              {
              v195 = v91;
              break;
            }
          }
          bool v199 = true;
          v189 = v195;
          break;
        }
        case 0:
          {
          int v200 = 56;
          int v201 = v200 + v91;
          int v202 = v90[v201];
          int v203 = 0;
          bool v204 = v202 != v203;
          int v205;
          if (v204) {
            int v206 = 0;
            int v207 = v91 + v206;
            v205 = v207;
          } else {
            int v208 = 1;
            v205 = v208;
          }
          v189 = v205;
          break;
        }
      }
      bool v209 = true;
      v148 = v189;
      break;
    }
    case 1:
      {
      int v210 = 60;
      int v211 = v210 + v91;
      int v212 = v90[v211];
      int v213 = 0;
      int v214 = v91 + v213;
      int v215;
      v215 = v214;
      switch (v212) {
        case 0:
          {
          int v216 = 64;
          int v217 = v216 + v91;
          int v218 = v90[v217];
          int v219 = 0;
          bool v220 = v218 != v219;
          int v221;
          if (v220) {
            int v222 = 0;
            v221 = v222;
          } else {
            int v223 = 2;
            v221 = v223;
          }
          v215 = v221;
          break;
        }
        default:
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
            int v230 = v229 + v91;
            int v231 = 68;
            int v232 = v231 + v230;
            int v233 = v90[v232];
            int v234 = 0;
            bool v235 = v233 != v234;
            v226 = v226;
            v227 = v227;
            if (!v235) break;
            int v236 = v226 + v227;
            int v237 = 1;
            int v238 = v227 + v237;
            v226 = v236;
            v227 = v238;
          }
          bool v239 = true;
          v215 = v226;
          break;
        }
      }
      bool v240 = true;
      v148 = v215;
      break;
    }
    case 2:
      {
      int v241 = 0;
      int v242 = 0;
      int v243;
      int v244;
      v243 = v241;
      v244 = v242;
      while (true) {
        int v245 = 4;
        int v246 = v244 * v245;
        int v247 = v246 + v91;
        int v248 = 88;
        int v249 = v248 + v247;
        int v250 = v90[v249];
        int v251 = 0;
        bool v252 = v250 != v251;
        v243 = v243;
        v244 = v244;
        if (!v252) break;
        int v253 = v243 + v244;
        int v254 = 1;
        int v255 = v244 + v254;
        v243 = v253;
        v244 = v255;
        break;
        ;
      }
      bool v256 = true;
      v148 = v243;
      break;
    }
  }
  bool v257 = true;
  int v258 = 32;
  int v259 = v258 + v91;
  bool v260 = true;
  int v261 = simt_wave_count_bits(v260);
  v89[v259] = v261;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
