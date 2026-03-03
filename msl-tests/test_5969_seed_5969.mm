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
    int v13 = 2;
    int v14 = v3 % v13;
    int v15 = 2;
    int v16 = v0 + v15;
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
        int v18 = 0;
        int v19 = 0;
        int v20;
        int v21;
        v20 = v18;
        v21 = v19;
        while (true) {
          int v22 = 4;
          int v23 = v3 % v22;
          int v24 = 1;
          int v25 = v23 + v24;
          bool v26 = v21 < v25;
          v20 = v20;
          v21 = v21;
          if (!v26) break;
          int v27 = 2;
          int v28 = 1;
          int v29 = v21 + v28;
          v20 = v27;
          v21 = v29;
        }
        int v30 = 4;
        int v31 = v0 + v30;
        v17 = v20;
      }
      default:
        {
        int v32 = 2;
        v17 = v32;
        break;
      }
      case 1:
        {
        int v33 = 0;
        int v34 = 0;
        int v35;
        int v36;
        v35 = v33;
        v36 = v34;
        while (true) {
          int v37 = 4;
          int v38 = v3 % v37;
          int v39 = 1;
          int v40 = v38 + v39;
          bool v41 = v36 < v40;
          v35 = v35;
          v36 = v36;
          if (!v41) break;
          int v42 = 4;
          int v43 = 1;
          int v44 = v36 + v43;
          v35 = v42;
          v36 = v44;
        }
        int v45 = 4;
        v17 = v35;
        break;
      }
    }
    uint v46 = simt_subgroup_id(__simt_tid);
    int v47 = (int)(v46);
    int v48 = 1;
    int v49 = v7 + v48;
    v6 = v17;
    v7 = v49;
    break;
    ;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
  int v63 = 8;
  int v64 = v63 + v56;
  int v65 = v55[v64];
  int v66 = 0;
  bool v67 = v65 != v66;
  int v68;
  if (v67) {
    int v69 = 12;
    int v70 = v69 + v56;
    int v71 = v55[v70];
    int v72;
    v72 = v56;
    switch (v71) {
      default:
        {
        int v73 = 0;
        int v74 = 0;
        int v75;
        int v76;
        v75 = v73;
        v76 = v74;
        while (true) {
          int v77 = 4;
          int v78 = v76 * v77;
          int v79 = v78 + v56;
          int v80 = 16;
          int v81 = v80 + v79;
          int v82 = v55[v81];
          int v83 = 0;
          bool v84 = v82 != v83;
          v75 = v75;
          v76 = v76;
          if (!v84) break;
          int v85 = v75 + v76;
          int v86 = 1;
          int v87 = v76 + v86;
          v75 = v85;
          v76 = v87;
          break;
          ;
        }
        bool v88 = true;
        v72 = v75;
      }
      case 0:
        {
        int v89 = 36;
        int v90 = v89 + v56;
        int v91 = v55[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        int v94;
        if (v93) {
          int v95 = 2;
          int v96 = v56 + v95;
          v94 = v96;
        } else {
          v94 = v56;
        }
        v72 = v94;
        break;
      }
    }
    bool v97 = true;
    v68 = v72;
  } else {
    uint v98 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v99 = (int)(v98);
    v68 = v99;
  }
  int v100 = 16;
  int v101 = v100 + v56;
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  v54[v101] = v103;
  int v104 = 40;
  int v105 = v104 + v56;
  int v106 = v55[v105];
  int v107 = 0;
  bool v108 = v106 != v107;
  int v109;
  if (v108) {
    int v110 = 44;
    int v111 = v110 + v56;
    int v112 = v55[v111];
    uint v113 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v114 = (int)(v113);
    int v115;
    v115 = v114;
    switch (v112) {
      case 0:
        {
        int v116 = 48;
        int v117 = v116 + v56;
        int v118 = v55[v117];
        int v119 = 0;
        int v120;
        v120 = v119;
        switch (v118) {
          case 0:
            {
            int v121 = 1;
            int v122 = v56 + v121;
            v120 = v122;
            break;
          }
          default:
            {
            v120 = v56;
            break;
          }
          case 1:
            {
            int v123 = 0;
            v120 = v123;
            break;
          }
        }
        bool v124 = true;
        v115 = v120;
        break;
      }
      case 1:
        {
        int v125 = 52;
        int v126 = v125 + v56;
        int v127 = v55[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          int v131 = 2;
          int v132 = v56 + v131;
          v130 = v132;
        } else {
          int v133 = 0;
          v130 = v133;
        }
        v115 = v130;
        break;
      }
      default:
        {
        int v134 = 56;
        int v135 = v134 + v56;
        int v136 = v55[v135];
        int v137 = 0;
        bool v138 = v136 != v137;
        int v139;
        if (v138) {
          int v140 = 0;
          v139 = v140;
        } else {
          v139 = v56;
        }
        v115 = v139;
        break;
      }
    }
    bool v141 = true;
    v109 = v115;
  } else {
    int v142 = 0;
    int v143 = 0;
    int v144;
    int v145;
    v144 = v142;
    v145 = v143;
    while (true) {
      int v146 = 4;
      int v147 = v145 * v146;
      int v148 = v147 + v56;
      int v149 = 60;
      int v150 = v149 + v148;
      int v151 = v55[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      v144 = v144;
      v145 = v145;
      if (!v153) break;
      int v154 = v144 + v145;
      int v155 = 1;
      int v156 = v145 + v155;
      v144 = v154;
      v145 = v156;
    }
    bool v157 = true;
    v109 = v144;
  }
  int v158 = 32;
  int v159 = v158 + v56;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v54[v159] = v161;
  int v162 = 80;
  int v163 = v162 + v56;
  int v164 = v55[v163];
  uint v165 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v166 = (int)(v165);
  int v167;
  v167 = v166;
  switch (v164) {
    case 0:
      {
      int v168 = 84;
      int v169 = v168 + v56;
      int v170 = v55[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      int v173;
      if (v172) {
        int v174 = 88;
        int v175 = v174 + v56;
        int v176 = v55[v175];
        int v177 = 0;
        bool v178 = v176 != v177;
        int v179;
        if (v178) {
          int v180 = 0;
          int v181 = v56 + v180;
          v179 = v181;
        } else {
          int v182 = 3;
          int v183 = v56 + v182;
          v179 = v183;
        }
        v173 = v179;
      } else {
        int v184 = 92;
        int v185 = v184 + v56;
        int v186 = v55[v185];
        int v187;
        v187 = v56;
        switch (v186) {
          default:
            {
            int v188 = 1;
            v187 = v188;
            break;
          }
          case 0:
            {
            int v189 = 2;
            v187 = v189;
          }
          case 1:
            {
            int v190 = 1;
            int v191 = v56 + v190;
            v187 = v191;
          }
          case 2:
            {
            int v192 = 0;
            int v193 = v56 + v192;
            v187 = v193;
            break;
          }
        }
        bool v194 = true;
        v173 = v187;
      }
      v167 = v173;
      break;
    }
    default:
      {
      int v195 = 0;
      int v196 = 0;
      int v197;
      int v198;
      v197 = v195;
      v198 = v196;
      while (true) {
        int v199 = 4;
        int v200 = v198 * v199;
        int v201 = v200 + v56;
        int v202 = 96;
        int v203 = v202 + v201;
        int v204 = v55[v203];
        int v205 = 0;
        bool v206 = v204 != v205;
        v197 = v197;
        v198 = v198;
        if (!v206) break;
        int v207 = 116;
        int v208 = v207 + v56;
        int v209 = v55[v208];
        int v210 = 1;
        int v211 = v56 + v210;
        int v212;
        v212 = v211;
        switch (v209) {
          case 0:
            {
            int v213 = 0;
            int v214 = v56 + v213;
            v212 = v214;
            break;
          }
          case 1:
            {
            int v215 = 0;
            int v216 = v56 + v215;
            v212 = v216;
            break;
          }
          default:
            {
            v212 = v56;
          }
          case 2:
            {
            int v217 = 0;
            v212 = v217;
            break;
          }
        }
        bool v218 = true;
        int v219 = v197 + v212;
        int v220 = 1;
        int v221 = v198 + v220;
        v197 = v219;
        v198 = v221;
      }
      bool v222 = true;
      v167 = v197;
      break;
    }
  }
  bool v223 = true;
  int v224 = 48;
  int v225 = v224 + v56;
  bool v226 = true;
  int v227 = simt_wave_count_bits(v226);
  v54[v225] = v227;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
