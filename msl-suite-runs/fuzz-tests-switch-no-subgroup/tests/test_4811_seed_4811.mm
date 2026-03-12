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
      bool v16 = true;
      int v17 = simt_wave_count_bits(v16);
      int v18 = 0;
      int v19 = 4;
      int v20 = v7 * v19;
      int v21 = v18 + v20;
      int v22 = v21 + v0;
      v1[v22] = v17;
      v15 = v17;
    } else {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        bool v26 = true;
        int v27 = simt_wave_count_bits(v26);
        int v28 = 16;
        int v29 = 4;
        int v30 = v7 * v29;
        int v31 = v28 + v30;
        int v32 = v31 + v0;
        v1[v32] = v27;
        v25 = v27;
      } else {
        bool v33 = true;
        int v34 = simt_wave_count_bits(v33);
        int v35 = 32;
        int v36 = 4;
        int v37 = v7 * v36;
        int v38 = v35 + v37;
        int v39 = v38 + v0;
        v1[v39] = v34;
        v25 = v34;
      }
      v15 = v25;
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
    int v53 = 8;
    int v54 = v53 + v44;
    int v55 = v43[v54];
    int v56 = 0;
    bool v57 = v55 != v56;
    if (v57) {
    } else {
      helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
    }
  }
  uint v58 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v59 = (int)(v58);
  int v60 = 12;
  int v61 = v60 + v44;
  int v62 = v43[v61];
  int v63 = 1;
  int v64;
  v64 = v63;
  switch (v62) {
    default:
      {
      int v65 = 16;
      int v66 = v65 + v44;
      int v67 = v43[v66];
      int v68 = 1;
      int v69;
      v69 = v68;
      switch (v67) {
        default:
          {
          int v70 = 20;
          int v71 = v70 + v44;
          int v72 = v43[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            int v76 = 4;
            v75 = v76;
          } else {
            int v77 = 2;
            v75 = v77;
          }
          v69 = v75;
        }
        case 0:
          {
          int v78 = 24;
          int v79 = v78 + v44;
          int v80 = v43[v79];
          int v81 = 0;
          int v82;
          v82 = v81;
          switch (v80) {
            case 0:
              {
              int v83 = 1;
              v82 = v83;
            }
            default:
              {
              int v84 = 3;
              v82 = v84;
              break;
            }
            case 1:
              {
              v82 = v44;
              break;
            }
          }
          bool v85 = true;
          v69 = v82;
          break;
        }
      }
      v64 = v69;
    }
    case 0:
      {
      int v86 = 28;
      int v87 = v86 + v44;
      int v88 = v43[v87];
      int v89 = 3;
      int v90 = v44 + v89;
      int v91;
      v91 = v90;
      switch (v88) {
        case 0:
          {
          int v92 = 32;
          int v93 = v92 + v44;
          int v94 = v43[v93];
          int v95 = 0;
          bool v96 = v94 != v95;
          int v97;
          if (v96) {
            int v98 = 3;
            v97 = v98;
          } else {
            int v99 = 2;
            v97 = v99;
          }
          v91 = v97;
          break;
        }
        case 1:
          {
          int v100 = 36;
          int v101 = v100 + v44;
          int v102 = v43[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            int v106 = 2;
            int v107 = v44 + v106;
            v105 = v107;
          } else {
            v105 = v44;
          }
          v91 = v105;
          break;
        }
        default:
          {
          int v108 = 0;
          int v109 = 0;
          int v110;
          int v111;
          v110 = v108;
          v111 = v109;
          while (true) {
            int v112 = 4;
            int v113 = v111 * v112;
            int v114 = v113 + v44;
            int v115 = 40;
            int v116 = v115 + v114;
            int v117 = v43[v116];
            int v118 = 0;
            bool v119 = v117 != v118;
            v110 = v110;
            v111 = v111;
            if (!v119) break;
            int v120 = v110 + v111;
            int v121 = 1;
            int v122 = v111 + v121;
            bool v123 = true;
            v110 = v120;
            v111 = v122;
          }
          v91 = v110;
          break;
        }
        case 2:
          {
          int v124 = 60;
          int v125 = v124 + v44;
          int v126 = v43[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            int v130 = 0;
            int v131 = v44 + v130;
            v129 = v131;
          } else {
            int v132 = 1;
            int v133 = v44 + v132;
            v129 = v133;
          }
          v91 = v129;
          break;
        }
      }
      v64 = v91;
    }
    case 1:
      {
      int v134 = 64;
      int v135 = v134 + v44;
      int v136 = v43[v135];
      int v137;
      v137 = v44;
      switch (v136) {
        case 0:
          {
          int v138 = 4;
          int v139 = v44 + v138;
          v137 = v139;
          break;
        }
        default:
          {
          int v140 = 68;
          int v141 = v140 + v44;
          int v142 = v43[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          int v145;
          if (v144) {
            v145 = v44;
          } else {
            int v146 = 0;
            int v147 = v44 + v146;
            v145 = v147;
          }
          v137 = v145;
          break;
        }
      }
      bool v148 = true;
      v64 = v137;
    }
    case 2:
      {
      int v149 = 72;
      int v150 = v149 + v44;
      int v151 = v43[v150];
      int v152;
      v152 = v44;
      switch (v151) {
        default:
          {
          int v153 = 0;
          int v154 = 0;
          int v155;
          int v156;
          v155 = v153;
          v156 = v154;
          while (true) {
            int v157 = 4;
            int v158 = v156 * v157;
            int v159 = v158 + v44;
            int v160 = 76;
            int v161 = v160 + v159;
            int v162 = v43[v161];
            int v163 = 0;
            bool v164 = v162 != v163;
            v155 = v155;
            v156 = v156;
            if (!v164) break;
            int v165 = v155 + v156;
            int v166 = 1;
            int v167 = v156 + v166;
            bool v168 = true;
            v155 = v165;
            v156 = v167;
          }
          v152 = v155;
          break;
        }
        case 0:
          {
          int v169 = 0;
          int v170 = 0;
          int v171;
          int v172;
          v171 = v169;
          v172 = v170;
          while (true) {
            int v173 = 4;
            int v174 = v172 * v173;
            int v175 = v174 + v44;
            int v176 = 96;
            int v177 = v176 + v175;
            int v178 = v43[v177];
            int v179 = 0;
            bool v180 = v178 != v179;
            v171 = v171;
            v172 = v172;
            if (!v180) break;
            int v181 = v171 + v172;
            int v182 = 1;
            int v183 = v172 + v182;
            bool v184 = true;
            v171 = v181;
            v172 = v183;
            continue;
            ;
          }
          v152 = v171;
        }
        case 1:
          {
          int v185 = 0;
          int v186 = 0;
          int v187;
          int v188;
          v187 = v185;
          v188 = v186;
          while (true) {
            int v189 = 4;
            int v190 = v188 * v189;
            int v191 = v190 + v44;
            int v192 = 116;
            int v193 = v192 + v191;
            int v194 = v43[v193];
            int v195 = 0;
            bool v196 = v194 != v195;
            v187 = v187;
            v188 = v188;
            if (!v196) break;
            int v197 = v187 + v188;
            int v198 = 1;
            int v199 = v188 + v198;
            bool v200 = true;
            v187 = v197;
            v188 = v199;
          }
          v152 = v187;
          break;
        }
        case 2:
          {
          v152 = v44;
          break;
        }
      }
      v64 = v152;
      break;
    }
  }
  bool v201 = true;
  int v202 = 48;
  int v203 = v202 + v44;
  bool v204 = true;
  int v205 = simt_wave_count_bits(v204);
  v42[v203] = v205;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
