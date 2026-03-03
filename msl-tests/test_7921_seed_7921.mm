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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      int v17;
      v17 = v16;
      switch (v3) {
        case 0:
          {
          int v18 = 1;
          int v19 = v0 + v18;
          v17 = v19;
          break;
        }
        default:
          {
          v17 = v0;
          break;
        }
      }
      int v20 = 0;
      int v21 = v0 + v20;
      int v22 = 1;
      int v23 = v10 + v22;
      v9 = v17;
      v10 = v23;
      continue;
      ;
    }
    v6 = v9;
  } else {
    int v24 = 4;
    int v25 = v3 % v24;
    uint v26 = simt_subgroup_id(__simt_tid);
    int v27 = (int)(v26);
    int v28;
    v28 = v27;
    switch (v25) {
      case 0:
        {
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
          int v38 = 1;
          int v39 = v32 + v38;
          v31 = v0;
          v32 = v39;
        }
        int v40 = 3;
        int v41 = v0 + v40;
        v28 = v31;
        break;
      }
      case 1:
        {
        int v42 = 0;
        int v43 = 0;
        int v44;
        int v45;
        v44 = v42;
        v45 = v43;
        while (true) {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 1;
          int v49 = v47 + v48;
          bool v50 = v45 < v49;
          v44 = v44;
          v45 = v45;
          if (!v50) break;
          int v51 = 2;
          int v52 = v0 + v51;
          int v53 = 1;
          int v54 = v45 + v53;
          v44 = v52;
          v45 = v54;
          continue;
          ;
        }
        int v55 = 2;
        v28 = v44;
      }
      default:
        {
        int v56 = 0;
        bool v57 = v2 != v56;
        int v58;
        if (v57) {
          int v59 = 4;
          v58 = v59;
        } else {
          int v60 = 3;
          int v61 = v0 + v60;
          v58 = v61;
        }
        int v62 = 1;
        v28 = v58;
        break;
      }
      case 2:
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
          int v72 = 1;
          int v73 = v66 + v72;
          v65 = v0;
          v66 = v73;
          break;
          ;
        }
        int v74 = 1;
        v28 = v65;
        break;
      }
    }
    int v75 = 3;
    v6 = v28;
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
    int v98 = 1;
    int v99;
    v99 = v98;
    switch (v97) {
      case 0:
        {
        int v100 = 16;
        int v101 = v100 + v82;
        int v102 = v81[v101];
        int v103 = 0;
        bool v104 = v102 != v103;
        int v105;
        if (v104) {
          int v106 = 2;
          v105 = v106;
        } else {
          v105 = v82;
        }
        v99 = v105;
      }
      default:
        {
        int v107 = 0;
        int v108 = 0;
        int v109;
        int v110;
        v109 = v107;
        v110 = v108;
        while (true) {
          int v111 = 4;
          int v112 = v110 * v111;
          int v113 = v112 + v82;
          int v114 = 20;
          int v115 = v114 + v113;
          int v116 = v81[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          v109 = v109;
          v110 = v110;
          if (!v118) break;
          int v119 = v109 + v110;
          int v120 = 1;
          int v121 = v110 + v120;
          v109 = v119;
          v110 = v121;
        }
        bool v122 = true;
        v99 = v109;
        break;
      }
      case 1:
        {
        int v123 = 1;
        int v124 = v82 + v123;
        v99 = v124;
        break;
      }
      case 2:
        {
        int v125 = 40;
        int v126 = v125 + v82;
        int v127 = v81[v126];
        int v128 = 1;
        int v129;
        v129 = v128;
        switch (v127) {
          default:
            {
            v129 = v82;
            break;
          }
          case 0:
            {
            int v130 = 3;
            v129 = v130;
            break;
          }
          case 1:
            {
            int v131 = 4;
            int v132 = v82 + v131;
            v129 = v132;
            break;
          }
          case 2:
            {
            int v133 = 2;
            int v134 = v82 + v133;
            v129 = v134;
            break;
          }
        }
        bool v135 = true;
        v99 = v129;
        break;
      }
    }
    bool v136 = true;
    v94 = v99;
  } else {
    uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v138 = (int)(v137);
    v94 = v138;
  }
  int v139 = 16;
  int v140 = v139 + v82;
  bool v141 = true;
  int v142 = simt_wave_count_bits(v141);
  v80[v140] = v142;
  int v143 = 44;
  int v144 = v143 + v82;
  int v145 = v81[v144];
  int v146 = 0;
  bool v147 = v145 != v146;
  int v148;
  if (v147) {
    int v149 = 48;
    int v150 = v149 + v82;
    int v151 = v81[v150];
    uint v152 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v153 = (int)(v152);
    int v154;
    v154 = v153;
    switch (v151) {
      default:
        {
        int v155 = 52;
        int v156 = v155 + v82;
        int v157 = v81[v156];
        int v158;
        v158 = v82;
        switch (v157) {
          case 0:
            {
            int v159 = 2;
            v158 = v159;
            break;
          }
          case 1:
            {
            v158 = v82;
            break;
          }
          default:
            {
            v158 = v82;
            break;
          }
        }
        bool v160 = true;
        v154 = v158;
      }
      case 0:
        {
        int v161 = 0;
        int v162 = 0;
        int v163;
        int v164;
        v163 = v161;
        v164 = v162;
        while (true) {
          int v165 = 4;
          int v166 = v164 * v165;
          int v167 = v166 + v82;
          int v168 = 56;
          int v169 = v168 + v167;
          int v170 = v81[v169];
          int v171 = 0;
          bool v172 = v170 != v171;
          v163 = v163;
          v164 = v164;
          if (!v172) break;
          int v173 = v163 + v164;
          int v174 = 1;
          int v175 = v164 + v174;
          v163 = v173;
          v164 = v175;
        }
        bool v176 = true;
        v154 = v163;
        break;
      }
      case 1:
        {
        int v177 = 76;
        int v178 = v177 + v82;
        int v179 = v81[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        int v182;
        if (v181) {
          v182 = v82;
        } else {
          int v183 = 0;
          v182 = v183;
        }
        v154 = v182;
        break;
      }
    }
    bool v184 = true;
    v148 = v154;
  } else {
    int v185 = 80;
    int v186 = v185 + v82;
    int v187 = v81[v186];
    int v188 = 0;
    bool v189 = v187 != v188;
    int v190;
    if (v189) {
      int v191 = 0;
      int v192 = 0;
      int v193;
      int v194;
      v193 = v191;
      v194 = v192;
      while (true) {
        int v195 = 4;
        int v196 = v194 * v195;
        int v197 = v196 + v82;
        int v198 = 84;
        int v199 = v198 + v197;
        int v200 = v81[v199];
        int v201 = 0;
        bool v202 = v200 != v201;
        v193 = v193;
        v194 = v194;
        if (!v202) break;
        int v203 = v193 + v194;
        int v204 = 1;
        int v205 = v194 + v204;
        v193 = v203;
        v194 = v205;
        break;
        ;
      }
      bool v206 = true;
      v190 = v193;
    } else {
      int v207 = 0;
      int v208 = 0;
      int v209;
      int v210;
      v209 = v207;
      v210 = v208;
      while (true) {
        int v211 = 4;
        int v212 = v210 * v211;
        int v213 = v212 + v82;
        int v214 = 104;
        int v215 = v214 + v213;
        int v216 = v81[v215];
        int v217 = 0;
        bool v218 = v216 != v217;
        v209 = v209;
        v210 = v210;
        if (!v218) break;
        int v219 = v209 + v210;
        int v220 = 1;
        int v221 = v210 + v220;
        v209 = v219;
        v210 = v221;
      }
      bool v222 = true;
      v190 = v209;
    }
    v148 = v190;
  }
  int v223 = 32;
  int v224 = v223 + v82;
  bool v225 = true;
  int v226 = simt_wave_count_bits(v225);
  v80[v224] = v226;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
