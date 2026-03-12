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
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 3;
      int v11 = v3 % v10;
      uint v12 = simt_subgroup_id(__simt_tid);
      int v13 = (int)(v12);
      int v14;
      v14 = v13;
      switch (v11) {
        default:
          {
          int v15 = 1;
          int v16 = v0 + v15;
          v14 = v16;
          break;
        }
        case 0:
          {
          int v17 = 3;
          int v18 = v0 + v17;
          v14 = v18;
          break;
        }
        case 1:
          {
          v14 = v0;
          break;
        }
      }
      v9 = v14;
    } else {
      int v19 = 0;
      int v20 = 0;
      int v21;
      int v22;
      v21 = v19;
      v22 = v20;
      while (true) {
        int v23 = 4;
        int v24 = v3 % v23;
        int v25 = 1;
        int v26 = v24 + v25;
        bool v27 = v22 < v26;
        v21 = v21;
        v22 = v22;
        if (!v27) break;
        bool v28 = true;
        int v29 = simt_wave_count_bits(v28);
        int v30 = 0;
        int v31 = 4;
        int v32 = v22 * v31;
        int v33 = v30 + v32;
        int v34 = v33 + v0;
        v1[v34] = v29;
        int v35 = 1;
        int v36 = v22 + v35;
        v21 = v29;
        v22 = v36;
      }
      v9 = v21;
    }
    v6 = v9;
  } else {
    int v37 = 0;
    int v38 = 0;
    int v39;
    int v40;
    v39 = v37;
    v40 = v38;
    while (true) {
      int v41 = 4;
      int v42 = v3 % v41;
      int v43 = 1;
      int v44 = v42 + v43;
      bool v45 = v40 < v44;
      v39 = v39;
      v40 = v40;
      if (!v45) break;
      int v46 = 0;
      bool v47 = v2 != v46;
      int v48;
      if (v47) {
        bool v49 = true;
        int v50 = simt_wave_count_bits(v49);
        int v51 = 16;
        int v52 = 4;
        int v53 = v40 * v52;
        int v54 = v51 + v53;
        int v55 = v54 + v0;
        v1[v55] = v50;
        v48 = v50;
      } else {
        bool v56 = true;
        int v57 = simt_wave_count_bits(v56);
        int v58 = 32;
        int v59 = 4;
        int v60 = v40 * v59;
        int v61 = v58 + v60;
        int v62 = v61 + v0;
        v1[v62] = v57;
        v48 = v57;
      }
      int v63 = 1;
      int v64 = v40 + v63;
      v39 = v48;
      v40 = v64;
    }
    v6 = v39;
  }
  return;
}

kernel void kernel_main(device int* v65 [[buffer(0)]], device int* v66 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v67 = static_cast<int>(__simt_tid3.x);
  int v68 = 0;
  int v69 = v68 + v67;
  int v70 = v66[v69];
  int v71 = 4;
  int v72 = v71 + v67;
  int v73 = v66[v72];
  int v74 = 0;
  bool v75 = v70 != v74;
  if (v75) {
  } else {
    int v76 = 8;
    int v77 = v76 + v67;
    int v78 = v66[v77];
    int v79 = 0;
    bool v80 = v78 != v79;
    if (v80) {
      helper0(v67, v65, v70, v73, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v81 = 12;
  int v82 = v81 + v67;
  int v83 = v66[v82];
  uint v84 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v85 = (int)(v84);
  int v86;
  v86 = v85;
  switch (v83) {
    case 0:
      {
      v86 = v67;
      break;
    }
    case 1:
      {
      int v87 = 16;
      int v88 = v87 + v67;
      int v89 = v66[v88];
      int v90 = 3;
      int v91;
      v91 = v90;
      switch (v89) {
        case 0:
          {
          v91 = v67;
          break;
        }
        default:
          {
          v91 = v67;
          break;
        }
        case 1:
          {
          int v92 = 20;
          int v93 = v92 + v67;
          int v94 = v66[v93];
          int v95 = 2;
          int v96;
          v96 = v95;
          switch (v94) {
            case 0:
              {
              int v97 = 4;
              int v98 = v67 + v97;
              v96 = v98;
              break;
            }
            case 1:
              {
              v96 = v67;
              break;
            }
            case 2:
              {
              v96 = v67;
              break;
            }
            default:
              {
              int v99 = 1;
              int v100 = v67 + v99;
              v96 = v100;
              break;
            }
          }
          v91 = v96;
          break;
        }
      }
      v86 = v91;
      break;
    }
    default:
      {
      int v101 = 24;
      int v102 = v101 + v67;
      int v103 = v66[v102];
      int v104;
      v104 = v67;
      switch (v103) {
        case 0:
          {
          int v105 = 0;
          int v106 = 0;
          int v107;
          int v108;
          v107 = v105;
          v108 = v106;
          while (true) {
            int v109 = 4;
            int v110 = v108 * v109;
            int v111 = v110 + v67;
            int v112 = 28;
            int v113 = v112 + v111;
            int v114 = v66[v113];
            int v115 = 0;
            bool v116 = v114 != v115;
            v107 = v107;
            v108 = v108;
            if (!v116) break;
            int v117 = v107 + v108;
            int v118 = 1;
            int v119 = v108 + v118;
            bool v120 = true;
            v107 = v117;
            v108 = v119;
          }
          v104 = v107;
          break;
        }
        default:
          {
          int v121 = 48;
          int v122 = v121 + v67;
          int v123 = v66[v122];
          int v124 = 2;
          int v125 = v67 + v124;
          int v126;
          v126 = v125;
          switch (v123) {
            case 0:
              {
              v126 = v67;
            }
            default:
              {
              int v127 = 0;
              int v128 = v67 + v127;
              v126 = v128;
              break;
            }
            case 1:
              {
              v126 = v67;
              break;
            }
          }
          v104 = v126;
          break;
        }
      }
      bool v129 = true;
      v86 = v104;
      break;
    }
    case 2:
      {
      int v130 = 0;
      int v131 = 0;
      int v132;
      int v133;
      v132 = v130;
      v133 = v131;
      while (true) {
        int v134 = 4;
        int v135 = v133 * v134;
        int v136 = v135 + v67;
        int v137 = 52;
        int v138 = v137 + v136;
        int v139 = v66[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        v132 = v132;
        v133 = v133;
        if (!v141) break;
        int v142 = v132 + v133;
        int v143 = 1;
        int v144 = v133 + v143;
        bool v145 = true;
        v132 = v142;
        v133 = v144;
        break;
        ;
      }
      v86 = v132;
      break;
    }
  }
  bool v146 = true;
  int v147 = 48;
  int v148 = v147 + v67;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v65[v148] = v150;
  int v151 = 72;
  int v152 = v151 + v67;
  int v153 = v66[v152];
  int v154 = 0;
  bool v155 = v153 != v154;
  int v156;
  if (v155) {
    int v157 = 0;
    int v158 = 0;
    int v159;
    int v160;
    v159 = v157;
    v160 = v158;
    while (true) {
      int v161 = 4;
      int v162 = v160 * v161;
      int v163 = v162 + v67;
      int v164 = 76;
      int v165 = v164 + v163;
      int v166 = v66[v165];
      int v167 = 0;
      bool v168 = v166 != v167;
      v159 = v159;
      v160 = v160;
      if (!v168) break;
      int v169 = 1;
      int v170 = v67 + v169;
      int v171 = v159 + v170;
      int v172 = 1;
      int v173 = v160 + v172;
      bool v174 = true;
      int v175 = 64;
      int v176 = 4;
      int v177 = v160 * v176;
      int v178 = v175 + v177;
      int v179 = v178 + v67;
      bool v180 = true;
      int v181 = simt_wave_count_bits(v180);
      v65[v179] = v181;
      v159 = v171;
      v160 = v173;
    }
    v156 = v159;
  } else {
    uint v182 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v183 = (int)(v182);
    v156 = v183;
  }
  int v184 = 80;
  int v185 = v184 + v67;
  bool v186 = true;
  int v187 = simt_wave_count_bits(v186);
  v65[v185] = v187;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
