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
      int v18 = 2;
      int v19 = v0 + v18;
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 0;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        default:
          {
          v20 = v0;
          break;
        }
      }
      bool v23 = true;
      int v24 = simt_wave_count_bits(v23);
      int v25 = 0;
      int v26 = 4;
      int v27 = v10 * v26;
      int v28 = v25 + v27;
      int v29 = v28 + v0;
      v1[v29] = v24;
      int v30 = 1;
      int v31 = v10 + v30;
      v9 = v20;
      v10 = v31;
      continue;
      ;
    }
    v6 = v9;
  } else {
    int v32 = 4;
    int v33 = v3 % v32;
    int v34 = 0;
    int v35 = v0 + v34;
    int v36;
    v36 = v35;
    switch (v33) {
      case 0:
        {
        int v37 = 0;
        int v38 = 0;
        int v39;
        int v40;
        v39 = v37;
        v40 = v38;
        while (true) {
          int v41 = 4;
          int v42 = v3 % v41;
          int v43 = 1;
          int v44 = v42 + v43;
          bool v45 = v40 < v44;
          v39 = v39;
          v40 = v40;
          if (!v45) break;
          int v46 = 2;
          int v47 = v0 + v46;
          int v48 = 1;
          int v49 = v40 + v48;
          v39 = v47;
          v40 = v49;
        }
        v36 = v39;
        break;
      }
      case 1:
        {
        int v50 = 2;
        int v51 = v0 + v50;
        v36 = v51;
        break;
      }
      case 2:
        {
        v36 = v0;
        break;
      }
      default:
        {
        int v52 = 3;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v0 + v54;
        int v56;
        v56 = v55;
        switch (v53) {
          case 0:
            {
            int v57 = 4;
            int v58 = v0 + v57;
            v56 = v58;
            break;
          }
          default:
            {
            int v59 = 3;
            v56 = v59;
            break;
          }
          case 1:
            {
            v56 = v0;
            break;
          }
        }
        v36 = v56;
        break;
      }
    }
    bool v60 = true;
    int v61 = simt_wave_count_bits(v60);
    int v62 = 16;
    int v63 = v62 + v0;
    v1[v63] = v61;
    v6 = v36;
  }
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  int v73 = 0;
  bool v74 = v69 != v73;
  if (v74) {
  } else {
    int v75 = 8;
    int v76 = v75 + v66;
    int v77 = v65[v76];
    int v78 = 0;
    bool v79 = v77 != v78;
    if (v79) {
      int v80 = 3;
      int v81 = v66 % v80;
      int v82 = 4;
      int v83 = v66 + v82;
      int v84;
      v84 = v83;
      switch (v81) {
        case 0:
          {
          int v85 = 2;
          int v86 = v84 + v85;
          v84 = v86;
          break;
        }
        default:
          {
          int v87 = 0;
          int v88 = v84 + v87;
          v84 = v88;
          break;
        }
        case 1:
          {
          int v89 = 0;
          int v90 = v84 + v89;
          v84 = v90;
          break;
        }
      }
      helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v91 = 12;
  int v92 = v91 + v66;
  int v93 = v65[v92];
  uint v94 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v95 = (int)(v94);
  int v96;
  v96 = v95;
  switch (v93) {
    case 0:
      {
      int v97 = 16;
      int v98 = v97 + v66;
      int v99 = v65[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v66;
          int v110 = 20;
          int v111 = v110 + v109;
          int v112 = v65[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          bool v118 = true;
          v105 = v115;
          v106 = v117;
          continue;
          ;
        }
        v102 = v105;
      } else {
        int v119 = 40;
        int v120 = v119 + v66;
        int v121 = v65[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          v124 = v66;
        } else {
          int v125 = 1;
          v124 = v125;
        }
        v102 = v124;
      }
      v96 = v102;
      break;
    }
    default:
      {
      int v126 = 44;
      int v127 = v126 + v66;
      int v128 = v65[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        v131 = v66;
      } else {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v66;
          int v139 = 48;
          int v140 = v139 + v138;
          int v141 = v65[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          bool v147 = true;
          v134 = v144;
          v135 = v146;
        }
        v131 = v134;
      }
      v96 = v131;
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
    static int32_t expected0[] = {};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 0; ++idx) {
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
