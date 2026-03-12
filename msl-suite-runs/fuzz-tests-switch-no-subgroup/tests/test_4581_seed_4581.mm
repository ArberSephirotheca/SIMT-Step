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
    bool v7 = true;
    int v8 = simt_wave_count_bits(v7);
    int v9 = 0;
    int v10 = v9 + v0;
    v1[v10] = v8;
    v6 = v8;
  } else {
    int v11 = 0;
    int v12 = 0;
    int v13;
    int v14;
    v13 = v11;
    v14 = v12;
    while (true) {
      int v15 = 4;
      int v16 = v3 % v15;
      int v17 = 1;
      int v18 = v16 + v17;
      bool v19 = v14 < v18;
      v13 = v13;
      v14 = v14;
      if (!v19) break;
      bool v20 = true;
      int v21 = simt_wave_count_bits(v20);
      int v22 = 16;
      int v23 = 4;
      int v24 = v14 * v23;
      int v25 = v22 + v24;
      int v26 = v25 + v0;
      v1[v26] = v21;
      int v27 = 1;
      int v28 = v14 + v27;
      v13 = v21;
      v14 = v28;
    }
    v6 = v13;
  }
  int v29 = 1;
  int v30 = v0 + v29;
  int v31;
  v31 = v30;
  switch (v3) {
    case 0:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          int v38 = 4;
          v37 = v38;
        } else {
          int v39 = 0;
          v37 = v39;
        }
        v34 = v37;
      } else {
        int v40 = 2;
        int v41 = v0 + v40;
        v34 = v41;
      }
      v31 = v34;
    }
    default:
      {
      int v42 = 0;
      int v43 = 0;
      int v44;
      int v45;
      v44 = v42;
      v45 = v43;
      while (true) {
        int v46 = 4;
        int v47 = v3 % v46;
        int v48 = 1;
        int v49 = v47 + v48;
        bool v50 = v45 < v49;
        v44 = v44;
        v45 = v45;
        if (!v50) break;
        int v51 = 1;
        int v52 = 1;
        int v53 = v45 + v52;
        v44 = v51;
        v45 = v53;
        break;
        ;
      }
      v31 = v44;
      break;
    }
  }
  int v54 = 0;
  bool v55 = v2 != v54;
  int v56 = v55 ? v6 : v31;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  int v66 = 0;
  bool v67 = v62 != v66;
  if (v67) {
    int v68 = 8;
    int v69 = v68 + v59;
    int v70 = v58[v69];
    int v71 = 0;
    bool v72 = v70 != v71;
    if (v72) {
      helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v73 = 12;
  int v74 = v73 + v59;
  int v75 = v58[v74];
  int v76 = 1;
  int v77;
  v77 = v76;
  switch (v75) {
    case 0:
      {
      v77 = v59;
      break;
    }
    default:
      {
      int v78 = 16;
      int v79 = v78 + v59;
      int v80 = v58[v79];
      int v81 = 4;
      int v82;
      v82 = v81;
      switch (v80) {
        case 0:
          {
          int v83 = 2;
          int v84 = v59 + v83;
          v82 = v84;
        }
        case 1:
          {
          int v85 = 0;
          int v86 = v59 + v85;
          v82 = v86;
        }
        default:
          {
          int v87 = 0;
          v82 = v87;
          break;
        }
      }
      v77 = v82;
      break;
    }
    case 1:
      {
      int v88 = 20;
      int v89 = v88 + v59;
      int v90 = v58[v89];
      int v91 = 0;
      bool v92 = v90 != v91;
      int v93;
      if (v92) {
        v93 = v59;
      } else {
        int v94 = 24;
        int v95 = v94 + v59;
        int v96 = v58[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        int v99;
        if (v98) {
          int v100 = 2;
          int v101 = v59 + v100;
          v99 = v101;
        } else {
          int v102 = 4;
          v99 = v102;
        }
        v93 = v99;
      }
      v77 = v93;
      break;
    }
  }
  int v103 = 28;
  int v104 = v103 + v59;
  int v105 = v58[v104];
  int v106 = 0;
  bool v107 = v105 != v106;
  int v108;
  if (v107) {
    int v109 = 32;
    int v110 = v109 + v59;
    int v111 = v58[v110];
    uint v112 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v113 = (int)(v112);
    int v114;
    v114 = v113;
    switch (v111) {
      case 0:
        {
        int v115 = 36;
        int v116 = v115 + v59;
        int v117 = v58[v116];
        int v118 = 2;
        int v119;
        v119 = v118;
        switch (v117) {
          default:
            {
            int v120 = 4;
            v119 = v120;
          }
          case 0:
            {
            int v121 = 1;
            int v122 = v59 + v121;
            v119 = v122;
          }
          case 1:
            {
            int v123 = 2;
            int v124 = v59 + v123;
            v119 = v124;
            break;
          }
        }
        bool v125 = true;
        v114 = v119;
        break;
      }
      default:
        {
        int v126 = 40;
        int v127 = v126 + v59;
        int v128 = v58[v127];
        int v129 = 0;
        int v130 = v59 + v129;
        int v131;
        v131 = v130;
        switch (v128) {
          case 0:
            {
            int v132 = 1;
            int v133 = v59 + v132;
            v131 = v133;
          }
          case 1:
            {
            int v134 = 3;
            v131 = v134;
          }
          case 2:
            {
            v131 = v59;
          }
          default:
            {
            v131 = v59;
            break;
          }
        }
        v114 = v131;
        break;
      }
    }
    v108 = v114;
  } else {
    int v135 = 0;
    int v136 = 0;
    int v137;
    int v138;
    v137 = v135;
    v138 = v136;
    while (true) {
      int v139 = 4;
      int v140 = v138 * v139;
      int v141 = v140 + v59;
      int v142 = 44;
      int v143 = v142 + v141;
      int v144 = v58[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      v137 = v137;
      v138 = v138;
      if (!v146) break;
      int v147 = 64;
      int v148 = v147 + v59;
      int v149 = v58[v148];
      uint v150 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v151 = (int)(v150);
      int v152;
      v152 = v151;
      switch (v149) {
        case 0:
          {
          int v153 = 0;
          v152 = v153;
          break;
        }
        case 1:
          {
          int v154 = 4;
          int v155 = v59 + v154;
          v152 = v155;
        }
        case 2:
          {
          int v156 = 2;
          v152 = v156;
        }
        default:
          {
          v152 = v59;
          break;
        }
      }
      int v157 = v137 + v152;
      int v158 = 1;
      int v159 = v138 + v158;
      bool v160 = true;
      int v161 = 32;
      int v162 = 4;
      int v163 = v138 * v162;
      int v164 = v161 + v163;
      int v165 = v164 + v59;
      bool v166 = true;
      int v167 = simt_wave_count_bits(v166);
      v57[v165] = v167;
      v137 = v157;
      v138 = v159;
    }
    v108 = v137;
  }
  int v168 = 48;
  int v169 = v168 + v59;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v57[v169] = v171;
  int v172 = 0;
  int v173 = 0;
  int v174;
  int v175;
  v174 = v172;
  v175 = v173;
  while (true) {
    int v176 = 4;
    int v177 = v175 * v176;
    int v178 = v177 + v59;
    int v179 = 68;
    int v180 = v179 + v178;
    int v181 = v58[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    v174 = v174;
    v175 = v175;
    if (!v183) break;
    uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v185 = (int)(v184);
    int v186 = v174 + v185;
    int v187 = 1;
    int v188 = v175 + v187;
    bool v189 = true;
    int v190 = 64;
    int v191 = 4;
    int v192 = v175 * v191;
    int v193 = v190 + v192;
    int v194 = v193 + v59;
    bool v195 = true;
    int v196 = simt_wave_count_bits(v195);
    v57[v194] = v196;
    v174 = v186;
    v175 = v188;
    continue;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
