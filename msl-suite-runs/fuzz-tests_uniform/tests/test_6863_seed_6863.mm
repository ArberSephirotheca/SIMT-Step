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
  int v8;
  v8 = v0;
  switch (v7) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 2;
          int v15 = v0 + v14;
          int v16;
          v16 = v15;
          switch (v3) {
            case 0:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v16 = v18;
            }
            default:
              {
              int v19 = 3;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
          }
          int v21 = 2;
          v13 = v16;
          break;
        }
        default:
          {
          int v22 = 2;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v3) {
            default:
              {
              v24 = v0;
              break;
            }
            case 0:
              {
              v24 = v0;
              break;
            }
          }
          v13 = v24;
          break;
        }
        case 1:
          {
          int v25 = 2;
          int v26 = v3 % v25;
          int v27 = 0;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            default:
              {
              int v30 = 4;
              v29 = v30;
            }
            case 0:
              {
              int v31 = 0;
              int v32 = v0 + v31;
              v29 = v32;
              break;
            }
          }
          int v33 = 0;
          v13 = v29;
          break;
        }
      }
      int v34 = 3;
      v8 = v13;
      break;
    }
    default:
      {
      int v35 = 3;
      v8 = v35;
      break;
    }
    case 1:
      {
      int v36 = 2;
      int v37 = v3 % v36;
      int v38 = 2;
      int v39;
      v39 = v38;
      switch (v37) {
        case 0:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 3;
            int v50 = v0 + v49;
            int v51 = 1;
            int v52 = v43 + v51;
            v42 = v50;
            v43 = v52;
          }
          int v53 = 0;
          v39 = v42;
          break;
        }
        case 1:
          {
          v39 = v0;
          break;
        }
        default:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 4;
            int v64 = 1;
            int v65 = v57 + v64;
            v56 = v63;
            v57 = v65;
            continue;
            ;
          }
          int v66 = 1;
          v39 = v56;
          break;
        }
      }
      v8 = v39;
      break;
    }
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 0;
  int v70 = v69 + v0;
  v1[v70] = v68;
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 0;
  int v84 = 0;
  int v85;
  int v86;
  v85 = v83;
  v86 = v84;
  while (true) {
    int v87 = 4;
    int v88 = v86 * v87;
    int v89 = v88 + v76;
    int v90 = 8;
    int v91 = v90 + v89;
    int v92 = v75[v91];
    int v93 = 0;
    bool v94 = v92 != v93;
    v85 = v85;
    v86 = v86;
    if (!v94) break;
    int v95 = 28;
    int v96 = v95 + v76;
    int v97 = v75[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    int v100;
    if (v99) {
      int v101 = 4;
      v100 = v101;
    } else {
      int v102 = 32;
      int v103 = v102 + v76;
      int v104 = v75[v103];
      int v105;
      v105 = v76;
      switch (v104) {
        case 0:
          {
          int v106 = 0;
          v105 = v106;
          break;
        }
        default:
          {
          int v107 = 4;
          v105 = v107;
          break;
        }
        case 1:
          {
          int v108 = 1;
          int v109 = v76 + v108;
          v105 = v109;
          break;
        }
      }
      bool v110 = true;
      v100 = v105;
    }
    int v111 = v85 + v100;
    int v112 = 1;
    int v113 = v86 + v112;
    v85 = v111;
    v86 = v113;
  }
  bool v114 = true;
  int v115 = 16;
  int v116 = v115 + v76;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v74[v116] = v118;
  int v119 = 36;
  int v120 = v119 + v76;
  int v121 = v75[v120];
  int v122 = 0;
  bool v123 = v121 != v122;
  int v124;
  if (v123) {
    int v125 = 40;
    int v126 = v125 + v76;
    int v127 = v75[v126];
    int v128 = 0;
    bool v129 = v127 != v128;
    int v130;
    if (v129) {
      int v131 = 44;
      int v132 = v131 + v76;
      int v133 = v75[v132];
      int v134 = 0;
      bool v135 = v133 != v134;
      int v136;
      if (v135) {
        uint v137 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v138 = (int)(v137);
        v136 = v138;
      } else {
        v136 = v76;
      }
      v130 = v136;
    } else {
      int v139 = 48;
      int v140 = v139 + v76;
      int v141 = v75[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      int v144;
      if (v143) {
        v144 = v76;
      } else {
        uint v145 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v146 = (int)(v145);
        v144 = v146;
      }
      v130 = v144;
    }
    v124 = v130;
  } else {
    int v147 = 0;
    int v148 = 0;
    int v149;
    int v150;
    v149 = v147;
    v150 = v148;
    while (true) {
      int v151 = 4;
      int v152 = v150 * v151;
      int v153 = v152 + v76;
      int v154 = 52;
      int v155 = v154 + v153;
      int v156 = v75[v155];
      int v157 = 0;
      bool v158 = v156 != v157;
      v149 = v149;
      v150 = v150;
      if (!v158) break;
      int v159 = v149 + v150;
      int v160 = 1;
      int v161 = v150 + v160;
      v149 = v159;
      v150 = v161;
    }
    bool v162 = true;
    v124 = v149;
  }
  int v163 = 32;
  int v164 = v163 + v76;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v74[v164] = v166;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
