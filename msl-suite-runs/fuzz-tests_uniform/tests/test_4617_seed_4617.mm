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
    int v13 = 1;
    int v14 = v7 + v13;
    v6 = v0;
    v7 = v14;
  }
  bool v15 = true;
  int v16 = simt_wave_count_bits(v15);
  int v17 = 0;
  int v18 = v17 + v0;
  v1[v18] = v16;
  int v19 = 0;
  bool v20 = v2 != v19;
  int v21;
  if (v20) {
    uint v22 = simt_subgroup_id(__simt_tid);
    int v23 = (int)(v22);
    v21 = v23;
  } else {
    v21 = v0;
  }
  bool v24 = true;
  int v25 = simt_wave_count_bits(v24);
  int v26 = 16;
  int v27 = v26 + v0;
  v1[v27] = v25;
  int v28 = 0;
  bool v29 = v2 != v28;
  int v30 = v29 ? v6 : v21;
  int v31 = 0;
  bool v32 = v2 != v31;
  int v33;
  if (v32) {
    int v34 = 2;
    int v35 = v3 % v34;
    int v36 = 1;
    int v37;
    v37 = v36;
    switch (v35) {
      case 0:
        {
        int v38 = 3;
        int v39 = v3 % v38;
        int v40 = 1;
        int v41;
        v41 = v40;
        switch (v39) {
          case 0:
            {
            int v42 = 3;
            v41 = v42;
            break;
          }
          default:
            {
            v41 = v0;
            break;
          }
          case 1:
            {
            int v43 = 2;
            v41 = v43;
            break;
          }
          case 2:
            {
            int v44 = 2;
            v41 = v44;
            break;
          }
        }
        int v45 = 0;
        v37 = v41;
      }
      case 1:
        {
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          v48 = v0;
        } else {
          int v49 = 0;
          v48 = v49;
        }
        v37 = v48;
        break;
      }
      default:
        {
        int v50 = 0;
        bool v51 = v2 != v50;
        int v52;
        if (v51) {
          int v53 = 1;
          v52 = v53;
        } else {
          int v54 = 0;
          int v55 = v0 + v54;
          v52 = v55;
        }
        v37 = v52;
        break;
      }
    }
    uint v56 = simt_subgroup_id(__simt_tid);
    int v57 = (int)(v56);
    v33 = v37;
  } else {
    uint v58 = simt_subgroup_id(__simt_tid);
    int v59 = (int)(v58);
    v33 = v59;
  }
  bool v60 = true;
  int v61 = simt_wave_count_bits(v60);
  int v62 = 32;
  int v63 = v62 + v0;
  v1[v63] = v61;
  int v64 = 0;
  bool v65 = v2 != v64;
  int v66 = v65 ? v30 : v33;
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
  int v76 = 8;
  int v77 = v76 + v69;
  int v78 = v68[v77];
  uint v79 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v80 = (int)(v79);
  int v81;
  v81 = v80;
  switch (v78) {
    default:
      {
      int v82 = 12;
      int v83 = v82 + v69;
      int v84 = v68[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        int v88 = 16;
        int v89 = v88 + v69;
        int v90 = v68[v89];
        int v91 = 0;
        bool v92 = v90 != v91;
        int v93;
        if (v92) {
          int v94 = 0;
          int v95 = v69 + v94;
          v93 = v95;
        } else {
          int v96 = 3;
          int v97 = v69 + v96;
          v93 = v97;
        }
        v87 = v93;
      } else {
        int v98 = 20;
        int v99 = v98 + v69;
        int v100 = v68[v99];
        int v101 = 2;
        int v102;
        v102 = v101;
        switch (v100) {
          case 0:
            {
            v102 = v69;
            break;
          }
          case 1:
            {
            v102 = v69;
            break;
          }
          default:
            {
            int v103 = 0;
            v102 = v103;
            break;
          }
        }
        bool v104 = true;
        v87 = v102;
      }
      v81 = v87;
      break;
    }
    case 0:
      {
      int v105 = 24;
      int v106 = v105 + v69;
      int v107 = v68[v106];
      int v108 = 4;
      int v109;
      v109 = v108;
      switch (v107) {
        case 0:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v69;
            int v117 = 28;
            int v118 = v117 + v116;
            int v119 = v68[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            v112 = v122;
            v113 = v124;
            break;
            ;
          }
          bool v125 = true;
          v109 = v112;
          break;
        }
        default:
          {
          int v126 = 48;
          int v127 = v126 + v69;
          int v128 = v68[v127];
          int v129 = 0;
          int v130;
          v130 = v129;
          switch (v128) {
            case 0:
              {
              v130 = v69;
              break;
            }
            case 1:
              {
              int v131 = 1;
              int v132 = v69 + v131;
              v130 = v132;
            }
            case 2:
              {
              int v133 = 3;
              v130 = v133;
            }
            default:
              {
              int v134 = 2;
              v130 = v134;
              break;
            }
          }
          bool v135 = true;
          v109 = v130;
          break;
        }
      }
      bool v136 = true;
      v81 = v109;
      break;
    }
    case 1:
      {
      int v137 = 0;
      int v138 = 0;
      int v139;
      int v140;
      v139 = v137;
      v140 = v138;
      while (true) {
        int v141 = 4;
        int v142 = v140 * v141;
        int v143 = v142 + v69;
        int v144 = 52;
        int v145 = v144 + v143;
        int v146 = v68[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        v139 = v139;
        v140 = v140;
        if (!v148) break;
        int v149 = v139 + v140;
        int v150 = 1;
        int v151 = v140 + v150;
        v139 = v149;
        v140 = v151;
      }
      bool v152 = true;
      v81 = v139;
      break;
    }
  }
  bool v153 = true;
  int v154 = 48;
  int v155 = v154 + v69;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v67[v155] = v157;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
