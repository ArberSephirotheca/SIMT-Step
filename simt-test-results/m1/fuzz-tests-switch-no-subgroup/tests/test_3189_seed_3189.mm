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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
      break;
    }
    case 1:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14;
        v14 = v0;
        switch (v13) {
          default:
            {
            int v15 = 4;
            int v16 = v0 + v15;
            v14 = v16;
          }
          case 0:
            {
            v14 = v0;
            break;
          }
          case 1:
            {
            int v17 = 2;
            int v18 = v0 + v17;
            v14 = v18;
            break;
          }
        }
        int v19 = 1;
        int v20 = v0 + v19;
        v11 = v14;
      } else {
        int v21 = 0;
        int v22 = 0;
        int v23;
        int v24;
        v23 = v21;
        v24 = v22;
        while (true) {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27 = 1;
          int v28 = v26 + v27;
          bool v29 = v24 < v28;
          v23 = v23;
          v24 = v24;
          if (!v29) break;
          int v30 = 1;
          int v31 = v24 + v30;
          v23 = v0;
          v24 = v31;
        }
        v11 = v23;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v32 = 0;
      int v33 = 0;
      int v34;
      int v35;
      v34 = v32;
      v35 = v33;
      while (true) {
        int v36 = 4;
        int v37 = v3 % v36;
        int v38 = 1;
        int v39 = v37 + v38;
        bool v40 = v35 < v39;
        v34 = v34;
        v35 = v35;
        if (!v40) break;
        int v41 = 1;
        int v42 = v35 + v41;
        v34 = v0;
        v35 = v42;
      }
      v8 = v34;
    }
    case 2:
      {
      int v43 = 3;
      int v44 = v3 % v43;
      int v45 = 2;
      int v46 = v0 + v45;
      int v47;
      v47 = v46;
      switch (v44) {
        case 0:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            int v51 = 1;
            v50 = v51;
          } else {
            int v52 = 2;
            v50 = v52;
          }
          v47 = v50;
        }
        default:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            int v56 = 1;
            int v57 = v0 + v56;
            v55 = v57;
          } else {
            int v58 = 0;
            v55 = v58;
          }
          v47 = v55;
          break;
        }
        case 1:
          {
          int v59 = 0;
          int v60 = v0 + v59;
          int v61;
          v61 = v60;
          switch (v3) {
            default:
              {
              int v62 = 2;
              int v63 = v0 + v62;
              v61 = v63;
              break;
            }
            case 0:
              {
              v61 = v0;
              break;
            }
          }
          v47 = v61;
          break;
        }
      }
      v8 = v47;
      break;
    }
  }
  bool v64 = true;
  int v65 = simt_wave_count_bits(v64);
  int v66 = 0;
  int v67 = v66 + v0;
  v1[v67] = v65;
  return;
}

kernel void kernel_main(device int* v68 [[buffer(0)]], device int* v69 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v70 = static_cast<int>(__simt_tid3.x);
  int v71 = 0;
  int v72 = v71 + v70;
  int v73 = v69[v72];
  int v74 = 4;
  int v75 = v74 + v70;
  int v76 = v69[v75];
  int v77 = 0;
  bool v78 = v73 != v77;
  if (v78) {
  } else {
    int v79 = 0;
    int v80 = 0;
    int v81;
    int v82;
    v81 = v79;
    v82 = v80;
    while (true) {
      int v83 = 2;
      bool v84 = v82 < v83;
      v81 = v81;
      v82 = v82;
      if (!v84) break;
      helper0(v70, v68, v73, v76, static_cast<int>(__simt_tid3.x));
      int v85 = 1;
      int v86 = v82 + v85;
      v81 = v81;
      v82 = v86;
    }
  }
  uint v87 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v88 = (int)(v87);
  int v89 = 8;
  int v90 = v89 + v70;
  int v91 = v69[v90];
  uint v92 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v93 = (int)(v92);
  int v94;
  v94 = v93;
  switch (v91) {
    case 0:
      {
      int v95 = 2;
      int v96 = v70 + v95;
      v94 = v96;
    }
    default:
      {
      int v97 = 12;
      int v98 = v97 + v70;
      int v99 = v69[v98];
      int v100 = 1;
      int v101;
      v101 = v100;
      switch (v99) {
        case 0:
          {
          int v102 = 16;
          int v103 = v102 + v70;
          int v104 = v69[v103];
          int v105 = 2;
          int v106 = v70 + v105;
          int v107;
          v107 = v106;
          switch (v104) {
            default:
              {
              int v108 = 0;
              v107 = v108;
              break;
            }
            case 0:
              {
              v107 = v70;
              break;
            }
            case 1:
              {
              int v109 = 4;
              v107 = v109;
              break;
            }
            case 2:
              {
              v107 = v70;
              break;
            }
          }
          v101 = v107;
          break;
        }
        default:
          {
          int v110 = 20;
          int v111 = v110 + v70;
          int v112 = v69[v111];
          int v113;
          v113 = v70;
          switch (v112) {
            default:
              {
              int v114 = 1;
              int v115 = v70 + v114;
              v113 = v115;
              break;
            }
            case 0:
              {
              int v116 = 4;
              v113 = v116;
              break;
            }
          }
          v101 = v113;
          break;
        }
        case 1:
          {
          int v117 = 4;
          int v118 = v70 + v117;
          v101 = v118;
          break;
        }
      }
      v94 = v101;
    }
    case 1:
      {
      int v119 = 24;
      int v120 = v119 + v70;
      int v121 = v69[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 28;
        int v126 = v125 + v70;
        int v127 = v69[v126];
        int v128 = 0;
        int v129;
        v129 = v128;
        switch (v127) {
          case 0:
            {
            v129 = v70;
            break;
          }
          case 1:
            {
            v129 = v70;
            break;
          }
          default:
            {
            int v130 = 3;
            int v131 = v70 + v130;
            v129 = v131;
            break;
          }
          case 2:
            {
            v129 = v70;
            break;
          }
        }
        v124 = v129;
      } else {
        int v132 = 4;
        int v133 = v70 + v132;
        v124 = v133;
      }
      v94 = v124;
      break;
    }
  }
  bool v134 = true;
  int v135 = 16;
  int v136 = v135 + v70;
  bool v137 = true;
  int v138 = simt_wave_count_bits(v137);
  v68[v136] = v138;
  int v139 = 0;
  int v140 = 0;
  int v141;
  int v142;
  v141 = v139;
  v142 = v140;
  while (true) {
    int v143 = 4;
    int v144 = v142 * v143;
    int v145 = v144 + v70;
    int v146 = 32;
    int v147 = v146 + v145;
    int v148 = v69[v147];
    int v149 = 0;
    bool v150 = v148 != v149;
    v141 = v141;
    v142 = v142;
    if (!v150) break;
    int v151 = v141 + v142;
    int v152 = 1;
    int v153 = v142 + v152;
    bool v154 = true;
    int v155 = 32;
    int v156 = 4;
    int v157 = v142 * v156;
    int v158 = v155 + v157;
    int v159 = v158 + v70;
    bool v160 = true;
    int v161 = simt_wave_count_bits(v160);
    v68[v159] = v161;
    v141 = v151;
    v142 = v153;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
