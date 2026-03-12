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
      int v16 = 3;
      int v17 = v3 % v16;
      int v18 = 3;
      int v19;
      v19 = v18;
      switch (v17) {
        case 0:
          {
          int v20 = 3;
          v19 = v20;
        }
        case 1:
          {
          int v21 = 0;
          v19 = v21;
          break;
        }
        default:
          {
          int v22 = 0;
          v19 = v22;
          break;
        }
      }
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v19;
      v10 = v24;
    }
    v6 = v9;
  } else {
    bool v25 = true;
    int v26 = simt_wave_count_bits(v25);
    int v27 = 0;
    int v28 = v27 + v0;
    v1[v28] = v26;
    v6 = v26;
  }
  return;
}

kernel void kernel_main(device int* v29 [[buffer(0)]], device int* v30 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v31 = static_cast<int>(__simt_tid3.x);
  int v32 = 0;
  int v33 = v32 + v31;
  int v34 = v30[v33];
  int v35 = 4;
  int v36 = v35 + v31;
  int v37 = v30[v36];
  helper0(v31, v29, v34, v37, static_cast<int>(__simt_tid3.x));
  uint v38 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v39 = (int)(v38);
  int v40 = 8;
  int v41 = v40 + v31;
  int v42 = v30[v41];
  int v43 = 0;
  bool v44 = v42 != v43;
  int v45;
  if (v44) {
    uint v46 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v47 = (int)(v46);
    v45 = v47;
  } else {
    int v48 = 12;
    int v49 = v48 + v31;
    int v50 = v30[v49];
    int v51 = 4;
    int v52 = v31 + v51;
    int v53;
    v53 = v52;
    switch (v50) {
      default:
        {
        int v54 = 4;
        int v55 = v31 + v54;
        v53 = v55;
        break;
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
          int v61 = v59 * v60;
          int v62 = v61 + v31;
          int v63 = 16;
          int v64 = v63 + v62;
          int v65 = v30[v64];
          int v66 = 0;
          bool v67 = v65 != v66;
          v58 = v58;
          v59 = v59;
          if (!v67) break;
          int v68 = v58 + v59;
          int v69 = 1;
          int v70 = v59 + v69;
          bool v71 = true;
          v58 = v68;
          v59 = v70;
        }
        v53 = v58;
        break;
      }
    }
    v45 = v53;
  }
  int v72 = 16;
  int v73 = v72 + v31;
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  v29[v73] = v75;
  int v76 = 36;
  int v77 = v76 + v31;
  int v78 = v30[v77];
  uint v79 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v80 = (int)(v79);
  int v81;
  v81 = v80;
  switch (v78) {
    case 0:
      {
      int v82 = 40;
      int v83 = v82 + v31;
      int v84 = v30[v83];
      int v85 = 3;
      int v86 = v31 + v85;
      int v87;
      v87 = v86;
      switch (v84) {
        case 0:
          {
          int v88 = 44;
          int v89 = v88 + v31;
          int v90 = v30[v89];
          int v91;
          v91 = v31;
          switch (v90) {
            case 0:
              {
              int v92 = 4;
              v91 = v92;
              break;
            }
            default:
              {
              v91 = v31;
              break;
            }
          }
          bool v93 = true;
          v87 = v91;
        }
        case 1:
          {
          v87 = v31;
          break;
        }
        default:
          {
          int v94 = 3;
          int v95 = v31 + v94;
          v87 = v95;
          break;
        }
        case 2:
          {
          v87 = v31;
          break;
        }
      }
      v81 = v87;
      break;
    }
    default:
      {
      int v96 = 0;
      v81 = v96;
      break;
    }
    case 1:
      {
      int v97 = 48;
      int v98 = v97 + v31;
      int v99 = v30[v98];
      int v100 = 4;
      int v101;
      v101 = v100;
      switch (v99) {
        case 0:
          {
          int v102 = 0;
          int v103 = 0;
          int v104;
          int v105;
          v104 = v102;
          v105 = v103;
          while (true) {
            int v106 = 4;
            int v107 = v105 * v106;
            int v108 = v107 + v31;
            int v109 = 52;
            int v110 = v109 + v108;
            int v111 = v30[v110];
            int v112 = 0;
            bool v113 = v111 != v112;
            v104 = v104;
            v105 = v105;
            if (!v113) break;
            int v114 = v104 + v105;
            int v115 = 1;
            int v116 = v105 + v115;
            bool v117 = true;
            v104 = v114;
            v105 = v116;
            break;
            ;
          }
          v101 = v104;
          break;
        }
        default:
          {
          int v118 = 72;
          int v119 = v118 + v31;
          int v120 = v30[v119];
          int v121 = 0;
          bool v122 = v120 != v121;
          int v123;
          if (v122) {
            int v124 = 3;
            v123 = v124;
          } else {
            int v125 = 3;
            int v126 = v31 + v125;
            v123 = v126;
          }
          v101 = v123;
          break;
        }
      }
      v81 = v101;
      break;
    }
    case 2:
      {
      int v127 = 76;
      int v128 = v127 + v31;
      int v129 = v30[v128];
      int v130 = 0;
      bool v131 = v129 != v130;
      int v132;
      if (v131) {
        int v133 = 80;
        int v134 = v133 + v31;
        int v135 = v30[v134];
        int v136 = 0;
        bool v137 = v135 != v136;
        int v138;
        if (v137) {
          int v139 = 4;
          v138 = v139;
        } else {
          int v140 = 4;
          int v141 = v31 + v140;
          v138 = v141;
        }
        v132 = v138;
      } else {
        int v142 = 84;
        int v143 = v142 + v31;
        int v144 = v30[v143];
        int v145 = 3;
        int v146 = v31 + v145;
        int v147;
        v147 = v146;
        switch (v144) {
          case 0:
            {
            v147 = v31;
            break;
          }
          default:
            {
            int v148 = 2;
            v147 = v148;
          }
          case 1:
            {
            int v149 = 1;
            v147 = v149;
          }
          case 2:
            {
            v147 = v31;
            break;
          }
        }
        bool v150 = true;
        v132 = v147;
      }
      v81 = v132;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
