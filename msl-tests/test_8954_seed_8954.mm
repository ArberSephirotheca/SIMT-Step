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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 2;
      int v9 = v3 % v8;
      int v10 = 3;
      int v11 = v0 + v10;
      int v12;
      v12 = v11;
      switch (v9) {
        default:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
          }
          int v24 = 1;
          int v25 = v0 + v24;
          v12 = v15;
          break;
        }
        case 0:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 2;
            int v36 = v0 + v35;
            int v37 = 1;
            int v38 = v29 + v37;
            v28 = v36;
            v29 = v38;
            break;
            ;
          }
          v12 = v28;
          break;
        }
        case 1:
          {
          int v39 = 3;
          int v40 = v3 % v39;
          int v41 = 3;
          int v42 = v0 + v41;
          int v43;
          v43 = v42;
          switch (v40) {
            case 0:
              {
              v43 = v0;
              break;
            }
            case 1:
              {
              v43 = v0;
            }
            default:
              {
              int v44 = 0;
              int v45 = v0 + v44;
              v43 = v45;
            }
            case 2:
              {
              int v46 = 1;
              v43 = v46;
              break;
            }
          }
          int v47 = 3;
          int v48 = v0 + v47;
          v12 = v43;
          break;
        }
      }
      int v49 = 1;
      v7 = v12;
      break;
    }
    default:
      {
      int v50 = 0;
      int v51 = 0;
      int v52;
      int v53;
      v52 = v50;
      v53 = v51;
      while (true) {
        int v54 = 4;
        int v55 = v3 % v54;
        int v56 = 1;
        int v57 = v55 + v56;
        bool v58 = v53 < v57;
        v52 = v52;
        v53 = v53;
        if (!v58) break;
        int v59 = 0;
        bool v60 = v2 != v59;
        int v61;
        if (v60) {
          int v62 = 4;
          v61 = v62;
        } else {
          int v63 = 1;
          v61 = v63;
        }
        int v64 = 4;
        int v65 = v0 + v64;
        int v66 = 1;
        int v67 = v53 + v66;
        v52 = v61;
        v53 = v67;
        break;
        ;
      }
      int v68 = 3;
      int v69 = v0 + v68;
      v7 = v52;
      break;
    }
    case 1:
      {
      int v70 = 0;
      int v71 = 0;
      int v72;
      int v73;
      v72 = v70;
      v73 = v71;
      while (true) {
        int v74 = 4;
        int v75 = v3 % v74;
        int v76 = 1;
        int v77 = v75 + v76;
        bool v78 = v73 < v77;
        v72 = v72;
        v73 = v73;
        if (!v78) break;
        int v79 = 1;
        int v80 = v73 + v79;
        v72 = v0;
        v73 = v80;
        continue;
        ;
      }
      int v81 = 0;
      v7 = v72;
      break;
    }
    case 2:
      {
      int v82 = 3;
      v7 = v82;
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
  uint v96 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98 = 8;
  int v99 = v98 + v89;
  int v100 = v88[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    int v104 = 12;
    int v105 = v104 + v89;
    int v106 = v88[v105];
    uint v107 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v108 = (int)(v107);
    int v109;
    v109 = v108;
    switch (v106) {
      case 0:
        {
        int v110 = 16;
        int v111 = v110 + v89;
        int v112 = v88[v111];
        int v113 = 0;
        int v114;
        v114 = v113;
        switch (v112) {
          case 0:
            {
            int v115 = 1;
            int v116 = v89 + v115;
            v114 = v116;
          }
          default:
            {
            int v117 = 2;
            int v118 = v89 + v117;
            v114 = v118;
            break;
          }
          case 1:
            {
            int v119 = 0;
            v114 = v119;
            break;
          }
        }
        bool v120 = true;
        v109 = v114;
      }
      default:
        {
        int v121 = 0;
        int v122 = 0;
        int v123;
        int v124;
        v123 = v121;
        v124 = v122;
        while (true) {
          int v125 = 4;
          int v126 = v124 * v125;
          int v127 = v126 + v89;
          int v128 = 20;
          int v129 = v128 + v127;
          int v130 = v88[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          v123 = v123;
          v124 = v124;
          if (!v132) break;
          int v133 = v123 + v124;
          int v134 = 1;
          int v135 = v124 + v134;
          v123 = v133;
          v124 = v135;
          continue;
          ;
        }
        bool v136 = true;
        v109 = v123;
        break;
      }
    }
    bool v137 = true;
    v103 = v109;
  } else {
    int v138 = 3;
    int v139 = v89 + v138;
    v103 = v139;
  }
  int v140 = 16;
  int v141 = v140 + v89;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v87[v141] = v143;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
