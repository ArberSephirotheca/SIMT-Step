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
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v3) {
      case 0:
        {
        int v12 = 2;
        v11 = v12;
        break;
      }
      default:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          int v16 = 0;
          int v17 = v0 + v16;
          v15 = v17;
        } else {
          int v18 = 2;
          v15 = v18;
        }
        v11 = v15;
        break;
      }
    }
    int v19 = 3;
    v8 = v11;
  } else {
    int v20 = 0;
    int v21 = 0;
    int v22;
    int v23;
    v22 = v20;
    v23 = v21;
    while (true) {
      int v24 = 4;
      int v25 = v3 % v24;
      int v26 = 1;
      int v27 = v25 + v26;
      bool v28 = v23 < v27;
      v22 = v22;
      v23 = v23;
      if (!v28) break;
      int v29 = 2;
      int v30 = v3 % v29;
      int v31 = 1;
      int v32;
      v32 = v31;
      switch (v30) {
        case 0:
          {
          int v33 = 0;
          int v34 = v0 + v33;
          v32 = v34;
          break;
        }
        case 1:
          {
          int v35 = 1;
          int v36 = v0 + v35;
          v32 = v36;
          break;
        }
        default:
          {
          int v37 = 4;
          int v38 = v0 + v37;
          v32 = v38;
          break;
        }
      }
      int v39 = 4;
      int v40 = 1;
      int v41 = v23 + v40;
      v22 = v32;
      v23 = v41;
    }
    uint v42 = simt_subgroup_id(__simt_tid);
    int v43 = (int)(v42);
    v8 = v22;
  }
  bool v44 = true;
  int v45 = simt_wave_count_bits(v44);
  int v46 = 0;
  int v47 = v46 + v0;
  v1[v47] = v45;
  int v48 = 0;
  bool v49 = v2 != v48;
  int v50 = v49 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v51 [[buffer(0)]], device int* v52 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v53 = static_cast<int>(__simt_tid3.x);
  int v54 = 0;
  int v55 = v54 + v53;
  int v56 = v52[v55];
  int v57 = 4;
  int v58 = v57 + v53;
  int v59 = v52[v58];
  helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
  int v60 = 0;
  int v61 = 0;
  int v62;
  int v63;
  v62 = v60;
  v63 = v61;
  while (true) {
    int v64 = 4;
    int v65 = v63 * v64;
    int v66 = v65 + v53;
    int v67 = 8;
    int v68 = v67 + v66;
    int v69 = v52[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    v62 = v62;
    v63 = v63;
    if (!v71) break;
    int v72 = v62 + v63;
    int v73 = 1;
    int v74 = v63 + v73;
    v62 = v72;
    v63 = v74;
  }
  bool v75 = true;
  int v76 = 16;
  int v77 = v76 + v53;
  bool v78 = true;
  int v79 = simt_wave_count_bits(v78);
  v51[v77] = v79;
  int v80 = 28;
  int v81 = v80 + v53;
  int v82 = v52[v81];
  int v83 = 1;
  int v84 = v53 + v83;
  int v85;
  v85 = v84;
  switch (v82) {
    case 0:
      {
      int v86 = 0;
      int v87 = 0;
      int v88;
      int v89;
      v88 = v86;
      v89 = v87;
      while (true) {
        int v90 = 4;
        int v91 = v89 * v90;
        int v92 = v91 + v53;
        int v93 = 32;
        int v94 = v93 + v92;
        int v95 = v52[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        v88 = v88;
        v89 = v89;
        if (!v97) break;
        int v98 = 52;
        int v99 = v98 + v53;
        int v100 = v52[v99];
        int v101 = 2;
        int v102;
        v102 = v101;
        switch (v100) {
          case 0:
            {
            int v103 = 0;
            int v104 = v53 + v103;
            v102 = v104;
          }
          default:
            {
            v102 = v53;
            break;
          }
        }
        bool v105 = true;
        int v106 = v88 + v102;
        int v107 = 1;
        int v108 = v89 + v107;
        v88 = v106;
        v89 = v108;
      }
      bool v109 = true;
      v85 = v88;
      break;
    }
    case 1:
      {
      int v110 = 56;
      int v111 = v110 + v53;
      int v112 = v52[v111];
      int v113 = 0;
      int v114;
      v114 = v113;
      switch (v112) {
        case 0:
          {
          int v115 = 2;
          v114 = v115;
          break;
        }
        default:
          {
          int v116 = 60;
          int v117 = v116 + v53;
          int v118 = v52[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            v121 = v53;
          } else {
            v121 = v53;
          }
          v114 = v121;
          break;
        }
        case 1:
          {
          int v122 = 64;
          int v123 = v122 + v53;
          int v124 = v52[v123];
          int v125 = 1;
          int v126 = v53 + v125;
          int v127;
          v127 = v126;
          switch (v124) {
            default:
              {
              int v128 = 1;
              int v129 = v53 + v128;
              v127 = v129;
              break;
            }
            case 0:
              {
              int v130 = 0;
              v127 = v130;
              break;
            }
            case 1:
              {
              int v131 = 1;
              int v132 = v53 + v131;
              v127 = v132;
              break;
            }
          }
          bool v133 = true;
          v114 = v127;
          break;
        }
        case 2:
          {
          int v134 = 0;
          int v135 = v53 + v134;
          v114 = v135;
          break;
        }
      }
      bool v136 = true;
      v85 = v114;
      break;
    }
    default:
      {
      int v137 = 68;
      int v138 = v137 + v53;
      int v139 = v52[v138];
      int v140;
      v140 = v53;
      switch (v139) {
        case 0:
          {
          int v141 = 72;
          int v142 = v141 + v53;
          int v143 = v52[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            int v147 = 2;
            v146 = v147;
          } else {
            int v148 = 0;
            v146 = v148;
          }
          v140 = v146;
        }
        case 1:
          {
          int v149 = 0;
          int v150 = 0;
          int v151;
          int v152;
          v151 = v149;
          v152 = v150;
          while (true) {
            int v153 = 4;
            int v154 = v152 * v153;
            int v155 = v154 + v53;
            int v156 = 76;
            int v157 = v156 + v155;
            int v158 = v52[v157];
            int v159 = 0;
            bool v160 = v158 != v159;
            v151 = v151;
            v152 = v152;
            if (!v160) break;
            int v161 = v151 + v152;
            int v162 = 1;
            int v163 = v152 + v162;
            v151 = v161;
            v152 = v163;
          }
          bool v164 = true;
          v140 = v151;
          break;
        }
        case 2:
          {
          int v165 = 96;
          int v166 = v165 + v53;
          int v167 = v52[v166];
          int v168 = 3;
          int v169 = v53 + v168;
          int v170;
          v170 = v169;
          switch (v167) {
            case 0:
              {
              int v171 = 1;
              int v172 = v53 + v171;
              v170 = v172;
            }
            case 1:
              {
              int v173 = 4;
              v170 = v173;
            }
            case 2:
              {
              int v174 = 3;
              v170 = v174;
              break;
            }
            default:
              {
              v170 = v53;
              break;
            }
          }
          bool v175 = true;
          v140 = v170;
        }
        default:
          {
          int v176 = 100;
          int v177 = v176 + v53;
          int v178 = v52[v177];
          int v179 = 2;
          int v180 = v53 + v179;
          int v181;
          v181 = v180;
          switch (v178) {
            default:
              {
              v181 = v53;
            }
            case 0:
              {
              int v182 = 0;
              v181 = v182;
              break;
            }
          }
          bool v183 = true;
          v140 = v181;
          break;
        }
      }
      bool v184 = true;
      v85 = v140;
      break;
    }
  }
  bool v185 = true;
  int v186 = 32;
  int v187 = v186 + v53;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v51[v187] = v189;
  int v190 = 0;
  int v191 = 0;
  int v192;
  int v193;
  v192 = v190;
  v193 = v191;
  while (true) {
    int v194 = 4;
    int v195 = v193 * v194;
    int v196 = v195 + v53;
    int v197 = 104;
    int v198 = v197 + v196;
    int v199 = v52[v198];
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
  int v206 = 48;
  int v207 = v206 + v53;
  bool v208 = true;
  int v209 = simt_wave_count_bits(v208);
  v51[v207] = v209;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 124; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
