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
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 3;
    int v16 = 1;
    int v17 = v9 + v16;
    v8 = v15;
    v9 = v17;
  }
  bool v18 = true;
  int v19 = simt_wave_count_bits(v18);
  int v20 = 0;
  int v21 = v20 + v0;
  v1[v21] = v19;
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24 = v23 ? v5 : v8;
  int v25 = 3;
  int v26 = v3 % v25;
  int v27;
  v27 = v0;
  switch (v26) {
    case 0:
      {
      int v28 = 2;
      int v29 = v3 % v28;
      int v30;
      v30 = v0;
      switch (v29) {
        default:
          {
          int v31 = 3;
          int v32 = v3 % v31;
          int v33 = 2;
          int v34;
          v34 = v33;
          switch (v32) {
            case 0:
              {
              int v35 = 4;
              int v36 = v0 + v35;
              v34 = v36;
              break;
            }
            default:
              {
              v34 = v0;
              break;
            }
            case 1:
              {
              int v37 = 1;
              v34 = v37;
              break;
            }
          }
          int v38 = 3;
          v30 = v34;
          break;
        }
        case 0:
          {
          int v39 = 0;
          int v40 = v0 + v39;
          v30 = v40;
          break;
        }
      }
      int v41 = 3;
      v27 = v30;
      break;
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
        int v51 = 0;
        int v52 = 0;
        int v53;
        int v54;
        v53 = v51;
        v54 = v52;
        while (true) {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 1;
          int v58 = v56 + v57;
          bool v59 = v54 < v58;
          v53 = v53;
          v54 = v54;
          if (!v59) break;
          int v60 = 2;
          int v61 = v0 + v60;
          int v62 = 1;
          int v63 = v54 + v62;
          v53 = v61;
          v54 = v63;
        }
        int v64 = 3;
        int v65 = v0 + v64;
        int v66 = 1;
        int v67 = v45 + v66;
        v44 = v53;
        v45 = v67;
        break;
        ;
      }
      int v68 = 2;
      int v69 = v0 + v68;
      v27 = v44;
    }
    case 1:
      {
      int v70 = 2;
      int v71 = v3 % v70;
      int v72;
      v72 = v0;
      switch (v71) {
        default:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            int v76 = 2;
            v75 = v76;
          } else {
            int v77 = 0;
            int v78 = v0 + v77;
            v75 = v78;
          }
          int v79 = 2;
          int v80 = v0 + v79;
          v72 = v75;
          break;
        }
        case 0:
          {
          int v81 = 2;
          int v82 = v3 % v81;
          int v83 = 3;
          int v84 = v0 + v83;
          int v85;
          v85 = v84;
          switch (v82) {
            default:
              {
              int v86 = 3;
              v85 = v86;
              break;
            }
            case 0:
              {
              int v87 = 2;
              int v88 = v0 + v87;
              v85 = v88;
              break;
            }
          }
          int v89 = 4;
          int v90 = v0 + v89;
          v72 = v85;
          break;
        }
        case 1:
          {
          v72 = v0;
          break;
        }
      }
      int v91 = 2;
      int v92 = v0 + v91;
      v27 = v72;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 16;
  int v96 = v95 + v0;
  v1[v96] = v94;
  int v97 = 0;
  bool v98 = v2 != v97;
  int v99 = v98 ? v24 : v27;
  return;
}

kernel void kernel_main(device int* v100 [[buffer(0)]], device int* v101 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v102 = static_cast<int>(__simt_tid3.x);
  int v103 = 0;
  int v104 = v103 + v102;
  int v105 = v101[v104];
  int v106 = 4;
  int v107 = v106 + v102;
  int v108 = v101[v107];
  helper0(v102, v100, v105, v108, static_cast<int>(__simt_tid3.x));
  uint v109 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v110 = (int)(v109);
  uint v111 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v112 = (int)(v111);
  int v113 = 8;
  int v114 = v113 + v102;
  int v115 = v101[v114];
  uint v116 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v117 = (int)(v116);
  int v118;
  v118 = v117;
  switch (v115) {
    case 0:
      {
      int v119 = 12;
      int v120 = v119 + v102;
      int v121 = v101[v120];
      int v122 = 0;
      int v123;
      v123 = v122;
      switch (v121) {
        case 0:
          {
          int v124 = 16;
          int v125 = v124 + v102;
          int v126 = v101[v125];
          int v127 = 0;
          bool v128 = v126 != v127;
          int v129;
          if (v128) {
            int v130 = 1;
            int v131 = v102 + v130;
            v129 = v131;
          } else {
            int v132 = 4;
            v129 = v132;
          }
          v123 = v129;
          break;
        }
        case 1:
          {
          int v133 = 20;
          int v134 = v133 + v102;
          int v135 = v101[v134];
          int v136 = 4;
          int v137 = v102 + v136;
          int v138;
          v138 = v137;
          switch (v135) {
            case 0:
              {
              v138 = v102;
              break;
            }
            default:
              {
              v138 = v102;
              break;
            }
            case 1:
              {
              int v139 = 4;
              v138 = v139;
              break;
            }
            case 2:
              {
              v138 = v102;
              break;
            }
          }
          bool v140 = true;
          v123 = v138;
          break;
        }
        default:
          {
          int v141 = 24;
          int v142 = v141 + v102;
          int v143 = v101[v142];
          int v144 = 4;
          int v145 = v102 + v144;
          int v146;
          v146 = v145;
          switch (v143) {
            default:
              {
              int v147 = 1;
              v146 = v147;
              break;
            }
            case 0:
              {
              v146 = v102;
              break;
            }
            case 1:
              {
              int v148 = 1;
              int v149 = v102 + v148;
              v146 = v149;
              break;
            }
          }
          bool v150 = true;
          v123 = v146;
          break;
        }
      }
      bool v151 = true;
      v118 = v123;
      break;
    }
    default:
      {
      int v152 = 28;
      int v153 = v152 + v102;
      int v154 = v101[v153];
      int v155 = 2;
      int v156 = v102 + v155;
      int v157;
      v157 = v156;
      switch (v154) {
        case 0:
          {
          int v158 = 0;
          v157 = v158;
          break;
        }
        case 1:
          {
          int v159 = 2;
          v157 = v159;
          break;
        }
        default:
          {
          int v160 = 32;
          int v161 = v160 + v102;
          int v162 = v101[v161];
          int v163;
          v163 = v102;
          switch (v162) {
            case 0:
              {
              v163 = v102;
            }
            default:
              {
              v163 = v102;
            }
            case 1:
              {
              int v164 = 4;
              v163 = v164;
              break;
            }
          }
          bool v165 = true;
          v157 = v163;
          break;
        }
      }
      bool v166 = true;
      v118 = v157;
      break;
    }
    case 1:
      {
      v118 = v102;
      break;
    }
    case 2:
      {
      v118 = v102;
      break;
    }
  }
  bool v167 = true;
  int v168 = 32;
  int v169 = v168 + v102;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v100[v169] = v171;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
