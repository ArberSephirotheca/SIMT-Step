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
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 2;
      int v17 = v3 % v16;
      int v18 = 0;
      int v19;
      v19 = v18;
      switch (v17) {
        default:
          {
          int v20 = 3;
          int v21 = v0 + v20;
          v19 = v21;
          break;
        }
        case 0:
          {
          v19 = v0;
          break;
        }
      }
      int v22 = 1;
      int v23 = v10 + v22;
      v9 = v19;
      v10 = v23;
    }
    v6 = v9;
  } else {
    int v24 = 0;
    int v25 = 0;
    int v26;
    int v27;
    v26 = v24;
    v27 = v25;
    while (true) {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 1;
      int v31 = v29 + v30;
      bool v32 = v27 < v31;
      v26 = v26;
      v27 = v27;
      if (!v32) break;
      int v33 = 4;
      int v34 = v3 % v33;
      int v35;
      v35 = v0;
      switch (v34) {
        case 0:
          {
          int v36 = 4;
          v35 = v36;
          break;
        }
        case 1:
          {
          v35 = v0;
        }
        default:
          {
          int v37 = 0;
          v35 = v37;
        }
        case 2:
          {
          v35 = v0;
          break;
        }
      }
      bool v38 = true;
      int v39 = simt_wave_count_bits(v38);
      int v40 = 0;
      int v41 = 4;
      int v42 = v27 * v41;
      int v43 = v40 + v42;
      int v44 = v43 + v0;
      v1[v44] = v39;
      int v45 = 1;
      int v46 = v27 + v45;
      v26 = v35;
      v27 = v46;
    }
    v6 = v26;
  }
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
  int v56 = 8;
  int v57 = v56 + v49;
  int v58 = v48[v57];
  int v59;
  v59 = v49;
  switch (v58) {
    case 0:
      {
      int v60 = 12;
      int v61 = v60 + v49;
      int v62 = v48[v61];
      int v63;
      v63 = v49;
      switch (v62) {
        case 0:
          {
          int v64 = 0;
          int v65 = 0;
          int v66;
          int v67;
          v66 = v64;
          v67 = v65;
          while (true) {
            int v68 = 4;
            int v69 = v67 * v68;
            int v70 = v69 + v49;
            int v71 = 16;
            int v72 = v71 + v70;
            int v73 = v48[v72];
            int v74 = 0;
            bool v75 = v73 != v74;
            v66 = v66;
            v67 = v67;
            if (!v75) break;
            int v76 = v66 + v67;
            int v77 = 1;
            int v78 = v67 + v77;
            bool v79 = true;
            v66 = v76;
            v67 = v78;
          }
          v63 = v66;
        }
        case 1:
          {
          int v80 = 0;
          v63 = v80;
          break;
        }
        case 2:
          {
          int v81 = 36;
          int v82 = v81 + v49;
          int v83 = v48[v82];
          int v84;
          v84 = v49;
          switch (v83) {
            case 0:
              {
              int v85 = 2;
              v84 = v85;
            }
            case 1:
              {
              v84 = v49;
              break;
            }
            default:
              {
              int v86 = 0;
              int v87 = v49 + v86;
              v84 = v87;
              break;
            }
            case 2:
              {
              int v88 = 0;
              v84 = v88;
              break;
            }
          }
          v63 = v84;
          break;
        }
        default:
          {
          int v89 = 0;
          int v90 = 0;
          int v91;
          int v92;
          v91 = v89;
          v92 = v90;
          while (true) {
            int v93 = 4;
            int v94 = v92 * v93;
            int v95 = v94 + v49;
            int v96 = 40;
            int v97 = v96 + v95;
            int v98 = v48[v97];
            int v99 = 0;
            bool v100 = v98 != v99;
            v91 = v91;
            v92 = v92;
            if (!v100) break;
            int v101 = v91 + v92;
            int v102 = 1;
            int v103 = v92 + v102;
            bool v104 = true;
            v91 = v101;
            v92 = v103;
            break;
            ;
          }
          v63 = v91;
          break;
        }
      }
      v59 = v63;
      break;
    }
    default:
      {
      int v105 = 60;
      int v106 = v105 + v49;
      int v107 = v48[v106];
      int v108 = 3;
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
            int v116 = v115 + v49;
            int v117 = 64;
            int v118 = v117 + v116;
            int v119 = v48[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            bool v125 = true;
            v112 = v122;
            v113 = v124;
          }
          v109 = v112;
          break;
        }
        case 1:
          {
          int v126 = 84;
          int v127 = v126 + v49;
          int v128 = v48[v127];
          int v129 = 0;
          bool v130 = v128 != v129;
          int v131;
          if (v130) {
            int v132 = 2;
            v131 = v132;
          } else {
            v131 = v49;
          }
          v109 = v131;
          break;
        }
        default:
          {
          int v133 = 88;
          int v134 = v133 + v49;
          int v135 = v48[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            int v139 = 1;
            v138 = v139;
          } else {
            int v140 = 4;
            v138 = v140;
          }
          v109 = v138;
          break;
        }
      }
      v59 = v109;
      break;
    }
    case 1:
      {
      int v141 = 92;
      int v142 = v141 + v49;
      int v143 = v48[v142];
      int v144 = 0;
      bool v145 = v143 != v144;
      int v146;
      if (v145) {
        int v147 = 96;
        int v148 = v147 + v49;
        int v149 = v48[v148];
        int v150 = 0;
        bool v151 = v149 != v150;
        int v152;
        if (v151) {
          int v153 = 1;
          v152 = v153;
        } else {
          v152 = v49;
        }
        v146 = v152;
      } else {
        int v154 = 0;
        int v155 = v49 + v154;
        v146 = v155;
      }
      v59 = v146;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 8; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
