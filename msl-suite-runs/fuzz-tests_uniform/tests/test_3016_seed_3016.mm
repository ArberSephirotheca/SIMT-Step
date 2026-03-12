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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 4;
    int v8 = v3 % v7;
    int v9 = 3;
    int v10;
    v10 = v9;
    switch (v8) {
      case 0:
        {
        int v11 = 0;
        bool v12 = v2 != v11;
        int v13;
        if (v12) {
          int v14 = 1;
          v13 = v14;
        } else {
          int v15 = 2;
          v13 = v15;
        }
        int v16 = 3;
        int v17 = v0 + v16;
        v10 = v13;
        break;
      }
      case 1:
        {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            int v23 = 2;
            v22 = v23;
            break;
          }
          case 1:
            {
            v22 = v0;
          }
          default:
            {
            int v24 = 4;
            v22 = v24;
            break;
          }
        }
        int v25 = 0;
        v10 = v22;
        break;
      }
      default:
        {
        v10 = v0;
        break;
      }
      case 2:
        {
        int v26 = 2;
        v10 = v26;
        break;
      }
    }
    v6 = v10;
  } else {
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
      int v36 = 0;
      int v37 = 0;
      int v38;
      int v39;
      v38 = v36;
      v39 = v37;
      while (true) {
        int v40 = 4;
        int v41 = v3 % v40;
        int v42 = 1;
        int v43 = v41 + v42;
        bool v44 = v39 < v43;
        v38 = v38;
        v39 = v39;
        if (!v44) break;
        int v45 = 1;
        int v46 = v39 + v45;
        v38 = v0;
        v39 = v46;
      }
      int v47 = 3;
      int v48 = v0 + v47;
      int v49 = 1;
      int v50 = v30 + v49;
      v29 = v38;
      v30 = v50;
      break;
      ;
    }
    uint v51 = simt_lane_id(__simt_tid);
    int v52 = (int)(v51);
    v6 = v29;
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 0;
  int v67 = 0;
  int v68;
  int v69;
  v68 = v66;
  v69 = v67;
  while (true) {
    int v70 = 4;
    int v71 = v69 * v70;
    int v72 = v71 + v59;
    int v73 = 8;
    int v74 = v73 + v72;
    int v75 = v58[v74];
    int v76 = 0;
    bool v77 = v75 != v76;
    v68 = v68;
    v69 = v69;
    if (!v77) break;
    int v78 = 0;
    int v79 = 0;
    int v80;
    int v81;
    v80 = v78;
    v81 = v79;
    while (true) {
      int v82 = 4;
      int v83 = v81 * v82;
      int v84 = v83 + v59;
      int v85 = 28;
      int v86 = v85 + v84;
      int v87 = v58[v86];
      int v88 = 0;
      bool v89 = v87 != v88;
      v80 = v80;
      v81 = v81;
      if (!v89) break;
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v59;
        int v97 = 48;
        int v98 = v97 + v96;
        int v99 = v58[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = v92 + v93;
        int v103 = 1;
        int v104 = v93 + v103;
        v92 = v102;
        v93 = v104;
        break;
        ;
      }
      bool v105 = true;
      int v106 = v80 + v92;
      int v107 = 1;
      int v108 = v81 + v107;
      v80 = v106;
      v81 = v108;
    }
    bool v109 = true;
    int v110 = v68 + v80;
    int v111 = 1;
    int v112 = v69 + v111;
    v68 = v110;
    v69 = v112;
    continue;
    ;
  }
  bool v113 = true;
  int v114 = 16;
  int v115 = v114 + v59;
  bool v116 = true;
  int v117 = simt_wave_count_bits(v116);
  v57[v115] = v117;
  int v118 = 68;
  int v119 = v118 + v59;
  int v120 = v58[v119];
  uint v121 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v122 = (int)(v121);
  int v123;
  v123 = v122;
  switch (v120) {
    case 0:
      {
      int v124 = 0;
      int v125 = 0;
      int v126;
      int v127;
      v126 = v124;
      v127 = v125;
      while (true) {
        int v128 = 4;
        int v129 = v127 * v128;
        int v130 = v129 + v59;
        int v131 = 72;
        int v132 = v131 + v130;
        int v133 = v58[v132];
        int v134 = 0;
        bool v135 = v133 != v134;
        v126 = v126;
        v127 = v127;
        if (!v135) break;
        int v136 = v126 + v127;
        int v137 = 1;
        int v138 = v127 + v137;
        v126 = v136;
        v127 = v138;
      }
      bool v139 = true;
      v123 = v126;
      break;
    }
    default:
      {
      int v140 = 92;
      int v141 = v140 + v59;
      int v142 = v58[v141];
      int v143;
      v143 = v59;
      switch (v142) {
        case 0:
          {
          int v144 = 96;
          int v145 = v144 + v59;
          int v146 = v58[v145];
          int v147 = 0;
          int v148 = v59 + v147;
          int v149;
          v149 = v148;
          switch (v146) {
            case 0:
              {
              v149 = v59;
              break;
            }
            default:
              {
              int v150 = 2;
              v149 = v150;
              break;
            }
          }
          bool v151 = true;
          v143 = v149;
          break;
        }
        case 1:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v59;
            int v159 = 100;
            int v160 = v159 + v158;
            int v161 = v58[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            v154 = v164;
            v155 = v166;
          }
          bool v167 = true;
          v143 = v154;
          break;
        }
        default:
          {
          int v168 = 0;
          int v169 = 0;
          int v170;
          int v171;
          v170 = v168;
          v171 = v169;
          while (true) {
            int v172 = 4;
            int v173 = v171 * v172;
            int v174 = v173 + v59;
            int v175 = 120;
            int v176 = v175 + v174;
            int v177 = v58[v176];
            int v178 = 0;
            bool v179 = v177 != v178;
            v170 = v170;
            v171 = v171;
            if (!v179) break;
            int v180 = v170 + v171;
            int v181 = 1;
            int v182 = v171 + v181;
            v170 = v180;
            v171 = v182;
            break;
            ;
          }
          bool v183 = true;
          v143 = v170;
          break;
        }
        case 2:
          {
          int v184 = 0;
          int v185 = 0;
          int v186;
          int v187;
          v186 = v184;
          v187 = v185;
          while (true) {
            int v188 = 4;
            int v189 = v187 * v188;
            int v190 = v189 + v59;
            int v191 = 140;
            int v192 = v191 + v190;
            int v193 = v58[v192];
            int v194 = 0;
            bool v195 = v193 != v194;
            v186 = v186;
            v187 = v187;
            if (!v195) break;
            int v196 = v186 + v187;
            int v197 = 1;
            int v198 = v187 + v197;
            v186 = v196;
            v187 = v198;
          }
          bool v199 = true;
          v143 = v186;
          break;
        }
      }
      bool v200 = true;
      v123 = v143;
      break;
    }
  }
  bool v201 = true;
  int v202 = 32;
  int v203 = v202 + v59;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v57[v203] = v205;
  int v206 = 160;
  int v207 = v206 + v59;
  int v208 = v58[v207];
  int v209 = 0;
  bool v210 = v208 != v209;
  int v211;
  if (v210) {
    int v212 = 2;
    int v213 = v59 + v212;
    v211 = v213;
  } else {
    int v214 = 164;
    int v215 = v214 + v59;
    int v216 = v58[v215];
    int v217 = 0;
    int v218 = v59 + v217;
    int v219;
    v219 = v218;
    switch (v216) {
      default:
        {
        int v220 = 168;
        int v221 = v220 + v59;
        int v222 = v58[v221];
        int v223 = 0;
        bool v224 = v222 != v223;
        int v225;
        if (v224) {
          v225 = v59;
        } else {
          int v226 = 1;
          int v227 = v59 + v226;
          v225 = v227;
        }
        v219 = v225;
        break;
      }
      case 0:
        {
        int v228 = 172;
        int v229 = v228 + v59;
        int v230 = v58[v229];
        int v231 = 0;
        bool v232 = v230 != v231;
        int v233;
        if (v232) {
          v233 = v59;
        } else {
          int v234 = 1;
          v233 = v234;
        }
        v219 = v233;
        break;
      }
      case 1:
        {
        int v235 = 176;
        int v236 = v235 + v59;
        int v237 = v58[v236];
        int v238 = 0;
        bool v239 = v237 != v238;
        int v240;
        if (v239) {
          v240 = v59;
        } else {
          int v241 = 0;
          int v242 = v59 + v241;
          v240 = v242;
        }
        v219 = v240;
        break;
      }
    }
    bool v243 = true;
    v211 = v219;
  }
  int v244 = 48;
  int v245 = v244 + v59;
  bool v246 = true;
  int v247 = simt_wave_count_bits(v246);
  v57[v245] = v247;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 180; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
