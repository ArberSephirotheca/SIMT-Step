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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
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
        int v18 = 4;
        int v19 = v0 + v18;
        int v20 = 1;
        int v21 = v12 + v20;
        v11 = v19;
        v12 = v21;
      }
      int v22 = 2;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v23 = 4;
      int v24 = v3 % v23;
      int v25 = 4;
      int v26;
      v26 = v25;
      switch (v24) {
        case 0:
          {
          v26 = v0;
          break;
        }
        default:
          {
          int v27 = 0;
          int v28 = 0;
          int v29;
          int v30;
          v29 = v27;
          v30 = v28;
          while (true) {
            int v31 = 4;
            int v32 = v3 % v31;
            int v33 = 1;
            int v34 = v32 + v33;
            bool v35 = v30 < v34;
            v29 = v29;
            v30 = v30;
            if (!v35) break;
            int v36 = 4;
            int v37 = v0 + v36;
            int v38 = 1;
            int v39 = v30 + v38;
            v29 = v37;
            v30 = v39;
            continue;
            ;
          }
          int v40 = 0;
          int v41 = v0 + v40;
          v26 = v29;
          break;
        }
        case 1:
          {
          int v42 = 4;
          v26 = v42;
          break;
        }
        case 2:
          {
          int v43 = 4;
          int v44 = v0 + v43;
          int v45;
          v45 = v44;
          switch (v3) {
            case 0:
              {
              int v46 = 1;
              int v47 = v0 + v46;
              v45 = v47;
            }
            default:
              {
              v45 = v0;
              break;
            }
          }
          v26 = v45;
          break;
        }
      }
      int v48 = 1;
      v8 = v26;
      break;
    }
    default:
      {
      int v49 = 0;
      v8 = v49;
      break;
    }
    case 2:
      {
      int v50 = 1;
      v8 = v50;
      break;
    }
  }
  bool v51 = true;
  int v52 = simt_wave_count_bits(v51);
  int v53 = 0;
  int v54 = v53 + v0;
  v1[v54] = v52;
  return;
}

kernel void kernel_main(device int* v55 [[buffer(0)]], device int* v56 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v57 = static_cast<int>(__simt_tid3.x);
  int v58 = 0;
  int v59 = v58 + v57;
  int v60 = v56[v59];
  int v61 = 4;
  int v62 = v61 + v57;
  int v63 = v56[v62];
  helper0(v57, v55, v60, v63, static_cast<int>(__simt_tid3.x));
  int v64 = 8;
  int v65 = v64 + v57;
  int v66 = v56[v65];
  int v67 = 0;
  bool v68 = v66 != v67;
  int v69;
  if (v68) {
    int v70 = 12;
    int v71 = v70 + v57;
    int v72 = v56[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    int v75;
    if (v74) {
      int v76 = 16;
      int v77 = v76 + v57;
      int v78 = v56[v77];
      int v79 = 0;
      bool v80 = v78 != v79;
      int v81;
      if (v80) {
        int v82 = 3;
        int v83 = v57 + v82;
        v81 = v83;
      } else {
        uint v84 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v85 = (int)(v84);
        v81 = v85;
      }
      v75 = v81;
    } else {
      int v86 = 0;
      int v87 = 0;
      int v88;
      int v89;
      v88 = v86;
      v89 = v87;
      while (true) {
        int v90 = 4;
        int v91 = v89 * v90;
        int v92 = v91 + v57;
        int v93 = 20;
        int v94 = v93 + v92;
        int v95 = v56[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        v88 = v88;
        v89 = v89;
        if (!v97) break;
        int v98 = v88 + v89;
        int v99 = 1;
        int v100 = v89 + v99;
        v88 = v98;
        v89 = v100;
      }
      bool v101 = true;
      v75 = v88;
    }
    v69 = v75;
  } else {
    int v102 = 40;
    int v103 = v102 + v57;
    int v104 = v56[v103];
    int v105 = 4;
    int v106 = v57 + v105;
    int v107;
    v107 = v106;
    switch (v104) {
      default:
        {
        int v108 = 44;
        int v109 = v108 + v57;
        int v110 = v56[v109];
        int v111 = 0;
        bool v112 = v110 != v111;
        int v113;
        if (v112) {
          int v114 = 2;
          int v115 = v57 + v114;
          v113 = v115;
        } else {
          int v116 = 3;
          v113 = v116;
        }
        v107 = v113;
      }
      case 0:
        {
        int v117 = 48;
        int v118 = v117 + v57;
        int v119 = v56[v118];
        int v120 = 4;
        int v121;
        v121 = v120;
        switch (v119) {
          default:
            {
            int v122 = 3;
            v121 = v122;
            break;
          }
          case 0:
            {
            int v123 = 1;
            int v124 = v57 + v123;
            v121 = v124;
            break;
          }
          case 1:
            {
            v121 = v57;
            break;
          }
          case 2:
            {
            int v125 = 4;
            int v126 = v57 + v125;
            v121 = v126;
            break;
          }
        }
        bool v127 = true;
        v107 = v121;
      }
      case 1:
        {
        int v128 = 52;
        int v129 = v128 + v57;
        int v130 = v56[v129];
        int v131 = 0;
        int v132 = v57 + v131;
        int v133;
        v133 = v132;
        switch (v130) {
          default:
            {
            int v134 = 2;
            int v135 = v57 + v134;
            v133 = v135;
            break;
          }
          case 0:
            {
            int v136 = 2;
            int v137 = v57 + v136;
            v133 = v137;
            break;
          }
        }
        bool v138 = true;
        v107 = v133;
        break;
      }
    }
    bool v139 = true;
    v69 = v107;
  }
  int v140 = 16;
  int v141 = v140 + v57;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v55[v141] = v143;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 56; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
