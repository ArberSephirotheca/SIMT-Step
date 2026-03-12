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
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = 0;
      int v11;
      int v12;
      v11 = v9;
      v12 = v10;
      while (true) {
        int v13 = 4;
        int v14 = v3 % v13;
        int v15 = 1;
        int v16 = v14 + v15;
        bool v17 = v12 < v16;
        v11 = v11;
        v12 = v12;
        if (!v17) break;
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          v20 = v0;
        } else {
          int v21 = 2;
          v20 = v21;
        }
        int v22 = 4;
        int v23 = v0 + v22;
        int v24 = 1;
        int v25 = v12 + v24;
        v11 = v20;
        v12 = v25;
      }
      v8 = v11;
      break;
    }
    default:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 0;
        int v30 = v0 + v29;
        v28 = v30;
      } else {
        int v31 = 0;
        bool v32 = v2 != v31;
        int v33;
        if (v32) {
          int v34 = 3;
          int v35 = v0 + v34;
          v33 = v35;
        } else {
          int v36 = 0;
          v33 = v36;
        }
        v28 = v33;
      }
      int v37 = 3;
      v8 = v28;
      break;
    }
    case 1:
      {
      int v38 = 3;
      int v39 = v3 % v38;
      int v40 = 1;
      int v41 = v0 + v40;
      int v42;
      v42 = v41;
      switch (v39) {
        default:
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
            int v52 = 2;
            int v53 = v0 + v52;
            int v54 = 1;
            int v55 = v46 + v54;
            v45 = v53;
            v46 = v55;
          }
          v42 = v45;
        }
        case 0:
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
            int v66 = 1;
            int v67 = v59 + v66;
            v58 = v65;
            v59 = v67;
          }
          v42 = v58;
          break;
        }
        case 1:
          {
          int v68 = 4;
          int v69 = v3 % v68;
          int v70 = 3;
          int v71 = v0 + v70;
          int v72;
          v72 = v71;
          switch (v69) {
            default:
              {
              int v73 = 2;
              v72 = v73;
              break;
            }
            case 0:
              {
              v72 = v0;
              break;
            }
            case 1:
              {
              int v74 = 0;
              int v75 = v0 + v74;
              v72 = v75;
              break;
            }
            case 2:
              {
              v72 = v0;
              break;
            }
          }
          int v76 = 2;
          int v77 = v0 + v76;
          v42 = v72;
          break;
        }
        case 2:
          {
          int v78 = 4;
          int v79 = v3 % v78;
          int v80;
          v80 = v0;
          switch (v79) {
            case 0:
              {
              int v81 = 1;
              v80 = v81;
              break;
            }
            case 1:
              {
              int v82 = 2;
              v80 = v82;
              break;
            }
            default:
              {
              int v83 = 4;
              int v84 = v0 + v83;
              v80 = v84;
            }
            case 2:
              {
              int v85 = 4;
              v80 = v85;
              break;
            }
          }
          v42 = v80;
          break;
        }
      }
      int v86 = 4;
      v8 = v42;
      break;
    }
  }
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  int v89 = 0;
  int v90 = v89 + v0;
  v1[v90] = v88;
  return;
}

kernel void kernel_main(device int* v91 [[buffer(0)]], device int* v92 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v93 = static_cast<int>(__simt_tid3.x);
  int v94 = 0;
  int v95 = v94 + v93;
  int v96 = v92[v95];
  int v97 = 4;
  int v98 = v97 + v93;
  int v99 = v92[v98];
  helper0(v93, v91, v96, v99, static_cast<int>(__simt_tid3.x));
  int v100 = 8;
  int v101 = v100 + v93;
  int v102 = v92[v101];
  int v103 = 0;
  bool v104 = v102 != v103;
  int v105;
  if (v104) {
    int v106 = 3;
    v105 = v106;
  } else {
    int v107 = 12;
    int v108 = v107 + v93;
    int v109 = v92[v108];
    int v110 = 4;
    int v111;
    v111 = v110;
    switch (v109) {
      default:
        {
        int v112 = 16;
        int v113 = v112 + v93;
        int v114 = v92[v113];
        int v115 = 0;
        int v116;
        v116 = v115;
        switch (v114) {
          case 0:
            {
            int v117 = 0;
            int v118 = v93 + v117;
            v116 = v118;
            break;
          }
          case 1:
            {
            int v119 = 3;
            int v120 = v93 + v119;
            v116 = v120;
            break;
          }
          default:
            {
            int v121 = 4;
            int v122 = v93 + v121;
            v116 = v122;
            break;
          }
        }
        bool v123 = true;
        v111 = v116;
      }
      case 0:
        {
        int v124 = 20;
        int v125 = v124 + v93;
        int v126 = v92[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        int v129;
        if (v128) {
          int v130 = 0;
          v129 = v130;
        } else {
          int v131 = 0;
          v129 = v131;
        }
        v111 = v129;
      }
      case 1:
        {
        int v132 = 24;
        int v133 = v132 + v93;
        int v134 = v92[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        int v137;
        if (v136) {
          int v138 = 2;
          v137 = v138;
        } else {
          v137 = v93;
        }
        v111 = v137;
      }
      case 2:
        {
        int v139 = 3;
        v111 = v139;
        break;
      }
    }
    bool v140 = true;
    v105 = v111;
  }
  int v141 = 16;
  int v142 = v141 + v93;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v91[v142] = v144;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 28; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
