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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    default:
      {
      int v11 = 0;
      int v12 = 0;
      int v13;
      int v14;
      v13 = v11;
      v14 = v12;
      while (true) {
        int v15 = 4;
        int v16 = v3 % v15;
        int v17 = 1;
        int v18 = v16 + v17;
        bool v19 = v14 < v18;
        v13 = v13;
        v14 = v14;
        if (!v19) break;
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          int v23 = 0;
          int v24 = v0 + v23;
          v22 = v24;
        } else {
          v22 = v0;
        }
        int v25 = 1;
        int v26 = v14 + v25;
        v13 = v22;
        v14 = v26;
      }
      int v27 = 1;
      int v28 = v0 + v27;
      v8 = v13;
      break;
    }
    case 1:
      {
      int v29 = 0;
      bool v30 = v2 != v29;
      int v31;
      if (v30) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 3;
        int v35 = v0 + v34;
        int v36;
        v36 = v35;
        switch (v33) {
          case 0:
            {
            int v37 = 4;
            v36 = v37;
            break;
          }
          default:
            {
            v36 = v0;
            break;
          }
          case 1:
            {
            int v38 = 0;
            int v39 = v0 + v38;
            v36 = v39;
            break;
          }
          case 2:
            {
            int v40 = 1;
            v36 = v40;
            break;
          }
        }
        int v41 = 3;
        int v42 = v0 + v41;
        v31 = v36;
      } else {
        int v43 = 1;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v3) {
          case 0:
            {
            int v46 = 0;
            v45 = v46;
            break;
          }
          default:
            {
            v45 = v0;
            break;
          }
        }
        int v47 = 1;
        v31 = v45;
      }
      int v48 = 4;
      int v49 = v0 + v48;
      v8 = v31;
      break;
    }
    case 2:
      {
      int v50 = 0;
      int v51 = 0;
      int v52;
      int v53;
      v52 = v50;
      v53 = v51;
      while (true) {
        int v54 = 4;
        int v55 = v3 % v54;
        int v56 = 1;
        int v57 = v55 + v56;
        bool v58 = v53 < v57;
        v52 = v52;
        v53 = v53;
        if (!v58) break;
        int v59 = 0;
        int v60 = 0;
        int v61;
        int v62;
        v61 = v59;
        v62 = v60;
        while (true) {
          int v63 = 4;
          int v64 = v3 % v63;
          int v65 = 1;
          int v66 = v64 + v65;
          bool v67 = v62 < v66;
          v61 = v61;
          v62 = v62;
          if (!v67) break;
          int v68 = 4;
          int v69 = v0 + v68;
          int v70 = 1;
          int v71 = v62 + v70;
          v61 = v69;
          v62 = v71;
        }
        int v72 = 1;
        int v73 = v53 + v72;
        v52 = v61;
        v53 = v73;
      }
      int v74 = 2;
      int v75 = v0 + v74;
      v8 = v52;
      break;
    }
  }
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  int v78 = 0;
  int v79 = v78 + v0;
  v1[v79] = v77;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  int v92 = 0;
  bool v93 = v91 != v92;
  int v94;
  if (v93) {
    int v95 = 12;
    int v96 = v95 + v82;
    int v97 = v81[v96];
    int v98;
    v98 = v82;
    switch (v97) {
      case 0:
        {
        int v99 = 16;
        int v100 = v99 + v82;
        int v101 = v81[v100];
        int v102 = 3;
        int v103 = v82 + v102;
        int v104;
        v104 = v103;
        switch (v101) {
          case 0:
            {
            int v105 = 0;
            v104 = v105;
            break;
          }
          default:
            {
            int v106 = 4;
            int v107 = v82 + v106;
            v104 = v107;
            break;
          }
          case 1:
            {
            int v108 = 2;
            int v109 = v82 + v108;
            v104 = v109;
            break;
          }
          case 2:
            {
            int v110 = 1;
            int v111 = v82 + v110;
            v104 = v111;
            break;
          }
        }
        bool v112 = true;
        v98 = v104;
        break;
      }
      default:
        {
        int v113 = 2;
        v98 = v113;
        break;
      }
    }
    bool v114 = true;
    v94 = v98;
  } else {
    int v115 = 1;
    v94 = v115;
  }
  int v116 = 16;
  int v117 = v116 + v82;
  bool v118 = true;
  int v119 = simt_wave_count_bits(v118);
  v80[v117] = v119;
  int v120 = 20;
  int v121 = v120 + v82;
  int v122 = v81[v121];
  int v123 = 4;
  int v124 = v82 + v123;
  int v125;
  v125 = v124;
  switch (v122) {
    case 0:
      {
      int v126 = 24;
      int v127 = v126 + v82;
      int v128 = v81[v127];
      int v129 = 3;
      int v130;
      v130 = v129;
      switch (v128) {
        case 0:
          {
          int v131 = 28;
          int v132 = v131 + v82;
          int v133 = v81[v132];
          int v134 = 0;
          bool v135 = v133 != v134;
          int v136;
          if (v135) {
            int v137 = 0;
            int v138 = v82 + v137;
            v136 = v138;
          } else {
            v136 = v82;
          }
          v130 = v136;
          break;
        }
        case 1:
          {
          int v139 = 0;
          int v140 = 0;
          int v141;
          int v142;
          v141 = v139;
          v142 = v140;
          while (true) {
            int v143 = 4;
            int v144 = v142 * v143;
            int v145 = v144 + v82;
            int v146 = 32;
            int v147 = v146 + v145;
            int v148 = v81[v147];
            int v149 = 0;
            bool v150 = v148 != v149;
            v141 = v141;
            v142 = v142;
            if (!v150) break;
            int v151 = v141 + v142;
            int v152 = 1;
            int v153 = v142 + v152;
            v141 = v151;
            v142 = v153;
            continue;
            ;
          }
          bool v154 = true;
          v130 = v141;
          break;
        }
        case 2:
          {
          int v155 = 0;
          int v156 = 0;
          int v157;
          int v158;
          v157 = v155;
          v158 = v156;
          while (true) {
            int v159 = 4;
            int v160 = v158 * v159;
            int v161 = v160 + v82;
            int v162 = 52;
            int v163 = v162 + v161;
            int v164 = v81[v163];
            int v165 = 0;
            bool v166 = v164 != v165;
            v157 = v157;
            v158 = v158;
            if (!v166) break;
            int v167 = v157 + v158;
            int v168 = 1;
            int v169 = v158 + v168;
            v157 = v167;
            v158 = v169;
          }
          bool v170 = true;
          v130 = v157;
          break;
        }
        default:
          {
          int v171 = 72;
          int v172 = v171 + v82;
          int v173 = v81[v172];
          int v174 = 0;
          bool v175 = v173 != v174;
          int v176;
          if (v175) {
            int v177 = 2;
            int v178 = v82 + v177;
            v176 = v178;
          } else {
            int v179 = 2;
            v176 = v179;
          }
          v130 = v176;
          break;
        }
      }
      bool v180 = true;
      v125 = v130;
      break;
    }
    default:
      {
      int v181 = 76;
      int v182 = v181 + v82;
      int v183 = v81[v182];
      int v184;
      v184 = v82;
      switch (v183) {
        default:
          {
          int v185 = 80;
          int v186 = v185 + v82;
          int v187 = v81[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            v190 = v82;
          } else {
            int v191 = 1;
            v190 = v191;
          }
          v184 = v190;
        }
        case 0:
          {
          int v192 = 84;
          int v193 = v192 + v82;
          int v194 = v81[v193];
          int v195 = 0;
          bool v196 = v194 != v195;
          int v197;
          if (v196) {
            int v198 = 2;
            v197 = v198;
          } else {
            v197 = v82;
          }
          v184 = v197;
        }
        case 1:
          {
          int v199 = 2;
          v184 = v199;
          break;
        }
      }
      bool v200 = true;
      v125 = v184;
      break;
    }
  }
  bool v201 = true;
  int v202 = 32;
  int v203 = v202 + v82;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v80[v203] = v205;
  int v206 = 0;
  int v207 = 0;
  int v208;
  int v209;
  v208 = v206;
  v209 = v207;
  while (true) {
    int v210 = 4;
    int v211 = v209 * v210;
    int v212 = v211 + v82;
    int v213 = 88;
    int v214 = v213 + v212;
    int v215 = v81[v214];
    int v216 = 0;
    bool v217 = v215 != v216;
    v208 = v208;
    v209 = v209;
    if (!v217) break;
    int v218 = 0;
    int v219 = 0;
    int v220;
    int v221;
    v220 = v218;
    v221 = v219;
    while (true) {
      int v222 = 4;
      int v223 = v221 * v222;
      int v224 = v223 + v82;
      int v225 = 108;
      int v226 = v225 + v224;
      int v227 = v81[v226];
      int v228 = 0;
      bool v229 = v227 != v228;
      v220 = v220;
      v221 = v221;
      if (!v229) break;
      int v230 = 128;
      int v231 = v230 + v82;
      int v232 = v81[v231];
      uint v233 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v234 = (int)(v233);
      int v235;
      v235 = v234;
      switch (v232) {
        case 0:
          {
          int v236 = 0;
          int v237 = v82 + v236;
          v235 = v237;
          break;
        }
        case 1:
          {
          int v238 = 1;
          int v239 = v82 + v238;
          v235 = v239;
          break;
        }
        case 2:
          {
          int v240 = 0;
          int v241 = v82 + v240;
          v235 = v241;
          break;
        }
        default:
          {
          v235 = v82;
          break;
        }
      }
      bool v242 = true;
      int v243 = v220 + v235;
      int v244 = 1;
      int v245 = v221 + v244;
      v220 = v243;
      v221 = v245;
    }
    bool v246 = true;
    int v247 = v208 + v220;
    int v248 = 1;
    int v249 = v209 + v248;
    v208 = v247;
    v209 = v249;
  }
  bool v250 = true;
  int v251 = 48;
  int v252 = v251 + v82;
  bool v253 = true;
  int v254 = simt_wave_count_bits(v253);
  v80[v252] = v254;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
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
