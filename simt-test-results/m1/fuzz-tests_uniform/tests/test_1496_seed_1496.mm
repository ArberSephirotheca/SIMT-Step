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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 1;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 2;
      int v9 = v0 + v8;
      int v10;
      v10 = v9;
      switch (v3) {
        case 0:
          {
          int v11;
          v11 = v0;
          switch (v3) {
            case 0:
              {
              v11 = v0;
              break;
            }
            default:
              {
              v11 = v0;
              break;
            }
          }
          int v12 = 1;
          v10 = v11;
          break;
        }
        default:
          {
          int v13 = 4;
          int v14 = v3 % v13;
          int v15 = 3;
          int v16;
          v16 = v15;
          switch (v14) {
            case 0:
              {
              v16 = v0;
            }
            case 1:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v16 = v18;
            }
            default:
              {
              v16 = v0;
              break;
            }
            case 2:
              {
              int v19 = 4;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
          }
          int v21 = 3;
          v10 = v16;
          break;
        }
      }
      int v22 = 2;
      v7 = v10;
      break;
    }
    case 0:
      {
      int v23 = 4;
      int v24 = v0 + v23;
      int v25;
      v25 = v24;
      switch (v3) {
        default:
          {
          v25 = v0;
          break;
        }
        case 0:
          {
          int v26 = 3;
          v25 = v26;
          break;
        }
      }
      int v27 = 0;
      int v28 = v0 + v27;
      v7 = v25;
      break;
    }
    case 1:
      {
      v7 = v0;
      break;
    }
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  return;
}

kernel void kernel_main(device int* v33 [[buffer(0)]], device int* v34 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v35 = static_cast<int>(__simt_tid3.x);
  int v36 = 0;
  int v37 = v36 + v35;
  int v38 = v34[v37];
  int v39 = 4;
  int v40 = v39 + v35;
  int v41 = v34[v40];
  helper0(v35, v33, v38, v41, static_cast<int>(__simt_tid3.x));
  int v42 = 8;
  int v43 = v42 + v35;
  int v44 = v34[v43];
  int v45;
  v45 = v35;
  switch (v44) {
    default:
      {
      int v46 = 12;
      int v47 = v46 + v35;
      int v48 = v34[v47];
      int v49 = 0;
      bool v50 = v48 != v49;
      int v51;
      if (v50) {
        int v52 = 0;
        int v53 = 0;
        int v54;
        int v55;
        v54 = v52;
        v55 = v53;
        while (true) {
          int v56 = 4;
          int v57 = v55 * v56;
          int v58 = v57 + v35;
          int v59 = 16;
          int v60 = v59 + v58;
          int v61 = v34[v60];
          int v62 = 0;
          bool v63 = v61 != v62;
          v54 = v54;
          v55 = v55;
          if (!v63) break;
          int v64 = v54 + v55;
          int v65 = 1;
          int v66 = v55 + v65;
          v54 = v64;
          v55 = v66;
        }
        bool v67 = true;
        v51 = v54;
      } else {
        int v68 = 0;
        int v69 = 0;
        int v70;
        int v71;
        v70 = v68;
        v71 = v69;
        while (true) {
          int v72 = 4;
          int v73 = v71 * v72;
          int v74 = v73 + v35;
          int v75 = 36;
          int v76 = v75 + v74;
          int v77 = v34[v76];
          int v78 = 0;
          bool v79 = v77 != v78;
          v70 = v70;
          v71 = v71;
          if (!v79) break;
          int v80 = v70 + v71;
          int v81 = 1;
          int v82 = v71 + v81;
          v70 = v80;
          v71 = v82;
          continue;
          ;
        }
        bool v83 = true;
        v51 = v70;
      }
      v45 = v51;
      break;
    }
    case 0:
      {
      int v84 = 0;
      int v85 = 0;
      int v86;
      int v87;
      v86 = v84;
      v87 = v85;
      while (true) {
        int v88 = 4;
        int v89 = v87 * v88;
        int v90 = v89 + v35;
        int v91 = 56;
        int v92 = v91 + v90;
        int v93 = v34[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        v86 = v86;
        v87 = v87;
        if (!v95) break;
        int v96 = 1;
        int v97 = v86 + v96;
        int v98 = 1;
        int v99 = v87 + v98;
        v86 = v97;
        v87 = v99;
      }
      bool v100 = true;
      v45 = v86;
      break;
    }
    case 1:
      {
      int v101 = 76;
      int v102 = v101 + v35;
      int v103 = v34[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        int v107 = 80;
        int v108 = v107 + v35;
        int v109 = v34[v108];
        int v110 = 4;
        int v111 = v35 + v110;
        int v112;
        v112 = v111;
        switch (v109) {
          case 0:
            {
            int v113 = 2;
            int v114 = v35 + v113;
            v112 = v114;
            break;
          }
          case 1:
            {
            int v115 = 0;
            v112 = v115;
            break;
          }
          case 2:
            {
            int v116 = 4;
            v112 = v116;
            break;
          }
          default:
            {
            v112 = v35;
            break;
          }
        }
        bool v117 = true;
        v106 = v112;
      } else {
        int v118 = 84;
        int v119 = v118 + v35;
        int v120 = v34[v119];
        int v121;
        v121 = v35;
        switch (v120) {
          default:
            {
            int v122 = 2;
            v121 = v122;
          }
          case 0:
            {
            int v123 = 2;
            v121 = v123;
          }
          case 1:
            {
            int v124 = 3;
            int v125 = v35 + v124;
            v121 = v125;
          }
          case 2:
            {
            int v126 = 3;
            v121 = v126;
            break;
          }
        }
        bool v127 = true;
        v106 = v121;
      }
      v45 = v106;
      break;
    }
    case 2:
      {
      int v128 = 1;
      v45 = v128;
      break;
    }
  }
  bool v129 = true;
  int v130 = 16;
  int v131 = v130 + v35;
  bool v132 = true;
  int v133 = simt_wave_count_bits(v132);
  v33[v131] = v133;
  int v134 = 88;
  int v135 = v134 + v35;
  int v136 = v34[v135];
  int v137 = 0;
  bool v138 = v136 != v137;
  int v139;
  if (v138) {
    int v140 = 0;
    int v141 = 0;
    int v142;
    int v143;
    v142 = v140;
    v143 = v141;
    while (true) {
      int v144 = 4;
      int v145 = v143 * v144;
      int v146 = v145 + v35;
      int v147 = 92;
      int v148 = v147 + v146;
      int v149 = v34[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      v142 = v142;
      v143 = v143;
      if (!v151) break;
      int v152 = v142 + v143;
      int v153 = 1;
      int v154 = v143 + v153;
      v142 = v152;
      v143 = v154;
    }
    bool v155 = true;
    v139 = v142;
  } else {
    uint v156 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v157 = (int)(v156);
    v139 = v157;
  }
  int v158 = 32;
  int v159 = v158 + v35;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v33[v159] = v161;
  int v162 = 0;
  int v163 = 0;
  int v164;
  int v165;
  v164 = v162;
  v165 = v163;
  while (true) {
    int v166 = 4;
    int v167 = v165 * v166;
    int v168 = v167 + v35;
    int v169 = 112;
    int v170 = v169 + v168;
    int v171 = v34[v170];
    int v172 = 0;
    bool v173 = v171 != v172;
    v164 = v164;
    v165 = v165;
    if (!v173) break;
    int v174 = v164 + v165;
    int v175 = 1;
    int v176 = v165 + v175;
    v164 = v174;
    v165 = v176;
  }
  bool v177 = true;
  int v178 = 48;
  int v179 = v178 + v35;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v33[v179] = v181;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 132; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
