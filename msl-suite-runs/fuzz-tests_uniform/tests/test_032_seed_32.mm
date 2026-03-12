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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9;
      v9 = v0;
      switch (v3) {
        case 0:
          {
          int v10 = 0;
          int v11 = 0;
          int v12;
          int v13;
          v12 = v10;
          v13 = v11;
          while (true) {
            int v14 = 4;
            int v15 = v3 % v14;
            int v16 = 1;
            int v17 = v15 + v16;
            bool v18 = v13 < v17;
            v12 = v12;
            v13 = v13;
            if (!v18) break;
            int v19 = 1;
            int v20 = v13 + v19;
            v12 = v0;
            v13 = v20;
          }
          v9 = v12;
          break;
        }
        default:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 3;
            v23 = v24;
          } else {
            v23 = v0;
          }
          int v25 = 0;
          int v26 = v0 + v25;
          v9 = v23;
          break;
        }
      }
      v8 = v9;
      break;
    }
    case 0:
      {
      int v27 = 0;
      bool v28 = v2 != v27;
      int v29;
      if (v28) {
        int v30 = 0;
        int v31 = 0;
        int v32;
        int v33;
        v32 = v30;
        v33 = v31;
        while (true) {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v35 + v36;
          bool v38 = v33 < v37;
          v32 = v32;
          v33 = v33;
          if (!v38) break;
          int v39 = 2;
          int v40 = v0 + v39;
          int v41 = 1;
          int v42 = v33 + v41;
          v32 = v40;
          v33 = v42;
        }
        int v43 = 1;
        v29 = v32;
      } else {
        int v44 = 2;
        int v45 = v3 % v44;
        int v46;
        v46 = v0;
        switch (v45) {
          case 0:
            {
            int v47 = 0;
            int v48 = v0 + v47;
            v46 = v48;
          }
          case 1:
            {
            int v49 = 2;
            int v50 = v0 + v49;
            v46 = v50;
            break;
          }
          default:
            {
            int v51 = 1;
            int v52 = v0 + v51;
            v46 = v52;
            break;
          }
        }
        int v53 = 3;
        v29 = v46;
      }
      int v54 = 1;
      v8 = v29;
      break;
    }
    case 1:
      {
      int v55 = 0;
      bool v56 = v2 != v55;
      int v57;
      if (v56) {
        int v58 = 2;
        int v59 = v3 % v58;
        int v60 = 2;
        int v61 = v0 + v60;
        int v62;
        v62 = v61;
        switch (v59) {
          default:
            {
            int v63 = 4;
            v62 = v63;
          }
          case 0:
            {
            int v64 = 4;
            v62 = v64;
            break;
          }
        }
        int v65 = 2;
        v57 = v62;
      } else {
        int v66 = 4;
        int v67 = v3 % v66;
        int v68 = 1;
        int v69;
        v69 = v68;
        switch (v67) {
          case 0:
            {
            int v70 = 4;
            int v71 = v0 + v70;
            v69 = v71;
          }
          default:
            {
            v69 = v0;
          }
          case 1:
            {
            v69 = v0;
            break;
          }
          case 2:
            {
            int v72 = 0;
            int v73 = v0 + v72;
            v69 = v73;
            break;
          }
        }
        v57 = v69;
      }
      int v74 = 4;
      int v75 = v0 + v74;
      v8 = v57;
      break;
    }
  }
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  int v78 = 0;
  int v79 = v78 + v0;
  v1[v79] = v77;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  int v92 = 0;
  bool v93 = v91 != v92;
  int v94;
  if (v93) {
    int v95 = 0;
    int v96 = 0;
    int v97;
    int v98;
    v97 = v95;
    v98 = v96;
    while (true) {
      int v99 = 4;
      int v100 = v98 * v99;
      int v101 = v100 + v82;
      int v102 = 12;
      int v103 = v102 + v101;
      int v104 = v81[v103];
      int v105 = 0;
      bool v106 = v104 != v105;
      v97 = v97;
      v98 = v98;
      if (!v106) break;
      int v107 = v97 + v98;
      int v108 = 1;
      int v109 = v98 + v108;
      v97 = v107;
      v98 = v109;
    }
    bool v110 = true;
    v94 = v97;
  } else {
    int v111 = 32;
    int v112 = v111 + v82;
    int v113 = v81[v112];
    int v114 = 0;
    bool v115 = v113 != v114;
    int v116;
    if (v115) {
      uint v117 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v118 = (int)(v117);
      v116 = v118;
    } else {
      int v119 = 2;
      v116 = v119;
    }
    v94 = v116;
  }
  int v120 = 16;
  int v121 = v120 + v82;
  bool v122 = true;
  int v123 = simt_wave_count_bits(v122);
  v80[v121] = v123;
  int v124 = 36;
  int v125 = v124 + v82;
  int v126 = v81[v125];
  int v127 = 4;
  int v128 = v82 + v127;
  int v129;
  v129 = v128;
  switch (v126) {
    case 0:
      {
      int v130 = 40;
      int v131 = v130 + v82;
      int v132 = v81[v131];
      int v133 = 1;
      int v134 = v82 + v133;
      int v135;
      v135 = v134;
      switch (v132) {
        case 0:
          {
          int v136 = 44;
          int v137 = v136 + v82;
          int v138 = v81[v137];
          int v139 = 2;
          int v140;
          v140 = v139;
          switch (v138) {
            case 0:
              {
              v140 = v82;
            }
            default:
              {
              int v141 = 0;
              int v142 = v82 + v141;
              v140 = v142;
            }
            case 1:
              {
              v140 = v82;
              break;
            }
          }
          bool v143 = true;
          v135 = v140;
          break;
        }
        case 1:
          {
          v135 = v82;
          break;
        }
        case 2:
          {
          int v144 = 48;
          int v145 = v144 + v82;
          int v146 = v81[v145];
          int v147 = 0;
          bool v148 = v146 != v147;
          int v149;
          if (v148) {
            int v150 = 1;
            int v151 = v82 + v150;
            v149 = v151;
          } else {
            v149 = v82;
          }
          v135 = v149;
          break;
        }
        default:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v82;
            int v159 = 52;
            int v160 = v159 + v158;
            int v161 = v81[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            v154 = v164;
            v155 = v166;
          }
          bool v167 = true;
          v135 = v154;
          break;
        }
      }
      bool v168 = true;
      v129 = v135;
      break;
    }
    default:
      {
      int v169 = 4;
      int v170 = v82 + v169;
      v129 = v170;
      break;
    }
    case 1:
      {
      int v171 = 72;
      int v172 = v171 + v82;
      int v173 = v81[v172];
      int v174;
      v174 = v82;
      switch (v173) {
        case 0:
          {
          int v175 = 76;
          int v176 = v175 + v82;
          int v177 = v81[v176];
          int v178 = 0;
          bool v179 = v177 != v178;
          int v180;
          if (v179) {
            int v181 = 4;
            v180 = v181;
          } else {
            int v182 = 3;
            v180 = v182;
          }
          v174 = v180;
          break;
        }
        case 1:
          {
          int v183 = 80;
          int v184 = v183 + v82;
          int v185 = v81[v184];
          int v186 = 0;
          bool v187 = v185 != v186;
          int v188;
          if (v187) {
            int v189 = 3;
            v188 = v189;
          } else {
            int v190 = 4;
            int v191 = v82 + v190;
            v188 = v191;
          }
          v174 = v188;
          break;
        }
        default:
          {
          v174 = v82;
          break;
        }
      }
      bool v192 = true;
      v129 = v174;
      break;
    }
  }
  bool v193 = true;
  int v194 = 32;
  int v195 = v194 + v82;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v80[v195] = v197;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
