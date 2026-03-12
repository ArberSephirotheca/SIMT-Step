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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  int v10 = 4;
  int v11 = v0 + v10;
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 0;
      bool v14 = v2 != v13;
      int v15;
      if (v14) {
        int v16 = 0;
        int v17 = 0;
        int v18;
        int v19;
        v18 = v16;
        v19 = v17;
        while (true) {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v21 + v22;
          bool v24 = v19 < v23;
          v18 = v18;
          v19 = v19;
          if (!v24) break;
          int v25 = 4;
          int v26 = v0 + v25;
          int v27 = 1;
          int v28 = v19 + v27;
          v18 = v26;
          v19 = v28;
        }
        v15 = v18;
      } else {
        int v29 = 0;
        int v30 = 0;
        int v31;
        int v32;
        v31 = v29;
        v32 = v30;
        while (true) {
          int v33 = 4;
          int v34 = v3 % v33;
          int v35 = 1;
          int v36 = v34 + v35;
          bool v37 = v32 < v36;
          v31 = v31;
          v32 = v32;
          if (!v37) break;
          int v38 = 2;
          int v39 = v0 + v38;
          int v40 = 1;
          int v41 = v32 + v40;
          v31 = v39;
          v32 = v41;
        }
        v15 = v31;
      }
      v12 = v15;
      break;
    }
    default:
      {
      int v42 = 0;
      bool v43 = v2 != v42;
      int v44;
      if (v43) {
        int v45 = 0;
        bool v46 = v2 != v45;
        int v47;
        if (v46) {
          int v48 = 1;
          v47 = v48;
        } else {
          int v49 = 1;
          int v50 = v0 + v49;
          v47 = v50;
        }
        v44 = v47;
      } else {
        int v51 = 2;
        int v52 = v3 % v51;
        int v53 = 3;
        int v54;
        v54 = v53;
        switch (v52) {
          case 0:
            {
            int v55 = 0;
            v54 = v55;
            break;
          }
          case 1:
            {
            int v56 = 3;
            v54 = v56;
            break;
          }
          default:
            {
            int v57 = 4;
            int v58 = v0 + v57;
            v54 = v58;
            break;
          }
        }
        v44 = v54;
      }
      v12 = v44;
      break;
    }
    case 1:
      {
      int v59 = 2;
      int v60 = v3 % v59;
      int v61 = 4;
      int v62;
      v62 = v61;
      switch (v60) {
        case 0:
          {
          int v63 = 0;
          bool v64 = v2 != v63;
          int v65;
          if (v64) {
            int v66 = 2;
            v65 = v66;
          } else {
            v65 = v0;
          }
          v62 = v65;
          break;
        }
        default:
          {
          int v67 = 3;
          int v68 = v3 % v67;
          int v69 = 0;
          int v70 = v0 + v69;
          int v71;
          v71 = v70;
          switch (v68) {
            default:
              {
              int v72 = 1;
              v71 = v72;
              break;
            }
            case 0:
              {
              int v73 = 0;
              int v74 = v0 + v73;
              v71 = v74;
              break;
            }
            case 1:
              {
              int v75 = 0;
              int v76 = v0 + v75;
              v71 = v76;
            }
            case 2:
              {
              int v77 = 0;
              int v78 = v0 + v77;
              v71 = v78;
              break;
            }
          }
          int v79 = 0;
          v62 = v71;
          break;
        }
      }
      int v80 = 4;
      v12 = v62;
      break;
    }
  }
  int v81 = 0;
  bool v82 = v2 != v81;
  int v83 = v82 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v84 [[buffer(0)]], device int* v85 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v86 = static_cast<int>(__simt_tid3.x);
  int v87 = 0;
  int v88 = v87 + v86;
  int v89 = v85[v88];
  int v90 = 4;
  int v91 = v90 + v86;
  int v92 = v85[v91];
  int v93 = 0;
  bool v94 = v89 != v93;
  if (v94) {
    int v95 = 8;
    int v96 = v95 + v86;
    int v97 = v85[v96];
    int v98 = 0;
    bool v99 = v97 != v98;
    if (v99) {
      helper0(v86, v84, v89, v92, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v100 = 2;
  int v101 = 4;
  int v102 = v86 + v101;
  int v103 = 0;
  int v104 = 0;
  int v105;
  int v106;
  v105 = v103;
  v106 = v104;
  while (true) {
    int v107 = 4;
    int v108 = v106 * v107;
    int v109 = v108 + v86;
    int v110 = 12;
    int v111 = v110 + v109;
    int v112 = v85[v111];
    int v113 = 0;
    bool v114 = v112 != v113;
    v105 = v105;
    v106 = v106;
    if (!v114) break;
    int v115 = v105 + v106;
    int v116 = 1;
    int v117 = v106 + v116;
    bool v118 = true;
    int v119 = 16;
    int v120 = 4;
    int v121 = v106 * v120;
    int v122 = v119 + v121;
    int v123 = v122 + v86;
    bool v124 = true;
    int v125 = simt_wave_count_bits(v124);
    v84[v123] = v125;
    v105 = v115;
    v106 = v117;
  }
  int v126 = 0;
  int v127 = 0;
  int v128;
  int v129;
  v128 = v126;
  v129 = v127;
  while (true) {
    int v130 = 4;
    int v131 = v129 * v130;
    int v132 = v131 + v86;
    int v133 = 32;
    int v134 = v133 + v132;
    int v135 = v85[v134];
    int v136 = 0;
    bool v137 = v135 != v136;
    v128 = v128;
    v129 = v129;
    if (!v137) break;
    int v138 = v128 + v129;
    int v139 = 1;
    int v140 = v129 + v139;
    bool v141 = true;
    int v142 = 32;
    int v143 = 4;
    int v144 = v129 * v143;
    int v145 = v142 + v144;
    int v146 = v145 + v86;
    bool v147 = true;
    int v148 = simt_wave_count_bits(v147);
    v84[v146] = v148;
    v128 = v138;
    v129 = v140;
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
    static int32_t expected0[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
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
