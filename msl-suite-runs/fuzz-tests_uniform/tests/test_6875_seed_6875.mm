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
    int v7 = 3;
    int v8 = v3 % v7;
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      default:
        {
        int v12 = 1;
        int v13 = v0 + v12;
        v11 = v13;
        break;
      }
      case 0:
        {
        int v14 = 0;
        int v15 = 0;
        int v16;
        int v17;
        v16 = v14;
        v17 = v15;
        while (true) {
          int v18 = 4;
          int v19 = v3 % v18;
          int v20 = 1;
          int v21 = v19 + v20;
          bool v22 = v17 < v21;
          v16 = v16;
          v17 = v17;
          if (!v22) break;
          int v23 = 1;
          int v24 = v17 + v23;
          v16 = v0;
          v17 = v24;
          continue;
          ;
        }
        int v25 = 3;
        int v26 = v0 + v25;
        v11 = v16;
      }
      case 1:
        {
        int v27 = 0;
        bool v28 = v2 != v27;
        int v29;
        if (v28) {
          v29 = v0;
        } else {
          int v30 = 1;
          v29 = v30;
        }
        int v31 = 0;
        int v32 = v0 + v31;
        v11 = v29;
      }
      case 2:
        {
        int v33 = 4;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v3) {
          default:
            {
            int v36 = 4;
            int v37 = v0 + v36;
            v35 = v37;
            break;
          }
          case 0:
            {
            int v38 = 4;
            int v39 = v0 + v38;
            v35 = v39;
            break;
          }
        }
        int v40 = 4;
        int v41 = v0 + v40;
        v11 = v35;
        break;
      }
    }
    int v42 = 3;
    int v43 = v0 + v42;
    v6 = v11;
  } else {
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
      int v53 = 0;
      bool v54 = v2 != v53;
      int v55;
      if (v54) {
        uint v56 = simt_lane_id(__simt_tid);
        int v57 = (int)(v56);
        v55 = v57;
      } else {
        uint v58 = simt_lane_id(__simt_tid);
        int v59 = (int)(v58);
        v55 = v59;
      }
      int v60 = 1;
      int v61 = v47 + v60;
      v46 = v55;
      v47 = v61;
      break;
      ;
    }
    int v62 = 1;
    v6 = v46;
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  uint v76 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v77 = (int)(v76);
  int v78 = 0;
  int v79 = 0;
  int v80;
  int v81;
  v80 = v78;
  v81 = v79;
  while (true) {
    int v82 = 4;
    int v83 = v81 * v82;
    int v84 = v83 + v69;
    int v85 = 8;
    int v86 = v85 + v84;
    int v87 = v68[v86];
    int v88 = 0;
    bool v89 = v87 != v88;
    v80 = v80;
    v81 = v81;
    if (!v89) break;
    int v90 = 4;
    int v91 = v80 + v90;
    int v92 = 1;
    int v93 = v81 + v92;
    v80 = v91;
    v81 = v93;
  }
  bool v94 = true;
  int v95 = 16;
  int v96 = v95 + v69;
  bool v97 = true;
  int v98 = simt_wave_count_bits(v97);
  v67[v96] = v98;
  int v99 = 28;
  int v100 = v99 + v69;
  int v101 = v68[v100];
  int v102;
  v102 = v69;
  switch (v101) {
    case 0:
      {
      int v103 = 2;
      v102 = v103;
      break;
    }
    default:
      {
      int v104 = 32;
      int v105 = v104 + v69;
      int v106 = v68[v105];
      int v107 = 3;
      int v108;
      v108 = v107;
      switch (v106) {
        default:
          {
          int v109 = 36;
          int v110 = v109 + v69;
          int v111 = v68[v110];
          int v112 = 4;
          int v113;
          v113 = v112;
          switch (v111) {
            case 0:
              {
              int v114 = 0;
              int v115 = v69 + v114;
              v113 = v115;
              break;
            }
            default:
              {
              int v116 = 1;
              v113 = v116;
            }
            case 1:
              {
              int v117 = 0;
              int v118 = v69 + v117;
              v113 = v118;
              break;
            }
          }
          bool v119 = true;
          v108 = v113;
          break;
        }
        case 0:
          {
          int v120 = 40;
          int v121 = v120 + v69;
          int v122 = v68[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          int v125;
          if (v124) {
            v125 = v69;
          } else {
            int v126 = 3;
            int v127 = v69 + v126;
            v125 = v127;
          }
          v108 = v125;
          break;
        }
        case 1:
          {
          int v128 = 44;
          int v129 = v128 + v69;
          int v130 = v68[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            v133 = v69;
          } else {
            int v134 = 4;
            v133 = v134;
          }
          v108 = v133;
          break;
        }
        case 2:
          {
          int v135 = 0;
          int v136 = 0;
          int v137;
          int v138;
          v137 = v135;
          v138 = v136;
          while (true) {
            int v139 = 4;
            int v140 = v138 * v139;
            int v141 = v140 + v69;
            int v142 = 48;
            int v143 = v142 + v141;
            int v144 = v68[v143];
            int v145 = 0;
            bool v146 = v144 != v145;
            v137 = v137;
            v138 = v138;
            if (!v146) break;
            int v147 = v137 + v138;
            int v148 = 1;
            int v149 = v138 + v148;
            v137 = v147;
            v138 = v149;
            continue;
            ;
          }
          bool v150 = true;
          v108 = v137;
          break;
        }
      }
      bool v151 = true;
      v102 = v108;
      break;
    }
  }
  bool v152 = true;
  int v153 = 32;
  int v154 = v153 + v69;
  bool v155 = true;
  int v156 = simt_wave_count_bits(v155);
  v67[v154] = v156;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
