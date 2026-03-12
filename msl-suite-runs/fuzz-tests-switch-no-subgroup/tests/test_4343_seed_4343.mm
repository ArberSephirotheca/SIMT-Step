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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 4;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 3;
      int v14 = v3 % v13;
      int v15 = 4;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v14) {
        case 0:
          {
          int v18 = 0;
          bool v19 = v2 != v18;
          int v20;
          if (v19) {
            v20 = v0;
          } else {
            int v21 = 4;
            int v22 = v0 + v21;
            v20 = v22;
          }
          v17 = v20;
        }
        case 1:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 1;
            int v33 = v26 + v32;
            v25 = v0;
            v26 = v33;
          }
          v17 = v25;
        }
        default:
          {
          int v34 = 0;
          bool v35 = v2 != v34;
          int v36;
          if (v35) {
            int v37 = 0;
            v36 = v37;
          } else {
            int v38 = 2;
            int v39 = v0 + v38;
            v36 = v39;
          }
          v17 = v36;
          break;
        }
      }
      v12 = v17;
    }
    case 1:
      {
      int v40 = 2;
      int v41 = v3 % v40;
      int v42 = 0;
      int v43 = v0 + v42;
      int v44;
      v44 = v43;
      switch (v41) {
        default:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 4;
            int v55 = v0 + v54;
            int v56 = 1;
            int v57 = v48 + v56;
            v47 = v55;
            v48 = v57;
            break;
            ;
          }
          v44 = v47;
        }
        case 0:
          {
          int v58 = 3;
          int v59 = v3 % v58;
          int v60;
          v60 = v0;
          switch (v59) {
            case 0:
              {
              v60 = v0;
              break;
            }
            case 1:
              {
              v60 = v0;
              break;
            }
            case 2:
              {
              v60 = v0;
              break;
            }
            default:
              {
              int v61 = 0;
              v60 = v61;
              break;
            }
          }
          v44 = v60;
          break;
        }
      }
      v12 = v44;
      break;
    }
    default:
      {
      int v62 = 0;
      bool v63 = v2 != v62;
      int v64;
      if (v63) {
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          v67 = v0;
        } else {
          int v68 = 2;
          v67 = v68;
        }
        v64 = v67;
      } else {
        int v69 = 3;
        int v70 = v3 % v69;
        int v71;
        v71 = v0;
        switch (v70) {
          case 0:
            {
            v71 = v0;
          }
          case 1:
            {
            v71 = v0;
          }
          case 2:
            {
            v71 = v0;
          }
          default:
            {
            v71 = v0;
            break;
          }
        }
        v64 = v71;
      }
      v12 = v64;
    }
    case 2:
      {
      int v72 = 0;
      bool v73 = v2 != v72;
      int v74;
      if (v73) {
        int v75;
        v75 = v0;
        switch (v3) {
          case 0:
            {
            v75 = v0;
            break;
          }
          default:
            {
            v75 = v0;
            break;
          }
        }
        int v76 = 3;
        v74 = v75;
      } else {
        int v77 = 1;
        v74 = v77;
      }
      v12 = v74;
      break;
    }
  }
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  int v80 = 16;
  int v81 = v80 + v0;
  v1[v81] = v79;
  int v82 = 0;
  bool v83 = v2 != v82;
  int v84 = v83 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v85 [[buffer(0)]], device int* v86 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v87 = static_cast<int>(__simt_tid3.x);
  int v88 = 0;
  int v89 = v88 + v87;
  int v90 = v86[v89];
  int v91 = 4;
  int v92 = v91 + v87;
  int v93 = v86[v92];
  int v94 = 0;
  bool v95 = v90 != v94;
  if (v95) {
  } else {
    int v96 = 8;
    int v97 = v96 + v87;
    int v98 = v86[v97];
    int v99 = 0;
    bool v100 = v98 != v99;
    if (v100) {
    } else {
      helper0(v87, v85, v90, v93, static_cast<int>(__simt_tid3.x));
    }
  }
  int v101 = 12;
  int v102 = v101 + v87;
  int v103 = v86[v102];
  int v104 = 0;
  bool v105 = v103 != v104;
  int v106;
  if (v105) {
    int v107 = 0;
    int v108 = 0;
    int v109;
    int v110;
    v109 = v107;
    v110 = v108;
    while (true) {
      int v111 = 4;
      int v112 = v110 * v111;
      int v113 = v112 + v87;
      int v114 = 16;
      int v115 = v114 + v113;
      int v116 = v86[v115];
      int v117 = 0;
      bool v118 = v116 != v117;
      v109 = v109;
      v110 = v110;
      if (!v118) break;
      int v119 = v109 + v110;
      int v120 = 1;
      int v121 = v110 + v120;
      bool v122 = true;
      int v123 = 32;
      int v124 = 4;
      int v125 = v110 * v124;
      int v126 = v123 + v125;
      int v127 = v126 + v87;
      bool v128 = true;
      int v129 = simt_wave_count_bits(v128);
      v85[v127] = v129;
      v109 = v119;
      v110 = v121;
    }
    v106 = v109;
  } else {
    int v130 = 36;
    int v131 = v130 + v87;
    int v132 = v86[v131];
    int v133 = 0;
    bool v134 = v132 != v133;
    int v135;
    if (v134) {
      int v136 = 40;
      int v137 = v136 + v87;
      int v138 = v86[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 3;
        int v143 = v87 + v142;
        v141 = v143;
      } else {
        int v144 = 3;
        v141 = v144;
      }
      int v145 = 48;
      int v146 = v145 + v87;
      bool v147 = true;
      int v148 = simt_wave_count_bits(v147);
      v85[v146] = v148;
      v135 = v141;
    } else {
      int v149 = 44;
      int v150 = v149 + v87;
      int v151 = v86[v150];
      int v152 = 4;
      int v153;
      v153 = v152;
      switch (v151) {
        default:
          {
          int v154 = 1;
          v153 = v154;
          break;
        }
        case 0:
          {
          v153 = v87;
          break;
        }
      }
      bool v155 = true;
      int v156 = 64;
      int v157 = v156 + v87;
      bool v158 = true;
      int v159 = simt_wave_count_bits(v158);
      v85[v157] = v159;
      v135 = v153;
    }
    int v160 = 80;
    int v161 = v160 + v87;
    bool v162 = true;
    int v163 = simt_wave_count_bits(v162);
    v85[v161] = v163;
    v106 = v135;
  }
  int v164 = 96;
  int v165 = v164 + v87;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v85[v165] = v167;
  uint v168 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v169 = (int)(v168);
  int v170 = 0;
  int v171 = 0;
  int v172;
  int v173;
  v172 = v170;
  v173 = v171;
  while (true) {
    int v174 = 4;
    int v175 = v173 * v174;
    int v176 = v175 + v87;
    int v177 = 48;
    int v178 = v177 + v176;
    int v179 = v86[v178];
    int v180 = 0;
    bool v181 = v179 != v180;
    v172 = v172;
    v173 = v173;
    if (!v181) break;
    uint v182 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v183 = (int)(v182);
    int v184 = v172 + v183;
    int v185 = 1;
    int v186 = v173 + v185;
    bool v187 = true;
    int v188 = 112;
    int v189 = 4;
    int v190 = v173 * v189;
    int v191 = v188 + v190;
    int v192 = v191 + v87;
    bool v193 = true;
    int v194 = simt_wave_count_bits(v193);
    v85[v192] = v194;
    v172 = v184;
    v173 = v186;
    break;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 116; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
