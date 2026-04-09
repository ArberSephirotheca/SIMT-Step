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
  int v6 = 2;
  int v7 = v3 % v6;
  uint v8 = simt_subgroup_id(__simt_tid);
  int v9 = (int)(v8);
  int v10;
  v10 = v9;
  switch (v7) {
    case 0:
      {
      int v11;
      v11 = v0;
      switch (v3) {
        case 0:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 4;
            int v22 = 1;
            int v23 = v15 + v22;
            v14 = v21;
            v15 = v23;
            break;
            ;
          }
          int v24 = 2;
          int v25 = v0 + v24;
          v11 = v14;
          break;
        }
        default:
          {
          v11 = v0;
          break;
        }
      }
      int v26 = 3;
      v10 = v11;
    }
    default:
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
          int v39 = 4;
          int v40 = v0 + v39;
          int v41 = 1;
          int v42 = v33 + v41;
          v32 = v40;
          v33 = v42;
          continue;
          ;
        }
        int v43 = 0;
        int v44 = v0 + v43;
        v29 = v32;
      } else {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 3;
          int v49 = v0 + v48;
          v47 = v49;
        } else {
          int v50 = 4;
          v47 = v50;
        }
        int v51 = 4;
        int v52 = v0 + v51;
        v29 = v47;
      }
      v10 = v29;
      break;
    }
  }
  bool v53 = true;
  int v54 = simt_wave_count_bits(v53);
  int v55 = 0;
  int v56 = v55 + v0;
  v1[v56] = v54;
  int v57 = 0;
  bool v58 = v2 != v57;
  int v59 = v58 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v60 [[buffer(0)]], device int* v61 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v62 = static_cast<int>(__simt_tid3.x);
  int v63 = 0;
  int v64 = v63 + v62;
  int v65 = v61[v64];
  int v66 = 4;
  int v67 = v66 + v62;
  int v68 = v61[v67];
  helper0(v62, v60, v65, v68, static_cast<int>(__simt_tid3.x));
  int v69 = 8;
  int v70 = v69 + v62;
  int v71 = v61[v70];
  int v72 = 1;
  int v73 = v62 + v72;
  int v74;
  v74 = v73;
  switch (v71) {
    default:
      {
      v74 = v62;
      break;
    }
    case 0:
      {
      int v75 = 12;
      int v76 = v75 + v62;
      int v77 = v61[v76];
      int v78;
      v78 = v62;
      switch (v77) {
        case 0:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v82 * v83;
            int v85 = v84 + v62;
            int v86 = 16;
            int v87 = v86 + v85;
            int v88 = v61[v87];
            int v89 = 0;
            bool v90 = v88 != v89;
            v81 = v81;
            v82 = v82;
            if (!v90) break;
            int v91 = v81 + v82;
            int v92 = 1;
            int v93 = v82 + v92;
            v81 = v91;
            v82 = v93;
            break;
            ;
          }
          bool v94 = true;
          v78 = v81;
          break;
        }
        case 1:
          {
          v78 = v62;
          break;
        }
        default:
          {
          int v95 = 36;
          int v96 = v95 + v62;
          int v97 = v61[v96];
          int v98 = 2;
          int v99 = v62 + v98;
          int v100;
          v100 = v99;
          switch (v97) {
            case 0:
              {
              int v101 = 4;
              v100 = v101;
              break;
            }
            default:
              {
              int v102 = 4;
              v100 = v102;
              break;
            }
          }
          bool v103 = true;
          v78 = v100;
          break;
        }
      }
      bool v104 = true;
      v74 = v78;
      break;
    }
    case 1:
      {
      int v105 = 40;
      int v106 = v105 + v62;
      int v107 = v61[v106];
      int v108 = 0;
      bool v109 = v107 != v108;
      int v110;
      if (v109) {
        int v111 = 44;
        int v112 = v111 + v62;
        int v113 = v61[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          v116 = v62;
        } else {
          int v117 = 3;
          int v118 = v62 + v117;
          v116 = v118;
        }
        v110 = v116;
      } else {
        int v119 = 48;
        int v120 = v119 + v62;
        int v121 = v61[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v62;
        } else {
          int v125 = 3;
          int v126 = v62 + v125;
          v124 = v126;
        }
        v110 = v124;
      }
      v74 = v110;
    }
    case 2:
      {
      int v127 = 52;
      int v128 = v127 + v62;
      int v129 = v61[v128];
      int v130 = 4;
      int v131;
      v131 = v130;
      switch (v129) {
        default:
          {
          int v132 = 56;
          int v133 = v132 + v62;
          int v134 = v61[v133];
          int v135;
          v135 = v62;
          switch (v134) {
            case 0:
              {
              int v136 = 4;
              int v137 = v62 + v136;
              v135 = v137;
              break;
            }
            default:
              {
              int v138 = 1;
              v135 = v138;
              break;
            }
          }
          bool v139 = true;
          v131 = v135;
          break;
        }
        case 0:
          {
          int v140 = 60;
          int v141 = v140 + v62;
          int v142 = v61[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          int v145;
          if (v144) {
            v145 = v62;
          } else {
            v145 = v62;
          }
          v131 = v145;
          break;
        }
      }
      bool v146 = true;
      v74 = v131;
      break;
    }
  }
  bool v147 = true;
  int v148 = 16;
  int v149 = v148 + v62;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v60[v149] = v151;
  int v152 = 0;
  int v153 = 0;
  int v154;
  int v155;
  v154 = v152;
  v155 = v153;
  while (true) {
    int v156 = 4;
    int v157 = v155 * v156;
    int v158 = v157 + v62;
    int v159 = 64;
    int v160 = v159 + v158;
    int v161 = v61[v160];
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
    continue;
    ;
  }
  bool v167 = true;
  int v168 = 32;
  int v169 = v168 + v62;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v60[v169] = v171;
  int v172 = 0;
  int v173 = 0;
  int v174;
  int v175;
  v174 = v172;
  v175 = v173;
  while (true) {
    int v176 = 4;
    int v177 = v175 * v176;
    int v178 = v177 + v62;
    int v179 = 84;
    int v180 = v179 + v178;
    int v181 = v61[v180];
    int v182 = 0;
    bool v183 = v181 != v182;
    v174 = v174;
    v175 = v175;
    if (!v183) break;
    int v184 = v174 + v175;
    int v185 = 1;
    int v186 = v175 + v185;
    v174 = v184;
    v175 = v186;
  }
  bool v187 = true;
  int v188 = 48;
  int v189 = v188 + v62;
  bool v190 = true;
  int v191 = simt_wave_count_bits(v190);
  v60[v189] = v191;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
