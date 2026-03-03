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
  int v7;
  v7 = v6;
  switch (v3) {
    default:
      {
      int v8 = 0;
      bool v9 = v2 != v8;
      int v10;
      if (v9) {
        int v11 = 2;
        int v12 = v3 % v11;
        int v13 = 4;
        int v14;
        v14 = v13;
        switch (v12) {
          case 0:
            {
            v14 = v0;
            break;
          }
          case 1:
            {
            v14 = v0;
            break;
          }
          default:
            {
            int v15 = 2;
            int v16 = v0 + v15;
            v14 = v16;
            break;
          }
        }
        int v17 = 2;
        int v18 = v0 + v17;
        v10 = v14;
      } else {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 1;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          int v24 = 4;
          int v25 = v0 + v24;
          v21 = v25;
        }
        v10 = v21;
      }
      int v26 = 2;
      int v27 = v0 + v26;
      v7 = v10;
    }
    case 0:
      {
      int v28 = 3;
      int v29 = v3 % v28;
      int v30 = 4;
      int v31;
      v31 = v30;
      switch (v29) {
        case 0:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            int v35 = 3;
            v34 = v35;
          } else {
            int v36 = 4;
            v34 = v36;
          }
          int v37 = 2;
          v31 = v34;
        }
        case 1:
          {
          v31 = v0;
          break;
        }
        case 2:
          {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 3;
          int v41 = v0 + v40;
          int v42;
          v42 = v41;
          switch (v39) {
            default:
              {
              int v43 = 0;
              int v44 = v0 + v43;
              v42 = v44;
            }
            case 0:
              {
              int v45 = 3;
              v42 = v45;
            }
            case 1:
              {
              v42 = v0;
            }
            case 2:
              {
              v42 = v0;
              break;
            }
          }
          v31 = v42;
        }
        default:
          {
          int v46 = 4;
          int v47 = v3 % v46;
          int v48 = 2;
          int v49 = v0 + v48;
          int v50;
          v50 = v49;
          switch (v47) {
            case 0:
              {
              int v51 = 0;
              int v52 = v0 + v51;
              v50 = v52;
              break;
            }
            default:
              {
              int v53 = 4;
              v50 = v53;
              break;
            }
            case 1:
              {
              int v54 = 1;
              int v55 = v0 + v54;
              v50 = v55;
              break;
            }
            case 2:
              {
              v50 = v0;
              break;
            }
          }
          int v56 = 2;
          int v57 = v0 + v56;
          v31 = v50;
          break;
        }
      }
      int v58 = 4;
      int v59 = v0 + v58;
      v7 = v31;
      break;
    }
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 0;
  int v63 = v62 + v0;
  v1[v63] = v61;
  int v64 = 0;
  bool v65 = v2 != v64;
  int v66 = v65 ? v5 : v7;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 4;
  int v77 = v69 + v76;
  int v78 = 1;
  uint v79 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v80 = (int)(v79);
  int v81 = 0;
  int v82 = 0;
  int v83;
  int v84;
  v83 = v81;
  v84 = v82;
  while (true) {
    int v85 = 4;
    int v86 = v84 * v85;
    int v87 = v86 + v69;
    int v88 = 8;
    int v89 = v88 + v87;
    int v90 = v68[v89];
    int v91 = 0;
    bool v92 = v90 != v91;
    v83 = v83;
    v84 = v84;
    if (!v92) break;
    uint v93 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v94 = (int)(v93);
    int v95 = v83 + v94;
    int v96 = 1;
    int v97 = v84 + v96;
    v83 = v95;
    v84 = v97;
  }
  bool v98 = true;
  int v99 = 16;
  int v100 = v99 + v69;
  bool v101 = true;
  int v102 = simt_wave_count_bits(v101);
  v67[v100] = v102;
  int v103 = 28;
  int v104 = v103 + v69;
  int v105 = v68[v104];
  int v106 = 0;
  bool v107 = v105 != v106;
  int v108;
  if (v107) {
    int v109 = 0;
    int v110 = 0;
    int v111;
    int v112;
    v111 = v109;
    v112 = v110;
    while (true) {
      int v113 = 4;
      int v114 = v112 * v113;
      int v115 = v114 + v69;
      int v116 = 32;
      int v117 = v116 + v115;
      int v118 = v68[v117];
      int v119 = 0;
      bool v120 = v118 != v119;
      v111 = v111;
      v112 = v112;
      if (!v120) break;
      int v121 = v111 + v112;
      int v122 = 1;
      int v123 = v112 + v122;
      v111 = v121;
      v112 = v123;
    }
    bool v124 = true;
    v108 = v111;
  } else {
    int v125 = 4;
    v108 = v125;
  }
  int v126 = 32;
  int v127 = v126 + v69;
  bool v128 = true;
  int v129 = simt_wave_count_bits(v128);
  v67[v127] = v129;
  int v130 = 52;
  int v131 = v130 + v69;
  int v132 = v68[v131];
  uint v133 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v134 = (int)(v133);
  int v135;
  v135 = v134;
  switch (v132) {
    case 0:
      {
      int v136 = 3;
      int v137 = v69 + v136;
      v135 = v137;
      break;
    }
    default:
      {
      int v138 = 56;
      int v139 = v138 + v69;
      int v140 = v68[v139];
      int v141 = 0;
      bool v142 = v140 != v141;
      int v143;
      if (v142) {
        int v144 = 0;
        int v145 = 0;
        int v146;
        int v147;
        v146 = v144;
        v147 = v145;
        while (true) {
          int v148 = 4;
          int v149 = v147 * v148;
          int v150 = v149 + v69;
          int v151 = 60;
          int v152 = v151 + v150;
          int v153 = v68[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          v146 = v146;
          v147 = v147;
          if (!v155) break;
          int v156 = v146 + v147;
          int v157 = 1;
          int v158 = v147 + v157;
          v146 = v156;
          v147 = v158;
        }
        bool v159 = true;
        v143 = v146;
      } else {
        int v160 = 80;
        int v161 = v160 + v69;
        int v162 = v68[v161];
        int v163 = 0;
        bool v164 = v162 != v163;
        int v165;
        if (v164) {
          v165 = v69;
        } else {
          int v166 = 1;
          int v167 = v69 + v166;
          v165 = v167;
        }
        v143 = v165;
      }
      v135 = v143;
      break;
    }
    case 1:
      {
      int v168 = 84;
      int v169 = v168 + v69;
      int v170 = v68[v169];
      int v171 = 3;
      int v172;
      v172 = v171;
      switch (v170) {
        case 0:
          {
          int v173 = 0;
          int v174 = 0;
          int v175;
          int v176;
          v175 = v173;
          v176 = v174;
          while (true) {
            int v177 = 4;
            int v178 = v176 * v177;
            int v179 = v178 + v69;
            int v180 = 88;
            int v181 = v180 + v179;
            int v182 = v68[v181];
            int v183 = 0;
            bool v184 = v182 != v183;
            v175 = v175;
            v176 = v176;
            if (!v184) break;
            int v185 = v175 + v176;
            int v186 = 1;
            int v187 = v176 + v186;
            v175 = v185;
            v176 = v187;
          }
          bool v188 = true;
          v172 = v175;
          break;
        }
        case 1:
          {
          int v189 = 1;
          v172 = v189;
          break;
        }
        default:
          {
          int v190 = 0;
          int v191 = 0;
          int v192;
          int v193;
          v192 = v190;
          v193 = v191;
          while (true) {
            int v194 = 4;
            int v195 = v193 * v194;
            int v196 = v195 + v69;
            int v197 = 108;
            int v198 = v197 + v196;
            int v199 = v68[v198];
            int v200 = 0;
            bool v201 = v199 != v200;
            v192 = v192;
            v193 = v193;
            if (!v201) break;
            int v202 = v192 + v193;
            int v203 = 1;
            int v204 = v193 + v203;
            v192 = v202;
            v193 = v204;
          }
          bool v205 = true;
          v172 = v192;
          break;
        }
      }
      bool v206 = true;
      v135 = v172;
      break;
    }
  }
  bool v207 = true;
  int v208 = 48;
  int v209 = v208 + v69;
  bool v210 = true;
  int v211 = simt_wave_count_bits(v210);
  v67[v209] = v211;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
