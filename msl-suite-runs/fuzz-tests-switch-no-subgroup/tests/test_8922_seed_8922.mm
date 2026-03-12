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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
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
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 4;
          int v20 = v0 + v19;
          v18 = v20;
        } else {
          int v21 = 1;
          v18 = v21;
        }
        int v22 = 1;
        int v23 = v10 + v22;
        v9 = v18;
        v10 = v23;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        v26 = v0;
      } else {
        int v27 = 3;
        int v28 = v3 % v27;
        int v29 = 4;
        int v30 = v0 + v29;
        int v31;
        v31 = v30;
        switch (v28) {
          case 0:
            {
            int v32 = 2;
            v31 = v32;
            break;
          }
          default:
            {
            int v33 = 3;
            v31 = v33;
            break;
          }
          case 1:
            {
            v31 = v0;
            break;
          }
          case 2:
            {
            v31 = v0;
            break;
          }
        }
        int v34 = 0;
        int v35 = v0 + v34;
        v26 = v31;
      }
      v6 = v26;
    }
    case 1:
      {
      int v36 = 4;
      int v37 = v3 % v36;
      int v38;
      v38 = v0;
      switch (v37) {
        case 0:
          {
          int v39 = 0;
          bool v40 = v2 != v39;
          int v41;
          if (v40) {
            v41 = v0;
          } else {
            int v42 = 4;
            v41 = v42;
          }
          v38 = v41;
          break;
        }
        case 1:
          {
          int v43 = 0;
          bool v44 = v2 != v43;
          int v45;
          if (v44) {
            int v46 = 3;
            int v47 = v0 + v46;
            v45 = v47;
          } else {
            v45 = v0;
          }
          v38 = v45;
          break;
        }
        default:
          {
          int v48 = 1;
          int v49;
          v49 = v48;
          switch (v3) {
            default:
              {
              v49 = v0;
              break;
            }
            case 0:
              {
              v49 = v0;
              break;
            }
          }
          v38 = v49;
          break;
        }
        case 2:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 3;
            int v60 = v0 + v59;
            int v61 = 1;
            int v62 = v53 + v61;
            v52 = v60;
            v53 = v62;
          }
          v38 = v52;
          break;
        }
      }
      v6 = v38;
      break;
    }
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
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
  int v76 = 0;
  bool v77 = v72 != v76;
  if (v77) {
    int v78 = 8;
    int v79 = v78 + v69;
    int v80 = v68[v79];
    int v81 = 0;
    bool v82 = v80 != v81;
    if (v82) {
      helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v83 = 12;
  int v84 = v83 + v69;
  int v85 = v68[v84];
  int v86 = 0;
  bool v87 = v85 != v86;
  int v88;
  if (v87) {
    int v89 = 16;
    int v90 = v89 + v69;
    int v91 = v68[v90];
    int v92 = 0;
    bool v93 = v91 != v92;
    int v94;
    if (v93) {
      int v95 = 20;
      int v96 = v95 + v69;
      int v97 = v68[v96];
      uint v98 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v99 = (int)(v98);
      int v100;
      v100 = v99;
      switch (v97) {
        default:
          {
          int v101 = 2;
          v100 = v101;
          break;
        }
        case 0:
          {
          int v102 = 0;
          int v103 = v69 + v102;
          v100 = v103;
          break;
        }
      }
      v94 = v100;
    } else {
      int v104 = 1;
      int v105 = v69 + v104;
      v94 = v105;
    }
    int v106 = 16;
    int v107 = v106 + v69;
    bool v108 = true;
    int v109 = simt_wave_count_bits(v108);
    v67[v107] = v109;
    v88 = v94;
  } else {
    int v110 = 0;
    int v111 = 0;
    int v112;
    int v113;
    v112 = v110;
    v113 = v111;
    while (true) {
      int v114 = 4;
      int v115 = v113 * v114;
      int v116 = v115 + v69;
      int v117 = 24;
      int v118 = v117 + v116;
      int v119 = v68[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      v112 = v112;
      v113 = v113;
      if (!v121) break;
      int v122 = v112 + v69;
      int v123 = 1;
      int v124 = v113 + v123;
      bool v125 = true;
      int v126 = 32;
      int v127 = 4;
      int v128 = v113 * v127;
      int v129 = v126 + v128;
      int v130 = v129 + v69;
      bool v131 = true;
      int v132 = simt_wave_count_bits(v131);
      v67[v130] = v132;
      v112 = v122;
      v113 = v124;
    }
    v88 = v112;
  }
  int v133 = 48;
  int v134 = v133 + v69;
  bool v135 = true;
  int v136 = simt_wave_count_bits(v135);
  v67[v134] = v136;
  int v137 = 0;
  int v138 = 44;
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
      int v151 = 48;
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
      bool v159 = true;
      int v160 = 64;
      int v161 = 4;
      int v162 = v147 * v161;
      int v163 = v160 + v162;
      int v164 = v163 + v69;
      bool v165 = true;
      int v166 = simt_wave_count_bits(v165);
      v67[v164] = v166;
      v146 = v156;
      v147 = v158;
      continue;
      ;
    }
    v143 = v146;
  } else {
    int v167 = 68;
    int v168 = v167 + v69;
    int v169 = v68[v168];
    int v170 = 0;
    bool v171 = v169 != v170;
    int v172;
    if (v171) {
      int v173 = 72;
      int v174 = v173 + v69;
      int v175 = v68[v174];
      uint v176 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v177 = (int)(v176);
      int v178;
      v178 = v177;
      switch (v175) {
        default:
          {
          int v179 = 0;
          int v180 = v69 + v179;
          v178 = v180;
          break;
        }
        case 0:
          {
          v178 = v69;
          break;
        }
        case 1:
          {
          v178 = v69;
        }
        case 2:
          {
          v178 = v69;
          break;
        }
      }
      v172 = v178;
    } else {
      int v181 = 76;
      int v182 = v181 + v69;
      int v183 = v68[v182];
      int v184 = 0;
      bool v185 = v183 != v184;
      int v186;
      if (v185) {
        int v187 = 0;
        int v188 = v69 + v187;
        v186 = v188;
      } else {
        int v189 = 4;
        v186 = v189;
      }
      int v190 = 80;
      int v191 = v190 + v69;
      bool v192 = true;
      int v193 = simt_wave_count_bits(v192);
      v67[v191] = v193;
      v172 = v186;
    }
    int v194 = 96;
    int v195 = v194 + v69;
    bool v196 = true;
    int v197 = simt_wave_count_bits(v196);
    v67[v195] = v197;
    v143 = v172;
  }
  int v198 = 112;
  int v199 = v198 + v69;
  bool v200 = true;
  int v201 = simt_wave_count_bits(v200);
  v67[v199] = v201;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
