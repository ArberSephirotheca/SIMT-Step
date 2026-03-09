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
  int v5;
  v5 = v4;
  switch (v3) {
    default:
      {
      int v6 = 2;
      int v7 = v3 % v6;
      int v8;
      v8 = v0;
      switch (v7) {
        case 0:
          {
          int v9 = 2;
          v8 = v9;
          break;
        }
        default:
          {
          int v10 = 3;
          int v11 = v3 % v10;
          int v12 = 2;
          int v13;
          v13 = v12;
          switch (v11) {
            case 0:
              {
              v13 = v0;
              break;
            }
            case 1:
              {
              int v14 = 2;
              int v15 = v0 + v14;
              v13 = v15;
              break;
            }
            case 2:
              {
              v13 = v0;
              break;
            }
            default:
              {
              int v16 = 3;
              v13 = v16;
              break;
            }
          }
          int v17 = 1;
          int v18 = v0 + v17;
          v8 = v13;
          break;
        }
      }
      v5 = v8;
      break;
    }
    case 0:
      {
      int v19 = 0;
      bool v20 = v2 != v19;
      int v21;
      if (v20) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 4;
        int v25 = v0 + v24;
        int v26;
        v26 = v25;
        switch (v23) {
          case 0:
            {
            int v27 = 0;
            v26 = v27;
            break;
          }
          case 1:
            {
            int v28 = 0;
            v26 = v28;
            break;
          }
          case 2:
            {
            v26 = v0;
            break;
          }
          default:
            {
            v26 = v0;
            break;
          }
        }
        int v29 = 1;
        v21 = v26;
      } else {
        v21 = v0;
      }
      int v30 = 0;
      int v31 = v0 + v30;
      v5 = v21;
      break;
    }
  }
  bool v32 = true;
  int v33 = simt_wave_count_bits(v32);
  int v34 = 0;
  int v35 = v34 + v0;
  v1[v35] = v33;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  uint v45 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v46 = (int)(v45);
  int v47 = 8;
  int v48 = v47 + v38;
  int v49 = v37[v48];
  int v50 = 0;
  bool v51 = v49 != v50;
  int v52;
  if (v51) {
    int v53 = 12;
    int v54 = v53 + v38;
    int v55 = v37[v54];
    int v56 = 0;
    bool v57 = v55 != v56;
    int v58;
    if (v57) {
      int v59 = 16;
      int v60 = v59 + v38;
      int v61 = v37[v60];
      int v62 = 0;
      int v63 = v38 + v62;
      int v64;
      v64 = v63;
      switch (v61) {
        case 0:
          {
          v64 = v38;
          break;
        }
        case 1:
          {
          int v65 = 2;
          v64 = v65;
          break;
        }
        default:
          {
          int v66 = 4;
          v64 = v66;
          break;
        }
      }
      bool v67 = true;
      v58 = v64;
    } else {
      int v68 = 1;
      v58 = v68;
    }
    v52 = v58;
  } else {
    int v69 = 20;
    int v70 = v69 + v38;
    int v71 = v37[v70];
    uint v72 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v73 = (int)(v72);
    int v74;
    v74 = v73;
    switch (v71) {
      default:
        {
        int v75 = 24;
        int v76 = v75 + v38;
        int v77 = v37[v76];
        int v78 = 0;
        int v79;
        v79 = v78;
        switch (v77) {
          default:
            {
            int v80 = 1;
            int v81 = v38 + v80;
            v79 = v81;
            break;
          }
          case 0:
            {
            int v82 = 1;
            int v83 = v38 + v82;
            v79 = v83;
            break;
          }
          case 1:
            {
            int v84 = 1;
            int v85 = v38 + v84;
            v79 = v85;
            break;
          }
          case 2:
            {
            int v86 = 2;
            v79 = v86;
            break;
          }
        }
        bool v87 = true;
        v74 = v79;
        break;
      }
      case 0:
        {
        int v88 = 28;
        int v89 = v88 + v38;
        int v90 = v37[v89];
        int v91 = 1;
        int v92 = v38 + v91;
        int v93;
        v93 = v92;
        switch (v90) {
          default:
            {
            v93 = v38;
          }
          case 0:
            {
            v93 = v38;
            break;
          }
          case 1:
            {
            int v94 = 4;
            v93 = v94;
            break;
          }
        }
        bool v95 = true;
        v74 = v93;
      }
      case 1:
        {
        v74 = v38;
      }
      case 2:
        {
        int v96 = 32;
        int v97 = v96 + v38;
        int v98 = v37[v97];
        int v99;
        v99 = v38;
        switch (v98) {
          default:
            {
            int v100 = 1;
            int v101 = v38 + v100;
            v99 = v101;
          }
          case 0:
            {
            int v102 = 3;
            int v103 = v38 + v102;
            v99 = v103;
            break;
          }
          case 1:
            {
            int v104 = 2;
            v99 = v104;
          }
          case 2:
            {
            int v105 = 3;
            v99 = v105;
            break;
          }
        }
        bool v106 = true;
        v74 = v99;
        break;
      }
    }
    bool v107 = true;
    v52 = v74;
  }
  int v108 = 16;
  int v109 = v108 + v38;
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  v36[v109] = v111;
  int v112 = 36;
  int v113 = v112 + v38;
  int v114 = v37[v113];
  int v115 = 0;
  bool v116 = v114 != v115;
  int v117;
  if (v116) {
    int v118 = 40;
    int v119 = v118 + v38;
    int v120 = v37[v119];
    int v121;
    v121 = v38;
    switch (v120) {
      case 0:
        {
        int v122 = 0;
        int v123 = 0;
        int v124;
        int v125;
        v124 = v122;
        v125 = v123;
        while (true) {
          int v126 = 4;
          int v127 = v125 * v126;
          int v128 = v127 + v38;
          int v129 = 44;
          int v130 = v129 + v128;
          int v131 = v37[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          v124 = v124;
          v125 = v125;
          if (!v133) break;
          int v134 = v124 + v125;
          int v135 = 1;
          int v136 = v125 + v135;
          v124 = v134;
          v125 = v136;
          continue;
          ;
        }
        bool v137 = true;
        v121 = v124;
        break;
      }
      default:
        {
        int v138 = 64;
        int v139 = v138 + v38;
        int v140 = v37[v139];
        int v141;
        v141 = v38;
        switch (v140) {
          case 0:
            {
            int v142 = 0;
            int v143 = v38 + v142;
            v141 = v143;
            break;
          }
          default:
            {
            int v144 = 4;
            int v145 = v38 + v144;
            v141 = v145;
            break;
          }
          case 1:
            {
            int v146 = 4;
            v141 = v146;
            break;
          }
        }
        bool v147 = true;
        v121 = v141;
        break;
      }
      case 1:
        {
        int v148 = 1;
        v121 = v148;
        break;
      }
    }
    bool v149 = true;
    v117 = v121;
  } else {
    int v150 = 3;
    int v151 = v38 + v150;
    v117 = v151;
  }
  int v152 = 32;
  int v153 = v152 + v38;
  bool v154 = true;
  int v155 = simt_wave_count_bits(v154);
  v36[v153] = v155;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
