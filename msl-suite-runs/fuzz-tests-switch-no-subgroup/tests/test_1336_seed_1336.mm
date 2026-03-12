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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 3;
  int v23 = v3 % v22;
  int v24;
  v24 = v0;
  switch (v23) {
    case 0:
      {
      int v25 = 3;
      int v26 = v3 % v25;
      int v27 = 2;
      int v28 = v0 + v27;
      int v29;
      v29 = v28;
      switch (v26) {
        case 0:
          {
          int v30 = 4;
          v29 = v30;
          break;
        }
        case 1:
          {
          int v31 = 0;
          bool v32 = v2 != v31;
          int v33;
          if (v32) {
            int v34 = 3;
            v33 = v34;
          } else {
            int v35 = 0;
            v33 = v35;
          }
          v29 = v33;
          break;
        }
        case 2:
          {
          int v36 = 3;
          int v37 = v3 % v36;
          int v38;
          v38 = v0;
          switch (v37) {
            default:
              {
              int v39 = 0;
              int v40 = v0 + v39;
              v38 = v40;
              break;
            }
            case 0:
              {
              v38 = v0;
            }
            case 1:
              {
              int v41 = 0;
              int v42 = v0 + v41;
              v38 = v42;
              break;
            }
          }
          int v43 = 4;
          v29 = v38;
          break;
        }
        default:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 1;
            int v54 = v47 + v53;
            v46 = v0;
            v47 = v54;
          }
          v29 = v46;
          break;
        }
      }
      int v55 = 2;
      v24 = v29;
    }
    case 1:
      {
      int v56 = 0;
      int v57 = 0;
      int v58;
      int v59;
      v58 = v56;
      v59 = v57;
      while (true) {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62 = 1;
        int v63 = v61 + v62;
        bool v64 = v59 < v63;
        v58 = v58;
        v59 = v59;
        if (!v64) break;
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          int v68 = 2;
          int v69 = v0 + v68;
          v67 = v69;
        } else {
          int v70 = 1;
          v67 = v70;
        }
        int v71 = 1;
        int v72 = v59 + v71;
        v58 = v67;
        v59 = v72;
      }
      v24 = v58;
    }
    case 2:
      {
      int v73 = 0;
      int v74 = 0;
      int v75;
      int v76;
      v75 = v73;
      v76 = v74;
      while (true) {
        int v77 = 4;
        int v78 = v3 % v77;
        int v79 = 1;
        int v80 = v78 + v79;
        bool v81 = v76 < v80;
        v75 = v75;
        v76 = v76;
        if (!v81) break;
        int v82 = 0;
        bool v83 = v2 != v82;
        int v84;
        if (v83) {
          int v85 = 3;
          int v86 = v0 + v85;
          v84 = v86;
        } else {
          int v87 = 2;
          v84 = v87;
        }
        int v88 = 1;
        int v89 = v76 + v88;
        v75 = v84;
        v76 = v89;
      }
      v24 = v75;
      break;
    }
    default:
      {
      int v90 = 3;
      int v91 = v3 % v90;
      int v92 = 0;
      int v93;
      v93 = v92;
      switch (v91) {
        default:
          {
          int v94 = 3;
          int v95 = v3 % v94;
          int v96 = 1;
          int v97;
          v97 = v96;
          switch (v95) {
            default:
              {
              int v98 = 3;
              int v99 = v0 + v98;
              v97 = v99;
            }
            case 0:
              {
              int v100 = 1;
              int v101 = v0 + v100;
              v97 = v101;
            }
            case 1:
              {
              int v102 = 3;
              int v103 = v0 + v102;
              v97 = v103;
              break;
            }
            case 2:
              {
              v97 = v0;
              break;
            }
          }
          int v104 = 4;
          int v105 = v0 + v104;
          v93 = v97;
        }
        case 0:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v3 % v110;
            int v112 = 1;
            int v113 = v111 + v112;
            bool v114 = v109 < v113;
            v108 = v108;
            v109 = v109;
            if (!v114) break;
            int v115 = 4;
            int v116 = 1;
            int v117 = v109 + v116;
            v108 = v115;
            v109 = v117;
          }
          v93 = v108;
        }
        case 1:
          {
          int v118 = 3;
          int v119 = v0 + v118;
          v93 = v119;
        }
        case 2:
          {
          int v120 = 0;
          bool v121 = v2 != v120;
          int v122;
          if (v121) {
            int v123 = 1;
            int v124 = v0 + v123;
            v122 = v124;
          } else {
            v122 = v0;
          }
          v93 = v122;
          break;
        }
      }
      v24 = v93;
      break;
    }
  }
  bool v125 = true;
  int v126 = simt_wave_count_bits(v125);
  int v127 = 16;
  int v128 = v127 + v0;
  v1[v128] = v126;
  int v129 = 0;
  bool v130 = v2 != v129;
  int v131 = v130 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v132 [[buffer(0)]], device int* v133 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v134 = static_cast<int>(__simt_tid3.x);
  int v135 = 0;
  int v136 = v135 + v134;
  int v137 = v133[v136];
  int v138 = 4;
  int v139 = v138 + v134;
  int v140 = v133[v139];
  int v141 = 0;
  bool v142 = v137 != v141;
  if (v142) {
  } else {
    int v143 = 8;
    int v144 = v143 + v134;
    int v145 = v133[v144];
    int v146 = 0;
    bool v147 = v145 != v146;
    if (v147) {
    } else {
      helper0(v134, v132, v137, v140, static_cast<int>(__simt_tid3.x));
    }
  }
  uint v148 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v149 = (int)(v148);
  int v150 = 12;
  int v151 = v150 + v134;
  int v152 = v133[v151];
  int v153 = 0;
  bool v154 = v152 != v153;
  int v155;
  if (v154) {
    int v156 = 16;
    int v157 = v156 + v134;
    int v158 = v133[v157];
    int v159 = 0;
    bool v160 = v158 != v159;
    int v161;
    if (v160) {
      int v162 = 20;
      int v163 = v162 + v134;
      int v164 = v133[v163];
      int v165 = 1;
      int v166 = v134 + v165;
      int v167;
      v167 = v166;
      switch (v164) {
        case 0:
          {
          v167 = v134;
          break;
        }
        default:
          {
          int v168 = 1;
          v167 = v168;
          break;
        }
        case 1:
          {
          int v169 = 0;
          int v170 = v134 + v169;
          v167 = v170;
          break;
        }
        case 2:
          {
          int v171 = 1;
          int v172 = v134 + v171;
          v167 = v172;
          break;
        }
      }
      bool v173 = true;
      int v174 = 32;
      int v175 = v174 + v134;
      bool v176 = true;
      int v177 = simt_wave_count_bits(v176);
      v132[v175] = v177;
      v161 = v167;
    } else {
      int v178 = 3;
      int v179 = v134 + v178;
      v161 = v179;
    }
    int v180 = 48;
    int v181 = v180 + v134;
    bool v182 = true;
    int v183 = simt_wave_count_bits(v182);
    v132[v181] = v183;
    v155 = v161;
  } else {
    v155 = v134;
  }
  int v184 = 64;
  int v185 = v184 + v134;
  bool v186 = true;
  int v187 = simt_wave_count_bits(v186);
  v132[v185] = v187;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
