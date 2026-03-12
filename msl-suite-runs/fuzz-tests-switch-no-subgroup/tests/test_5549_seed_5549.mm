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
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12;
        v12 = v0;
        switch (v11) {
          default:
            {
            v12 = v0;
            break;
          }
          case 0:
            {
            v12 = v0;
          }
          case 1:
            {
            int v13 = 3;
            int v14 = v0 + v13;
            v12 = v14;
            break;
          }
          case 2:
            {
            int v15 = 2;
            v12 = v15;
            break;
          }
        }
        v9 = v12;
      } else {
        int v16 = 0;
        bool v17 = v2 != v16;
        int v18;
        if (v17) {
          int v19 = 4;
          v18 = v19;
        } else {
          int v20 = 2;
          int v21 = v0 + v20;
          v18 = v21;
        }
        v9 = v18;
      }
      v6 = v9;
      break;
    }
    default:
      {
      int v22 = 4;
      v6 = v22;
      break;
    }
  }
  bool v23 = true;
  int v24 = simt_wave_count_bits(v23);
  int v25 = 0;
  int v26 = v25 + v0;
  v1[v26] = v24;
  return;
}

kernel void kernel_main(device int* v27 [[buffer(0)]], device int* v28 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v29 = static_cast<int>(__simt_tid3.x);
  int v30 = 0;
  int v31 = v30 + v29;
  int v32 = v28[v31];
  int v33 = 4;
  int v34 = v33 + v29;
  int v35 = v28[v34];
  helper0(v29, v27, v32, v35, static_cast<int>(__simt_tid3.x));
  int v36 = 8;
  int v37 = v36 + v29;
  int v38 = v28[v37];
  int v39 = 0;
  bool v40 = v38 != v39;
  int v41;
  if (v40) {
    int v42 = 12;
    int v43 = v42 + v29;
    int v44 = v28[v43];
    int v45 = 0;
    bool v46 = v44 != v45;
    int v47;
    if (v46) {
      uint v48 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v49 = (int)(v48);
      v47 = v49;
    } else {
      uint v50 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v51 = (int)(v50);
      v47 = v51;
    }
    int v52 = 16;
    int v53 = v52 + v29;
    bool v54 = true;
    int v55 = simt_wave_count_bits(v54);
    v27[v53] = v55;
    v41 = v47;
  } else {
    int v56 = 16;
    int v57 = v56 + v29;
    int v58 = v28[v57];
    uint v59 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v60 = (int)(v59);
    int v61;
    v61 = v60;
    switch (v58) {
      default:
        {
        int v62 = 2;
        v61 = v62;
        break;
      }
      case 0:
        {
        int v63 = 20;
        int v64 = v63 + v29;
        int v65 = v28[v64];
        int v66 = 0;
        bool v67 = v65 != v66;
        int v68;
        if (v67) {
          int v69 = 1;
          int v70 = v29 + v69;
          v68 = v70;
        } else {
          v68 = v29;
        }
        v61 = v68;
        break;
      }
      case 1:
        {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v74 * v75;
          int v77 = v76 + v29;
          int v78 = 24;
          int v79 = v78 + v77;
          int v80 = v28[v79];
          int v81 = 0;
          bool v82 = v80 != v81;
          v73 = v73;
          v74 = v74;
          if (!v82) break;
          int v83 = v73 + v74;
          int v84 = 1;
          int v85 = v74 + v84;
          bool v86 = true;
          v73 = v83;
          v74 = v85;
        }
        v61 = v73;
        break;
      }
    }
    v41 = v61;
  }
  int v87 = 32;
  int v88 = v87 + v29;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v27[v88] = v90;
  int v91 = 0;
  int v92 = 0;
  int v93;
  int v94;
  v93 = v91;
  v94 = v92;
  while (true) {
    int v95 = 4;
    int v96 = v94 * v95;
    int v97 = v96 + v29;
    int v98 = 44;
    int v99 = v98 + v97;
    int v100 = v28[v99];
    int v101 = 0;
    bool v102 = v100 != v101;
    v93 = v93;
    v94 = v94;
    if (!v102) break;
    int v103 = v93 + v94;
    int v104 = 1;
    int v105 = v94 + v104;
    bool v106 = true;
    int v107 = 48;
    int v108 = 4;
    int v109 = v94 * v108;
    int v110 = v107 + v109;
    int v111 = v110 + v29;
    bool v112 = true;
    int v113 = simt_wave_count_bits(v112);
    v27[v111] = v113;
    v93 = v103;
    v94 = v105;
    break;
    ;
  }
  int v114 = 64;
  int v115 = v114 + v29;
  int v116 = v28[v115];
  int v117 = 0;
  bool v118 = v116 != v117;
  int v119;
  if (v118) {
    int v120 = 68;
    int v121 = v120 + v29;
    int v122 = v28[v121];
    uint v123 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v124 = (int)(v123);
    int v125;
    v125 = v124;
    switch (v122) {
      case 0:
        {
        int v126 = 4;
        int v127 = v29 + v126;
        v125 = v127;
        break;
      }
      case 1:
        {
        int v128 = 72;
        int v129 = v128 + v29;
        int v130 = v28[v129];
        int v131 = 0;
        bool v132 = v130 != v131;
        int v133;
        if (v132) {
          int v134 = 3;
          int v135 = v29 + v134;
          v133 = v135;
        } else {
          v133 = v29;
        }
        v125 = v133;
        break;
      }
      case 2:
        {
        int v136 = 76;
        int v137 = v136 + v29;
        int v138 = v28[v137];
        int v139 = 3;
        int v140 = v29 + v139;
        int v141;
        v141 = v140;
        switch (v138) {
          case 0:
            {
            v141 = v29;
            break;
          }
          case 1:
            {
            v141 = v29;
            break;
          }
          default:
            {
            int v142 = 4;
            int v143 = v29 + v142;
            v141 = v143;
            break;
          }
        }
        v125 = v141;
        break;
      }
      default:
        {
        int v144 = 0;
        int v145 = v29 + v144;
        v125 = v145;
        break;
      }
    }
    v119 = v125;
  } else {
    int v146 = 0;
    int v147 = 0;
    int v148;
    int v149;
    v148 = v146;
    v149 = v147;
    while (true) {
      int v150 = 4;
      int v151 = v149 * v150;
      int v152 = v151 + v29;
      int v153 = 80;
      int v154 = v153 + v152;
      int v155 = v28[v154];
      int v156 = 0;
      bool v157 = v155 != v156;
      v148 = v148;
      v149 = v149;
      if (!v157) break;
      int v158 = 100;
      int v159 = v158 + v29;
      int v160 = v28[v159];
      int v161;
      v161 = v29;
      switch (v160) {
        case 0:
          {
          int v162 = 2;
          int v163 = v29 + v162;
          v161 = v163;
          break;
        }
        case 1:
          {
          int v164 = 2;
          int v165 = v29 + v164;
          v161 = v165;
          break;
        }
        case 2:
          {
          v161 = v29;
        }
        default:
          {
          int v166 = 0;
          v161 = v166;
          break;
        }
      }
      int v167 = v148 + v161;
      int v168 = 1;
      int v169 = v149 + v168;
      bool v170 = true;
      int v171 = 64;
      int v172 = 4;
      int v173 = v149 * v172;
      int v174 = v171 + v173;
      int v175 = v174 + v29;
      bool v176 = true;
      int v177 = simt_wave_count_bits(v176);
      v27[v175] = v177;
      v148 = v167;
      v149 = v169;
    }
    v119 = v148;
  }
  int v178 = 80;
  int v179 = v178 + v29;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v27[v179] = v181;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
