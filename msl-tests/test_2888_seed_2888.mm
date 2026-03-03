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
    int v15;
    v15 = v0;
    switch (v14) {
      case 0:
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
          int v25 = 2;
          int v26 = v0 + v25;
          int v27 = 1;
          int v28 = v19 + v27;
          v18 = v26;
          v19 = v28;
        }
        v15 = v18;
        break;
      }
      case 1:
        {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32;
        v32 = v31;
        switch (v30) {
          default:
            {
            int v33 = 0;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          case 0:
            {
            int v35 = 1;
            int v36 = v0 + v35;
            v32 = v36;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          case 2:
            {
            int v37 = 2;
            int v38 = v0 + v37;
            v32 = v38;
            break;
          }
        }
        v15 = v32;
        break;
      }
      default:
        {
        int v39 = 0;
        bool v40 = v2 != v39;
        int v41;
        if (v40) {
          int v42 = 3;
          v41 = v42;
        } else {
          v41 = v0;
        }
        int v43 = 1;
        int v44 = v0 + v43;
        v15 = v41;
        break;
      }
    }
    int v45 = 0;
    int v46 = 1;
    int v47 = v7 + v46;
    v6 = v15;
    v7 = v47;
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 8;
  int v62 = v61 + v54;
  int v63 = v53[v62];
  int v64 = 0;
  bool v65 = v63 != v64;
  int v66;
  if (v65) {
    uint v67 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v68 = (int)(v67);
    v66 = v68;
  } else {
    int v69 = 0;
    int v70 = 0;
    int v71;
    int v72;
    v71 = v69;
    v72 = v70;
    while (true) {
      int v73 = 4;
      int v74 = v72 * v73;
      int v75 = v74 + v54;
      int v76 = 12;
      int v77 = v76 + v75;
      int v78 = v53[v77];
      int v79 = 0;
      bool v80 = v78 != v79;
      v71 = v71;
      v72 = v72;
      if (!v80) break;
      int v81 = 32;
      int v82 = v81 + v54;
      int v83 = v53[v82];
      int v84 = 0;
      bool v85 = v83 != v84;
      int v86;
      if (v85) {
        int v87 = 4;
        int v88 = v54 + v87;
        v86 = v88;
      } else {
        v86 = v54;
      }
      int v89 = v71 + v86;
      int v90 = 1;
      int v91 = v72 + v90;
      v71 = v89;
      v72 = v91;
      break;
      ;
    }
    bool v92 = true;
    v66 = v71;
  }
  int v93 = 16;
  int v94 = v93 + v54;
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  v52[v94] = v96;
  int v97 = 36;
  int v98 = v97 + v54;
  int v99 = v53[v98];
  uint v100 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v101 = (int)(v100);
  int v102;
  v102 = v101;
  switch (v99) {
    case 0:
      {
      int v103 = 0;
      int v104 = 0;
      int v105;
      int v106;
      v105 = v103;
      v106 = v104;
      while (true) {
        int v107 = 4;
        int v108 = v106 * v107;
        int v109 = v108 + v54;
        int v110 = 40;
        int v111 = v110 + v109;
        int v112 = v53[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        v105 = v105;
        v106 = v106;
        if (!v114) break;
        int v115 = 0;
        int v116 = 0;
        int v117;
        int v118;
        v117 = v115;
        v118 = v116;
        while (true) {
          int v119 = 4;
          int v120 = v118 * v119;
          int v121 = v120 + v54;
          int v122 = 60;
          int v123 = v122 + v121;
          int v124 = v53[v123];
          int v125 = 0;
          bool v126 = v124 != v125;
          v117 = v117;
          v118 = v118;
          if (!v126) break;
          int v127 = v117 + v118;
          int v128 = 1;
          int v129 = v118 + v128;
          v117 = v127;
          v118 = v129;
        }
        bool v130 = true;
        int v131 = v105 + v117;
        int v132 = 1;
        int v133 = v106 + v132;
        v105 = v131;
        v106 = v133;
      }
      bool v134 = true;
      v102 = v105;
      break;
    }
    case 1:
      {
      v102 = v54;
      break;
    }
    case 2:
      {
      int v135 = 80;
      int v136 = v135 + v54;
      int v137 = v53[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        int v141 = 4;
        v140 = v141;
      } else {
        int v142 = 84;
        int v143 = v142 + v54;
        int v144 = v53[v143];
        int v145 = 0;
        bool v146 = v144 != v145;
        int v147;
        if (v146) {
          int v148 = 3;
          v147 = v148;
        } else {
          v147 = v54;
        }
        v140 = v147;
      }
      v102 = v140;
      break;
    }
    default:
      {
      int v149 = 88;
      int v150 = v149 + v54;
      int v151 = v53[v150];
      int v152 = 3;
      int v153;
      v153 = v152;
      switch (v151) {
        case 0:
          {
          int v154 = 92;
          int v155 = v154 + v54;
          int v156 = v53[v155];
          int v157 = 0;
          int v158 = v54 + v157;
          int v159;
          v159 = v158;
          switch (v156) {
            case 0:
              {
              int v160 = 3;
              v159 = v160;
              break;
            }
            default:
              {
              v159 = v54;
              break;
            }
            case 1:
              {
              int v161 = 4;
              v159 = v161;
              break;
            }
            case 2:
              {
              v159 = v54;
              break;
            }
          }
          bool v162 = true;
          v153 = v159;
        }
        default:
          {
          int v163 = 96;
          int v164 = v163 + v54;
          int v165 = v53[v164];
          int v166 = 0;
          bool v167 = v165 != v166;
          int v168;
          if (v167) {
            int v169 = 3;
            v168 = v169;
          } else {
            int v170 = 4;
            v168 = v170;
          }
          v153 = v168;
        }
        case 1:
          {
          v153 = v54;
          break;
        }
      }
      bool v171 = true;
      v102 = v153;
      break;
    }
  }
  bool v172 = true;
  int v173 = 32;
  int v174 = v173 + v54;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v52[v174] = v176;
  int v177 = 100;
  int v178 = v177 + v54;
  int v179 = v53[v178];
  int v180 = 3;
  int v181 = v54 + v180;
  int v182;
  v182 = v181;
  switch (v179) {
    case 0:
      {
      int v183 = 0;
      int v184 = 0;
      int v185;
      int v186;
      v185 = v183;
      v186 = v184;
      while (true) {
        int v187 = 4;
        int v188 = v186 * v187;
        int v189 = v188 + v54;
        int v190 = 104;
        int v191 = v190 + v189;
        int v192 = v53[v191];
        int v193 = 0;
        bool v194 = v192 != v193;
        v185 = v185;
        v186 = v186;
        if (!v194) break;
        int v195 = 124;
        int v196 = v195 + v54;
        int v197 = v53[v196];
        int v198;
        v198 = v54;
        switch (v197) {
          case 0:
            {
            int v199 = 3;
            v198 = v199;
            break;
          }
          default:
            {
            v198 = v54;
            break;
          }
        }
        bool v200 = true;
        int v201 = v185 + v198;
        int v202 = 1;
        int v203 = v186 + v202;
        v185 = v201;
        v186 = v203;
      }
      bool v204 = true;
      v182 = v185;
    }
    default:
      {
      int v205 = 128;
      int v206 = v205 + v54;
      int v207 = v53[v206];
      int v208 = 0;
      bool v209 = v207 != v208;
      int v210;
      if (v209) {
        v210 = v54;
      } else {
        v210 = v54;
      }
      v182 = v210;
      break;
    }
    case 1:
      {
      int v211 = 132;
      int v212 = v211 + v54;
      int v213 = v53[v212];
      int v214;
      v214 = v54;
      switch (v213) {
        case 0:
          {
          int v215 = 3;
          v214 = v215;
          break;
        }
        case 1:
          {
          int v216 = 1;
          v214 = v216;
          break;
        }
        default:
          {
          v214 = v54;
          break;
        }
      }
      bool v217 = true;
      v182 = v214;
      break;
    }
  }
  bool v218 = true;
  int v219 = 48;
  int v220 = v219 + v54;
  bool v221 = true;
  int v222 = simt_wave_count_bits(v221);
  v52[v220] = v222;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 136; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
