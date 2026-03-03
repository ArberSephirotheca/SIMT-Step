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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 1;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 0;
            v13 = v14;
          } else {
            v13 = v0;
          }
          int v15 = 3;
          int v16 = v0 + v15;
          v10 = v13;
          break;
        }
        default:
          {
          int v17 = 0;
          int v18 = 0;
          int v19;
          int v20;
          v19 = v17;
          v20 = v18;
          while (true) {
            int v21 = 4;
            int v22 = v3 % v21;
            int v23 = 1;
            int v24 = v22 + v23;
            bool v25 = v20 < v24;
            v19 = v19;
            v20 = v20;
            if (!v25) break;
            int v26 = 1;
            int v27 = v20 + v26;
            v19 = v0;
            v20 = v27;
            break;
            ;
          }
          v10 = v19;
          break;
        }
        case 1:
          {
          int v28 = 0;
          int v29 = 0;
          int v30;
          int v31;
          v30 = v28;
          v31 = v29;
          while (true) {
            int v32 = 4;
            int v33 = v3 % v32;
            int v34 = 1;
            int v35 = v33 + v34;
            bool v36 = v31 < v35;
            v30 = v30;
            v31 = v31;
            if (!v36) break;
            int v37 = 4;
            int v38 = v0 + v37;
            int v39 = 1;
            int v40 = v31 + v39;
            v30 = v38;
            v31 = v40;
            break;
            ;
          }
          v10 = v30;
          break;
        }
        case 2:
          {
          int v41 = 2;
          v10 = v41;
          break;
        }
      }
      int v42 = 4;
      v6 = v10;
      break;
    }
    case 1:
      {
      int v43 = 0;
      int v44 = 0;
      int v45;
      int v46;
      v45 = v43;
      v46 = v44;
      while (true) {
        int v47 = 4;
        int v48 = v3 % v47;
        int v49 = 1;
        int v50 = v48 + v49;
        bool v51 = v46 < v50;
        v45 = v45;
        v46 = v46;
        if (!v51) break;
        int v52 = 0;
        bool v53 = v2 != v52;
        int v54;
        if (v53) {
          int v55 = 3;
          v54 = v55;
        } else {
          int v56 = 1;
          v54 = v56;
        }
        int v57 = 1;
        int v58 = v0 + v57;
        int v59 = 1;
        int v60 = v46 + v59;
        v45 = v54;
        v46 = v60;
        continue;
        ;
      }
      int v61 = 4;
      v6 = v45;
      break;
    }
    default:
      {
      int v62 = 4;
      v6 = v62;
      break;
    }
    case 2:
      {
      int v63 = 2;
      int v64 = v3 % v63;
      int v65 = 3;
      int v66 = v0 + v65;
      int v67;
      v67 = v66;
      switch (v64) {
        default:
          {
          int v68 = 3;
          int v69 = v3 % v68;
          int v70 = 1;
          int v71 = v0 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            default:
              {
              int v73 = 4;
              v72 = v73;
            }
            case 0:
              {
              int v74 = 2;
              v72 = v74;
              break;
            }
            case 1:
              {
              int v75 = 1;
              v72 = v75;
              break;
            }
          }
          int v76 = 1;
          v67 = v72;
          break;
        }
        case 0:
          {
          int v77 = 0;
          bool v78 = v2 != v77;
          int v79;
          if (v78) {
            v79 = v0;
          } else {
            int v80 = 1;
            v79 = v80;
          }
          int v81 = 0;
          v67 = v79;
          break;
        }
      }
      int v82 = 1;
      v6 = v67;
      break;
    }
  }
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  int v85 = 0;
  int v86 = v85 + v0;
  v1[v86] = v84;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
  uint v96 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98 = 8;
  int v99 = v98 + v89;
  int v100 = v88[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    int v104 = 0;
    int v105 = 0;
    int v106;
    int v107;
    v106 = v104;
    v107 = v105;
    while (true) {
      int v108 = 4;
      int v109 = v107 * v108;
      int v110 = v109 + v89;
      int v111 = 12;
      int v112 = v111 + v110;
      int v113 = v88[v112];
      int v114 = 0;
      bool v115 = v113 != v114;
      v106 = v106;
      v107 = v107;
      if (!v115) break;
      int v116 = 32;
      int v117 = v116 + v89;
      int v118 = v88[v117];
      int v119 = 4;
      int v120;
      v120 = v119;
      switch (v118) {
        case 0:
          {
          int v121 = 3;
          int v122 = v89 + v121;
          v120 = v122;
          break;
        }
        case 1:
          {
          v120 = v89;
          break;
        }
        default:
          {
          int v123 = 3;
          int v124 = v89 + v123;
          v120 = v124;
          break;
        }
      }
      bool v125 = true;
      int v126 = v106 + v120;
      int v127 = 1;
      int v128 = v107 + v127;
      v106 = v126;
      v107 = v128;
    }
    bool v129 = true;
    v103 = v106;
  } else {
    int v130 = 0;
    int v131 = 0;
    int v132;
    int v133;
    v132 = v130;
    v133 = v131;
    while (true) {
      int v134 = 4;
      int v135 = v133 * v134;
      int v136 = v135 + v89;
      int v137 = 36;
      int v138 = v137 + v136;
      int v139 = v88[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      v132 = v132;
      v133 = v133;
      if (!v141) break;
      int v142 = 56;
      int v143 = v142 + v89;
      int v144 = v88[v143];
      int v145 = 0;
      bool v146 = v144 != v145;
      int v147;
      if (v146) {
        int v148 = 4;
        int v149 = v89 + v148;
        v147 = v149;
      } else {
        uint v150 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v151 = (int)(v150);
        v147 = v151;
      }
      int v152 = v132 + v147;
      int v153 = 1;
      int v154 = v133 + v153;
      v132 = v152;
      v133 = v154;
    }
    bool v155 = true;
    v103 = v132;
  }
  int v156 = 16;
  int v157 = v156 + v89;
  bool v158 = true;
  int v159 = simt_wave_count_bits(v158);
  v87[v157] = v159;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
