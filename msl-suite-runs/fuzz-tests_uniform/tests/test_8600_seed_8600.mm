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
        int v18 = 4;
        int v19 = v0 + v18;
        int v20 = 1;
        int v21 = v12 + v20;
        v11 = v19;
        v12 = v21;
      }
      int v22 = 0;
      int v23 = v0 + v22;
      v8 = v11;
    }
    case 1:
      {
      v8 = v0;
    }
    default:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        int v27 = 2;
        int v28 = v0 + v27;
        int v29;
        v29 = v28;
        switch (v3) {
          default:
            {
            int v30 = 1;
            v29 = v30;
            break;
          }
          case 0:
            {
            int v31 = 1;
            int v32 = v0 + v31;
            v29 = v32;
            break;
          }
        }
        int v33 = 3;
        v26 = v29;
      } else {
        int v34 = 0;
        bool v35 = v2 != v34;
        int v36;
        if (v35) {
          int v37 = 1;
          v36 = v37;
        } else {
          v36 = v0;
        }
        int v38 = 0;
        int v39 = v0 + v38;
        v26 = v36;
      }
      int v40 = 1;
      v8 = v26;
      break;
    }
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  uint v57 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v58 = (int)(v57);
  int v59;
  v59 = v58;
  switch (v56) {
    case 0:
      {
      int v60 = 0;
      int v61 = 0;
      int v62;
      int v63;
      v62 = v60;
      v63 = v61;
      while (true) {
        int v64 = 4;
        int v65 = v63 * v64;
        int v66 = v65 + v47;
        int v67 = 12;
        int v68 = v67 + v66;
        int v69 = v46[v68];
        int v70 = 0;
        bool v71 = v69 != v70;
        v62 = v62;
        v63 = v63;
        if (!v71) break;
        int v72 = 2;
        int v73 = v47 + v72;
        int v74 = v62 + v73;
        int v75 = 1;
        int v76 = v63 + v75;
        v62 = v74;
        v63 = v76;
      }
      bool v77 = true;
      v59 = v62;
    }
    case 1:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v81 * v82;
        int v84 = v83 + v47;
        int v85 = 32;
        int v86 = v85 + v84;
        int v87 = v46[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        v80 = v80;
        v81 = v81;
        if (!v89) break;
        int v90 = 52;
        int v91 = v90 + v47;
        int v92 = v46[v91];
        int v93;
        v93 = v47;
        switch (v92) {
          case 0:
            {
            v93 = v47;
            break;
          }
          case 1:
            {
            int v94 = 2;
            int v95 = v47 + v94;
            v93 = v95;
            break;
          }
          default:
            {
            int v96 = 4;
            v93 = v96;
            break;
          }
          case 2:
            {
            int v97 = 1;
            int v98 = v47 + v97;
            v93 = v98;
            break;
          }
        }
        bool v99 = true;
        int v100 = v80 + v93;
        int v101 = 1;
        int v102 = v81 + v101;
        v80 = v100;
        v81 = v102;
      }
      bool v103 = true;
      v59 = v80;
      break;
    }
    default:
      {
      int v104 = 56;
      int v105 = v104 + v47;
      int v106 = v46[v105];
      int v107 = 1;
      int v108;
      v108 = v107;
      switch (v106) {
        case 0:
          {
          int v109 = 0;
          int v110 = 0;
          int v111;
          int v112;
          v111 = v109;
          v112 = v110;
          while (true) {
            int v113 = 4;
            int v114 = v112 * v113;
            int v115 = v114 + v47;
            int v116 = 60;
            int v117 = v116 + v115;
            int v118 = v46[v117];
            int v119 = 0;
            bool v120 = v118 != v119;
            v111 = v111;
            v112 = v112;
            if (!v120) break;
            int v121 = v111 + v112;
            int v122 = 1;
            int v123 = v112 + v122;
            v111 = v121;
            v112 = v123;
            break;
            ;
          }
          bool v124 = true;
          v108 = v111;
        }
        default:
          {
          int v125 = 0;
          int v126 = 0;
          int v127;
          int v128;
          v127 = v125;
          v128 = v126;
          while (true) {
            int v129 = 4;
            int v130 = v128 * v129;
            int v131 = v130 + v47;
            int v132 = 80;
            int v133 = v132 + v131;
            int v134 = v46[v133];
            int v135 = 0;
            bool v136 = v134 != v135;
            v127 = v127;
            v128 = v128;
            if (!v136) break;
            int v137 = v127 + v128;
            int v138 = 1;
            int v139 = v128 + v138;
            v127 = v137;
            v128 = v139;
          }
          bool v140 = true;
          v108 = v127;
          break;
        }
      }
      bool v141 = true;
      v59 = v108;
      break;
    }
  }
  bool v142 = true;
  int v143 = 16;
  int v144 = v143 + v47;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v45[v144] = v146;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
