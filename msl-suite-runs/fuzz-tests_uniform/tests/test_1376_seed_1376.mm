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
    int v13 = 3;
    int v14 = v3 % v13;
    int v15 = 4;
    int v16;
    v16 = v15;
    switch (v14) {
      case 0:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 1;
          int v21 = v0 + v20;
          v19 = v21;
        } else {
          v19 = v0;
        }
        int v22 = 4;
        int v23 = v0 + v22;
        v16 = v19;
        break;
      }
      default:
        {
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          v26 = v0;
        } else {
          v26 = v0;
        }
        v16 = v26;
        break;
      }
      case 1:
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
          int v36 = 1;
          int v37 = v0 + v36;
          int v38 = 1;
          int v39 = v30 + v38;
          v29 = v37;
          v30 = v39;
          break;
          ;
        }
        int v40 = 0;
        v16 = v29;
        break;
      }
      case 2:
        {
        int v41 = 3;
        int v42 = v3 % v41;
        int v43 = 4;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          default:
            {
            int v46 = 2;
            int v47 = v0 + v46;
            v45 = v47;
            break;
          }
          case 0:
            {
            v45 = v0;
            break;
          }
          case 1:
            {
            int v48 = 3;
            v45 = v48;
            break;
          }
          case 2:
            {
            int v49 = 1;
            v45 = v49;
            break;
          }
        }
        int v50 = 0;
        int v51 = v0 + v50;
        v16 = v45;
        break;
      }
    }
    int v52 = 1;
    int v53 = v7 + v52;
    v6 = v16;
    v7 = v53;
    continue;
    ;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 0;
  int v68 = 0;
  int v69;
  int v70;
  v69 = v67;
  v70 = v68;
  while (true) {
    int v71 = 4;
    int v72 = v70 * v71;
    int v73 = v72 + v60;
    int v74 = 8;
    int v75 = v74 + v73;
    int v76 = v59[v75];
    int v77 = 0;
    bool v78 = v76 != v77;
    v69 = v69;
    v70 = v70;
    if (!v78) break;
    int v79 = 28;
    int v80 = v79 + v60;
    int v81 = v59[v80];
    int v82 = 3;
    int v83 = v60 + v82;
    int v84;
    v84 = v83;
    switch (v81) {
      case 0:
        {
        int v85 = 32;
        int v86 = v85 + v60;
        int v87 = v59[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        int v90;
        if (v89) {
          v90 = v60;
        } else {
          int v91 = 3;
          int v92 = v60 + v91;
          v90 = v92;
        }
        v84 = v90;
        break;
      }
      default:
        {
        int v93 = 36;
        int v94 = v93 + v60;
        int v95 = v59[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        int v98;
        if (v97) {
          v98 = v60;
        } else {
          int v99 = 1;
          int v100 = v60 + v99;
          v98 = v100;
        }
        v84 = v98;
        break;
      }
      case 1:
        {
        int v101 = 40;
        int v102 = v101 + v60;
        int v103 = v59[v102];
        int v104 = 0;
        bool v105 = v103 != v104;
        int v106;
        if (v105) {
          int v107 = 0;
          v106 = v107;
        } else {
          v106 = v60;
        }
        v84 = v106;
        break;
      }
    }
    bool v108 = true;
    int v109 = v69 + v84;
    int v110 = 1;
    int v111 = v70 + v110;
    v69 = v109;
    v70 = v111;
  }
  bool v112 = true;
  int v113 = 16;
  int v114 = v113 + v60;
  bool v115 = true;
  int v116 = simt_wave_count_bits(v115);
  v58[v114] = v116;
  int v117 = 44;
  int v118 = v117 + v60;
  int v119 = v59[v118];
  int v120 = 0;
  bool v121 = v119 != v120;
  int v122;
  if (v121) {
    int v123 = 48;
    int v124 = v123 + v60;
    int v125 = v59[v124];
    int v126 = 2;
    int v127;
    v127 = v126;
    switch (v125) {
      default:
        {
        int v128 = 52;
        int v129 = v128 + v60;
        int v130 = v59[v129];
        int v131;
        v131 = v60;
        switch (v130) {
          case 0:
            {
            v131 = v60;
            break;
          }
          case 1:
            {
            int v132 = 4;
            v131 = v132;
            break;
          }
          default:
            {
            int v133 = 3;
            int v134 = v60 + v133;
            v131 = v134;
            break;
          }
        }
        bool v135 = true;
        v127 = v131;
        break;
      }
      case 0:
        {
        int v136 = 1;
        v127 = v136;
        break;
      }
      case 1:
        {
        v127 = v60;
        break;
      }
    }
    bool v137 = true;
    v122 = v127;
  } else {
    int v138 = 56;
    int v139 = v138 + v60;
    int v140 = v59[v139];
    int v141 = 3;
    int v142 = v60 + v141;
    int v143;
    v143 = v142;
    switch (v140) {
      case 0:
        {
        int v144 = 1;
        int v145 = v60 + v144;
        v143 = v145;
      }
      default:
        {
        int v146 = 60;
        int v147 = v146 + v60;
        int v148 = v59[v147];
        int v149 = 4;
        int v150;
        v150 = v149;
        switch (v148) {
          case 0:
            {
            v150 = v60;
            break;
          }
          default:
            {
            v150 = v60;
            break;
          }
          case 1:
            {
            int v151 = 0;
            int v152 = v60 + v151;
            v150 = v152;
            break;
          }
        }
        bool v153 = true;
        v143 = v150;
        break;
      }
      case 1:
        {
        int v154 = 64;
        int v155 = v154 + v60;
        int v156 = v59[v155];
        int v157;
        v157 = v60;
        switch (v156) {
          case 0:
            {
            v157 = v60;
            break;
          }
          case 1:
            {
            v157 = v60;
            break;
          }
          default:
            {
            int v158 = 3;
            v157 = v158;
            break;
          }
          case 2:
            {
            int v159 = 4;
            int v160 = v60 + v159;
            v157 = v160;
            break;
          }
        }
        bool v161 = true;
        v143 = v157;
        break;
      }
    }
    bool v162 = true;
    v122 = v143;
  }
  int v163 = 32;
  int v164 = v163 + v60;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v58[v164] = v166;
  int v167 = 68;
  int v168 = v167 + v60;
  int v169 = v59[v168];
  int v170 = 0;
  bool v171 = v169 != v170;
  int v172;
  if (v171) {
    int v173 = 0;
    int v174 = 0;
    int v175;
    int v176;
    v175 = v173;
    v176 = v174;
    while (true) {
      int v177 = 4;
      int v178 = v176 * v177;
      int v179 = v178 + v60;
      int v180 = 72;
      int v181 = v180 + v179;
      int v182 = v59[v181];
      int v183 = 0;
      bool v184 = v182 != v183;
      v175 = v175;
      v176 = v176;
      if (!v184) break;
      int v185 = 4;
      int v186 = v175 + v185;
      int v187 = 1;
      int v188 = v176 + v187;
      v175 = v186;
      v176 = v188;
      continue;
      ;
    }
    bool v189 = true;
    v172 = v175;
  } else {
    int v190 = 92;
    int v191 = v190 + v60;
    int v192 = v59[v191];
    int v193 = 0;
    bool v194 = v192 != v193;
    int v195;
    if (v194) {
      int v196 = 96;
      int v197 = v196 + v60;
      int v198 = v59[v197];
      int v199;
      v199 = v60;
      switch (v198) {
        case 0:
          {
          int v200 = 1;
          int v201 = v60 + v200;
          v199 = v201;
          break;
        }
        case 1:
          {
          v199 = v60;
          break;
        }
        default:
          {
          int v202 = 3;
          int v203 = v60 + v202;
          v199 = v203;
          break;
        }
      }
      bool v204 = true;
      v195 = v199;
    } else {
      int v205 = 100;
      int v206 = v205 + v60;
      int v207 = v59[v206];
      int v208 = 0;
      bool v209 = v207 != v208;
      int v210;
      if (v209) {
        int v211 = 4;
        v210 = v211;
      } else {
        uint v212 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v213 = (int)(v212);
        v210 = v213;
      }
      v195 = v210;
    }
    v172 = v195;
  }
  int v214 = 48;
  int v215 = v214 + v60;
  bool v216 = true;
  int v217 = simt_wave_count_bits(v216);
  v58[v215] = v217;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
