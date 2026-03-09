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
  int v8 = 1;
  int v9;
  v9 = v8;
  switch (v3) {
    case 0:
      {
      int v10 = 3;
      v9 = v10;
    }
    default:
      {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 3;
      int v14 = v0 + v13;
      int v15;
      v15 = v14;
      switch (v12) {
        default:
          {
          int v16 = 0;
          int v17 = v0 + v16;
          v15 = v17;
          break;
        }
        case 0:
          {
          int v18 = 3;
          int v19 = v3 % v18;
          int v20 = 2;
          int v21 = v0 + v20;
          int v22;
          v22 = v21;
          switch (v19) {
            case 0:
              {
              v22 = v0;
              break;
            }
            case 1:
              {
              int v23 = 2;
              v22 = v23;
              break;
            }
            default:
              {
              int v24 = 2;
              v22 = v24;
              break;
            }
            case 2:
              {
              v22 = v0;
              break;
            }
          }
          v15 = v22;
          break;
        }
        case 1:
          {
          int v25 = 0;
          int v26 = 0;
          int v27;
          int v28;
          v27 = v25;
          v28 = v26;
          while (true) {
            int v29 = 4;
            int v30 = v3 % v29;
            int v31 = 1;
            int v32 = v30 + v31;
            bool v33 = v28 < v32;
            v27 = v27;
            v28 = v28;
            if (!v33) break;
            int v34 = 4;
            int v35 = v0 + v34;
            int v36 = 1;
            int v37 = v28 + v36;
            v27 = v35;
            v28 = v37;
            continue;
            ;
          }
          v15 = v27;
        }
        case 2:
          {
          int v38 = 0;
          bool v39 = v2 != v38;
          int v40;
          if (v39) {
            int v41 = 0;
            v40 = v41;
          } else {
            int v42 = 3;
            v40 = v42;
          }
          v15 = v40;
          break;
        }
      }
      v9 = v15;
      break;
    }
  }
  int v43 = 0;
  bool v44 = v2 != v43;
  int v45 = v44 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 3;
  int v56 = v48 + v55;
  uint v57 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v58 = (int)(v57);
  int v59 = 8;
  int v60 = v59 + v48;
  int v61 = v47[v60];
  int v62 = 1;
  int v63;
  v63 = v62;
  switch (v61) {
    case 0:
      {
      int v64 = 1;
      int v65 = v48 + v64;
      v63 = v65;
      break;
    }
    case 1:
      {
      int v66 = 12;
      int v67 = v66 + v48;
      int v68 = v47[v67];
      int v69 = 0;
      int v70;
      v70 = v69;
      switch (v68) {
        case 0:
          {
          int v71 = 0;
          int v72 = v48 + v71;
          v70 = v72;
          break;
        }
        case 1:
          {
          int v73 = 16;
          int v74 = v73 + v48;
          int v75 = v47[v74];
          int v76 = 0;
          bool v77 = v75 != v76;
          int v78;
          if (v77) {
            int v79 = 3;
            v78 = v79;
          } else {
            v78 = v48;
          }
          v70 = v78;
          break;
        }
        default:
          {
          int v80 = 0;
          int v81 = 0;
          int v82;
          int v83;
          v82 = v80;
          v83 = v81;
          while (true) {
            int v84 = 4;
            int v85 = v83 * v84;
            int v86 = v85 + v48;
            int v87 = 20;
            int v88 = v87 + v86;
            int v89 = v47[v88];
            int v90 = 0;
            bool v91 = v89 != v90;
            v82 = v82;
            v83 = v83;
            if (!v91) break;
            int v92 = v82 + v83;
            int v93 = 1;
            int v94 = v83 + v93;
            bool v95 = true;
            v82 = v92;
            v83 = v94;
          }
          v70 = v82;
          break;
        }
      }
      v63 = v70;
      break;
    }
    case 2:
      {
      int v96 = 40;
      int v97 = v96 + v48;
      int v98 = v47[v97];
      int v99 = 2;
      int v100;
      v100 = v99;
      switch (v98) {
        default:
          {
          int v101 = 44;
          int v102 = v101 + v48;
          int v103 = v47[v102];
          int v104 = 0;
          int v105 = v48 + v104;
          int v106;
          v106 = v105;
          switch (v103) {
            case 0:
              {
              v106 = v48;
              break;
            }
            default:
              {
              int v107 = 4;
              v106 = v107;
              break;
            }
          }
          v100 = v106;
          break;
        }
        case 0:
          {
          int v108 = 48;
          int v109 = v108 + v48;
          int v110 = v47[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          int v113;
          if (v112) {
            int v114 = 1;
            v113 = v114;
          } else {
            int v115 = 4;
            v113 = v115;
          }
          v100 = v113;
          break;
        }
      }
      v63 = v100;
      break;
    }
    default:
      {
      int v116 = 52;
      int v117 = v116 + v48;
      int v118 = v47[v117];
      int v119 = 0;
      bool v120 = v118 != v119;
      int v121;
      if (v120) {
        int v122 = 56;
        int v123 = v122 + v48;
        int v124 = v47[v123];
        int v125 = 0;
        bool v126 = v124 != v125;
        int v127;
        if (v126) {
          int v128 = 4;
          int v129 = v48 + v128;
          v127 = v129;
        } else {
          v127 = v48;
        }
        v121 = v127;
      } else {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v48;
          int v137 = 60;
          int v138 = v137 + v136;
          int v139 = v47[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          bool v145 = true;
          v132 = v142;
          v133 = v144;
        }
        v121 = v132;
      }
      v63 = v121;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
