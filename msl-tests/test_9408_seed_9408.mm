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
  int v4 = 1;
  int v5 = v0 + v4;
  int v6 = 2;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v3) {
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
          int v22 = v0 + v21;
          v20 = v22;
        }
        int v23 = 1;
        int v24 = v12 + v23;
        v11 = v20;
        v12 = v24;
      }
      int v25 = 1;
      int v26 = v0 + v25;
      v8 = v11;
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
        int v36 = 3;
        int v37 = v3 % v36;
        int v38 = 1;
        int v39 = v0 + v38;
        int v40;
        v40 = v39;
        switch (v37) {
          case 0:
            {
            int v41 = 0;
            v40 = v41;
            break;
          }
          case 1:
            {
            v40 = v0;
            break;
          }
          default:
            {
            v40 = v0;
            break;
          }
          case 2:
            {
            int v42 = 1;
            int v43 = v0 + v42;
            v40 = v43;
            break;
          }
        }
        int v44 = 4;
        int v45 = v0 + v44;
        int v46 = 1;
        int v47 = v30 + v46;
        v29 = v40;
        v30 = v47;
      }
      v8 = v29;
      break;
    }
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  int v52 = 0;
  bool v53 = v2 != v52;
  int v54 = v53 ? v5 : v8;
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
  int v67;
  v67 = v57;
  switch (v66) {
    default:
      {
      int v68 = 0;
      int v69 = 0;
      int v70;
      int v71;
      v70 = v68;
      v71 = v69;
      while (true) {
        int v72 = 4;
        int v73 = v71 * v72;
        int v74 = v73 + v57;
        int v75 = 12;
        int v76 = v75 + v74;
        int v77 = v56[v76];
        int v78 = 0;
        bool v79 = v77 != v78;
        v70 = v70;
        v71 = v71;
        if (!v79) break;
        int v80 = 32;
        int v81 = v80 + v57;
        int v82 = v56[v81];
        int v83 = 3;
        int v84;
        v84 = v83;
        switch (v82) {
          default:
            {
            int v85 = 3;
            int v86 = v57 + v85;
            v84 = v86;
          }
          case 0:
            {
            v84 = v57;
            break;
          }
        }
        bool v87 = true;
        int v88 = v70 + v84;
        int v89 = 1;
        int v90 = v71 + v89;
        v70 = v88;
        v71 = v90;
      }
      bool v91 = true;
      v67 = v70;
      break;
    }
    case 0:
      {
      int v92 = 36;
      int v93 = v92 + v57;
      int v94 = v56[v93];
      int v95 = 0;
      bool v96 = v94 != v95;
      int v97;
      if (v96) {
        int v98 = 0;
        v97 = v98;
      } else {
        int v99 = 40;
        int v100 = v99 + v57;
        int v101 = v56[v100];
        int v102;
        v102 = v57;
        switch (v101) {
          case 0:
            {
            int v103 = 4;
            int v104 = v57 + v103;
            v102 = v104;
          }
          default:
            {
            v102 = v57;
            break;
          }
          case 1:
            {
            int v105 = 1;
            int v106 = v57 + v105;
            v102 = v106;
            break;
          }
        }
        bool v107 = true;
        v97 = v102;
      }
      v67 = v97;
      break;
    }
  }
  bool v108 = true;
  int v109 = 16;
  int v110 = v109 + v57;
  bool v111 = true;
  int v112 = simt_wave_count_bits(v111);
  v55[v110] = v112;
  int v113 = 44;
  int v114 = v113 + v57;
  int v115 = v56[v114];
  int v116 = 4;
  int v117 = v57 + v116;
  int v118;
  v118 = v117;
  switch (v115) {
    case 0:
      {
      int v119 = 48;
      int v120 = v119 + v57;
      int v121 = v56[v120];
      int v122 = 2;
      int v123 = v57 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        default:
          {
          int v125 = 52;
          int v126 = v125 + v57;
          int v127 = v56[v126];
          int v128 = 4;
          int v129;
          v129 = v128;
          switch (v127) {
            case 0:
              {
              int v130 = 4;
              int v131 = v57 + v130;
              v129 = v131;
              break;
            }
            case 1:
              {
              int v132 = 3;
              int v133 = v57 + v132;
              v129 = v133;
              break;
            }
            case 2:
              {
              int v134 = 2;
              v129 = v134;
              break;
            }
            default:
              {
              v129 = v57;
              break;
            }
          }
          bool v135 = true;
          v124 = v129;
          break;
        }
        case 0:
          {
          int v136 = 56;
          int v137 = v136 + v57;
          int v138 = v56[v137];
          int v139 = 0;
          bool v140 = v138 != v139;
          int v141;
          if (v140) {
            int v142 = 0;
            v141 = v142;
          } else {
            int v143 = 2;
            int v144 = v57 + v143;
            v141 = v144;
          }
          v124 = v141;
          break;
        }
      }
      bool v145 = true;
      v118 = v124;
      break;
    }
    default:
      {
      int v146 = 2;
      v118 = v146;
      break;
    }
    case 1:
      {
      v118 = v57;
      break;
    }
  }
  bool v147 = true;
  int v148 = 32;
  int v149 = v148 + v57;
  bool v150 = true;
  int v151 = simt_wave_count_bits(v150);
  v55[v149] = v151;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 60; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
