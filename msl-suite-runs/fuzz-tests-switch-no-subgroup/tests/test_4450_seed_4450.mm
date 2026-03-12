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
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        bool v19 = true;
        int v20 = simt_wave_count_bits(v19);
        int v21 = 0;
        int v22 = 4;
        int v23 = v7 * v22;
        int v24 = v21 + v23;
        int v25 = v24 + v0;
        v1[v25] = v20;
        v18 = v20;
      } else {
        bool v26 = true;
        int v27 = simt_wave_count_bits(v26);
        int v28 = 16;
        int v29 = 4;
        int v30 = v7 * v29;
        int v31 = v28 + v30;
        int v32 = v31 + v0;
        v1[v32] = v27;
        v18 = v27;
      }
      v15 = v18;
    } else {
      bool v33 = true;
      int v34 = simt_wave_count_bits(v33);
      int v35 = 32;
      int v36 = 4;
      int v37 = v7 * v36;
      int v38 = v35 + v37;
      int v39 = v38 + v0;
      v1[v39] = v34;
      v15 = v34;
    }
    int v40 = 1;
    int v41 = v7 + v40;
    v6 = v15;
    v7 = v41;
  }
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  int v51 = 0;
  bool v52 = v47 != v51;
  if (v52) {
  } else {
    int v53 = 0;
    int v54 = 0;
    int v55;
    int v56;
    v55 = v53;
    v56 = v54;
    while (true) {
      int v57 = 2;
      bool v58 = v56 < v57;
      v55 = v55;
      v56 = v56;
      if (!v58) break;
      helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
      int v59 = 1;
      int v60 = v56 + v59;
      v55 = v55;
      v56 = v60;
    }
  }
  int v61 = 8;
  int v62 = v61 + v44;
  int v63 = v43[v62];
  uint v64 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v65 = (int)(v64);
  int v66;
  v66 = v65;
  switch (v63) {
    case 0:
      {
      int v67 = 12;
      int v68 = v67 + v44;
      int v69 = v43[v68];
      int v70 = 0;
      bool v71 = v69 != v70;
      int v72;
      if (v71) {
        int v73 = 16;
        int v74 = v73 + v44;
        int v75 = v43[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        int v78;
        if (v77) {
          int v79 = 3;
          v78 = v79;
        } else {
          int v80 = 2;
          int v81 = v44 + v80;
          v78 = v81;
        }
        v72 = v78;
      } else {
        int v82 = 4;
        v72 = v82;
      }
      v66 = v72;
      break;
    }
    default:
      {
      int v83 = 20;
      int v84 = v83 + v44;
      int v85 = v43[v84];
      int v86 = 0;
      bool v87 = v85 != v86;
      int v88;
      if (v87) {
        int v89 = 24;
        int v90 = v89 + v44;
        int v91 = v43[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        int v94;
        if (v93) {
          int v95 = 1;
          v94 = v95;
        } else {
          v94 = v44;
        }
        v88 = v94;
      } else {
        int v96 = 4;
        v88 = v96;
      }
      v66 = v88;
      break;
    }
    case 1:
      {
      int v97 = 28;
      int v98 = v97 + v44;
      int v99 = v43[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v44;
          int v110 = 32;
          int v111 = v110 + v109;
          int v112 = v43[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          bool v118 = true;
          v105 = v115;
          v106 = v117;
        }
        v102 = v105;
      } else {
        int v119 = 52;
        int v120 = v119 + v44;
        int v121 = v43[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v44;
        } else {
          int v125 = 0;
          v124 = v125;
        }
        v102 = v124;
      }
      v66 = v102;
      break;
    }
    case 2:
      {
      int v126 = 56;
      int v127 = v126 + v44;
      int v128 = v43[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        int v132 = 60;
        int v133 = v132 + v44;
        int v134 = v43[v133];
        int v135 = 2;
        int v136 = v44 + v135;
        int v137;
        v137 = v136;
        switch (v134) {
          case 0:
            {
            v137 = v44;
            break;
          }
          default:
            {
            int v138 = 3;
            int v139 = v44 + v138;
            v137 = v139;
            break;
          }
          case 1:
            {
            int v140 = 4;
            int v141 = v44 + v140;
            v137 = v141;
            break;
          }
        }
        v131 = v137;
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
          int v148 = v147 + v44;
          int v149 = 64;
          int v150 = v149 + v148;
          int v151 = v43[v150];
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
          continue;
          ;
        }
        v131 = v144;
      }
      v66 = v131;
      break;
    }
  }
  int v158 = 84;
  int v159 = v158 + v44;
  int v160 = v43[v159];
  uint v161 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v162 = (int)(v161);
  int v163;
  v163 = v162;
  switch (v160) {
    case 0:
      {
      int v164 = 1;
      int v165 = v44 + v164;
      v163 = v165;
    }
    case 1:
      {
      int v166 = 88;
      int v167 = v166 + v44;
      int v168 = v43[v167];
      int v169 = 0;
      bool v170 = v168 != v169;
      int v171;
      if (v170) {
        int v172 = 92;
        int v173 = v172 + v44;
        int v174 = v43[v173];
        int v175 = 0;
        bool v176 = v174 != v175;
        int v177;
        if (v176) {
          v177 = v44;
        } else {
          int v178 = 0;
          int v179 = v44 + v178;
          v177 = v179;
        }
        v171 = v177;
      } else {
        int v180 = 96;
        int v181 = v180 + v44;
        int v182 = v43[v181];
        int v183 = 1;
        int v184;
        v184 = v183;
        switch (v182) {
          case 0:
            {
            v184 = v44;
            break;
          }
          case 1:
            {
            int v185 = 4;
            int v186 = v44 + v185;
            v184 = v186;
            break;
          }
          case 2:
            {
            int v187 = 3;
            v184 = v187;
            break;
          }
          default:
            {
            int v188 = 3;
            int v189 = v44 + v188;
            v184 = v189;
            break;
          }
        }
        v171 = v184;
      }
      v163 = v171;
      break;
    }
    default:
      {
      int v190 = 100;
      int v191 = v190 + v44;
      int v192 = v43[v191];
      int v193 = 0;
      bool v194 = v192 != v193;
      int v195;
      if (v194) {
        int v196 = 104;
        int v197 = v196 + v44;
        int v198 = v43[v197];
        int v199 = 0;
        bool v200 = v198 != v199;
        int v201;
        if (v200) {
          int v202 = 0;
          int v203 = v44 + v202;
          v201 = v203;
        } else {
          int v204 = 2;
          v201 = v204;
        }
        v195 = v201;
      } else {
        int v205 = 108;
        int v206 = v205 + v44;
        int v207 = v43[v206];
        int v208 = 0;
        bool v209 = v207 != v208;
        int v210;
        if (v209) {
          int v211 = 2;
          int v212 = v44 + v211;
          v210 = v212;
        } else {
          int v213 = 1;
          int v214 = v44 + v213;
          v210 = v214;
        }
        v195 = v210;
      }
      v163 = v195;
      break;
    }
    case 2:
      {
      v163 = v44;
      break;
    }
  }
  bool v215 = true;
  int v216 = 48;
  int v217 = v216 + v44;
  bool v218 = true;
  int v219 = simt_wave_count_bits(v218);
  v42[v217] = v219;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
