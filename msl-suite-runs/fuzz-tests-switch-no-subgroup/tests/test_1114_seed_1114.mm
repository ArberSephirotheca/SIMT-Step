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
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 4;
        int v13 = v0 + v12;
        int v14;
        v14 = v13;
        switch (v3) {
          case 0:
            {
            int v15 = 2;
            v14 = v15;
          }
          default:
            {
            int v16 = 1;
            v14 = v16;
            break;
          }
        }
        v11 = v14;
      } else {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 0;
          int v21 = v0 + v20;
          v19 = v21;
        } else {
          int v22 = 4;
          v19 = v22;
        }
        v11 = v19;
      }
      v8 = v11;
      break;
    }
    case 0:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 2;
          v28 = v29;
        } else {
          int v30 = 4;
          int v31 = v0 + v30;
          v28 = v31;
        }
        v25 = v28;
      } else {
        int v32 = 0;
        bool v33 = v2 != v32;
        int v34;
        if (v33) {
          int v35 = 2;
          v34 = v35;
        } else {
          int v36 = 4;
          int v37 = v0 + v36;
          v34 = v37;
        }
        v25 = v34;
      }
      v8 = v25;
      break;
    }
    case 1:
      {
      int v38 = 0;
      bool v39 = v2 != v38;
      int v40;
      if (v39) {
        int v41 = 0;
        int v42 = v0 + v41;
        v40 = v42;
      } else {
        int v43 = 2;
        v40 = v43;
      }
      v8 = v40;
    }
    case 2:
      {
      int v44 = 0;
      int v45 = 0;
      int v46;
      int v47;
      v46 = v44;
      v47 = v45;
      while (true) {
        int v48 = 4;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51 = v49 + v50;
        bool v52 = v47 < v51;
        v46 = v46;
        v47 = v47;
        if (!v52) break;
        int v53 = 0;
        int v54 = 0;
        int v55;
        int v56;
        v55 = v53;
        v56 = v54;
        while (true) {
          int v57 = 4;
          int v58 = v3 % v57;
          int v59 = 1;
          int v60 = v58 + v59;
          bool v61 = v56 < v60;
          v55 = v55;
          v56 = v56;
          if (!v61) break;
          int v62 = 1;
          int v63 = v56 + v62;
          v55 = v0;
          v56 = v63;
        }
        int v64 = 1;
        int v65 = v47 + v64;
        v46 = v55;
        v47 = v65;
      }
      v8 = v46;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  int v79 = 0;
  bool v80 = v75 != v79;
  if (v80) {
    int v81 = 8;
    int v82 = v81 + v72;
    int v83 = v71[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    if (v85) {
    } else {
      int v86 = 2;
      int v87 = v72 % v86;
      int v88;
      v88 = v72;
      switch (v87) {
        case 0:
          {
          int v89 = 1;
          int v90 = v88 + v89;
          v88 = v90;
          break;
        }
        case 1:
          {
          int v91 = 2;
          int v92 = v88 + v91;
          v88 = v92;
          break;
        }
        default:
          {
          int v93 = 4;
          int v94 = v88 + v93;
          v88 = v94;
          break;
        }
      }
      helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v95 = 12;
  int v96 = v95 + v72;
  int v97 = v71[v96];
  int v98 = 0;
  bool v99 = v97 != v98;
  int v100;
  if (v99) {
    int v101 = 0;
    int v102 = 0;
    int v103;
    int v104;
    v103 = v101;
    v104 = v102;
    while (true) {
      int v105 = 4;
      int v106 = v104 * v105;
      int v107 = v106 + v72;
      int v108 = 16;
      int v109 = v108 + v107;
      int v110 = v71[v109];
      int v111 = 0;
      bool v112 = v110 != v111;
      v103 = v103;
      v104 = v104;
      if (!v112) break;
      int v113 = v103 + v104;
      int v114 = 1;
      int v115 = v104 + v114;
      bool v116 = true;
      int v117 = 16;
      int v118 = 4;
      int v119 = v104 * v118;
      int v120 = v117 + v119;
      int v121 = v120 + v72;
      bool v122 = true;
      int v123 = simt_wave_count_bits(v122);
      v70[v121] = v123;
      v103 = v113;
      v104 = v115;
    }
    v100 = v103;
  } else {
    uint v124 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v125 = (int)(v124);
    v100 = v125;
  }
  int v126 = 32;
  int v127 = v126 + v72;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v70[v127] = v129;
  int v130 = 36;
  int v131 = v130 + v72;
  int v132 = v71[v131];
  int v133;
  v133 = v72;
  switch (v132) {
    case 0:
      {
      v133 = v72;
    }
    default:
      {
      int v134 = 40;
      int v135 = v134 + v72;
      int v136 = v71[v135];
      int v137 = 0;
      bool v138 = v136 != v137;
      int v139;
      if (v138) {
        v139 = v72;
      } else {
        int v140 = 44;
        int v141 = v140 + v72;
        int v142 = v71[v141];
        int v143;
        v143 = v72;
        switch (v142) {
          case 0:
            {
            v143 = v72;
            break;
          }
          case 1:
            {
            v143 = v72;
            break;
          }
          default:
            {
            v143 = v72;
            break;
          }
        }
        bool v144 = true;
        v139 = v143;
      }
      v133 = v139;
      break;
    }
  }
  int v145 = 0;
  int v146 = 0;
  int v147;
  int v148;
  v147 = v145;
  v148 = v146;
  while (true) {
    int v149 = 4;
    int v150 = v148 * v149;
    int v151 = v150 + v72;
    int v152 = 48;
    int v153 = v152 + v151;
    int v154 = v71[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    v147 = v147;
    v148 = v148;
    if (!v156) break;
    int v157 = 68;
    int v158 = v157 + v72;
    int v159 = v71[v158];
    uint v160 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v161 = (int)(v160);
    int v162;
    v162 = v161;
    switch (v159) {
      case 0:
        {
        int v163 = 72;
        int v164 = v163 + v72;
        int v165 = v71[v164];
        int v166;
        v166 = v72;
        switch (v165) {
          default:
            {
            v166 = v72;
            break;
          }
          case 0:
            {
            v166 = v72;
            break;
          }
        }
        bool v167 = true;
        v162 = v166;
        break;
      }
      case 1:
        {
        int v168 = 76;
        int v169 = v168 + v72;
        int v170 = v71[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        int v173;
        if (v172) {
          int v174 = 4;
          int v175 = v72 + v174;
          v173 = v175;
        } else {
          int v176 = 1;
          int v177 = v72 + v176;
          v173 = v177;
        }
        v162 = v173;
        break;
      }
      case 2:
        {
        int v178 = 80;
        int v179 = v178 + v72;
        int v180 = v71[v179];
        int v181;
        v181 = v72;
        switch (v180) {
          case 0:
            {
            int v182 = 3;
            int v183 = v72 + v182;
            v181 = v183;
          }
          default:
            {
            int v184 = 0;
            v181 = v184;
          }
          case 1:
            {
            int v185 = 4;
            v181 = v185;
            break;
          }
        }
        v162 = v181;
        break;
      }
      default:
        {
        int v186 = 0;
        int v187 = 0;
        int v188;
        int v189;
        v188 = v186;
        v189 = v187;
        while (true) {
          int v190 = 4;
          int v191 = v189 * v190;
          int v192 = v191 + v72;
          int v193 = 84;
          int v194 = v193 + v192;
          int v195 = v71[v194];
          int v196 = 0;
          bool v197 = v195 != v196;
          v188 = v188;
          v189 = v189;
          if (!v197) break;
          int v198 = v188 + v189;
          int v199 = 1;
          int v200 = v189 + v199;
          bool v201 = true;
          v188 = v198;
          v189 = v200;
        }
        v162 = v188;
        break;
      }
    }
    bool v202 = true;
    int v203 = 48;
    int v204 = v203 + v72;
    bool v205 = true;
    int v206 = simt_wave_count_bits(v205);
    v70[v204] = v206;
    int v207 = v147 + v162;
    int v208 = 1;
    int v209 = v148 + v208;
    bool v210 = true;
    int v211 = 64;
    int v212 = 4;
    int v213 = v148 * v212;
    int v214 = v211 + v213;
    int v215 = v214 + v72;
    bool v216 = true;
    int v217 = simt_wave_count_bits(v216);
    v70[v215] = v217;
    v147 = v207;
    v148 = v209;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
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
