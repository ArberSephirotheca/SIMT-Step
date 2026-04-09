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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9;
      v9 = v0;
      switch (v8) {
        default:
          {
          int v10 = 0;
          int v11 = 0;
          int v12;
          int v13;
          v12 = v10;
          v13 = v11;
          while (true) {
            int v14 = 4;
            int v15 = v3 % v14;
            int v16 = 1;
            int v17 = v15 + v16;
            bool v18 = v13 < v17;
            v12 = v12;
            v13 = v13;
            if (!v18) break;
            int v19 = 0;
            int v20 = 1;
            int v21 = v13 + v20;
            v12 = v19;
            v13 = v21;
            break;
            ;
          }
          int v22 = 3;
          int v23 = v0 + v22;
          v9 = v12;
          break;
        }
        case 0:
          {
          v9 = v0;
          break;
        }
        case 1:
          {
          int v24 = 0;
          int v25 = v0 + v24;
          v9 = v25;
          break;
        }
        case 2:
          {
          int v26 = 0;
          bool v27 = v2 != v26;
          int v28;
          if (v27) {
            int v29 = 4;
            v28 = v29;
          } else {
            v28 = v0;
          }
          int v30 = 3;
          v9 = v28;
          break;
        }
      }
      int v31 = 0;
      int v32 = v0 + v31;
      v6 = v9;
      break;
    }
    default:
      {
      int v33 = 2;
      int v34 = v3 % v33;
      int v35 = 1;
      int v36;
      v36 = v35;
      switch (v34) {
        default:
          {
          v36 = v0;
          break;
        }
        case 0:
          {
          int v37 = 3;
          int v38 = v3 % v37;
          int v39;
          v39 = v0;
          switch (v38) {
            case 0:
              {
              v39 = v0;
              break;
            }
            default:
              {
              int v40 = 4;
              v39 = v40;
            }
            case 1:
              {
              v39 = v0;
            }
            case 2:
              {
              v39 = v0;
              break;
            }
          }
          int v41 = 2;
          v36 = v39;
          break;
        }
      }
      int v42 = 0;
      int v43 = v0 + v42;
      v6 = v36;
      break;
    }
    case 1:
      {
      int v44 = 0;
      int v45 = 0;
      int v46;
      int v47;
      v46 = v44;
      v47 = v45;
      while (true) {
        int v48 = 4;
        int v49 = v3 % v48;
        int v50 = 1;
        int v51 = v49 + v50;
        bool v52 = v47 < v51;
        v46 = v46;
        v47 = v47;
        if (!v52) break;
        int v53 = 3;
        int v54 = v3 % v53;
        int v55 = 0;
        int v56 = v0 + v55;
        int v57;
        v57 = v56;
        switch (v54) {
          case 0:
            {
            v57 = v0;
            break;
          }
          case 1:
            {
            v57 = v0;
            break;
          }
          default:
            {
            v57 = v0;
            break;
          }
        }
        int v58 = 0;
        int v59 = v0 + v58;
        int v60 = 1;
        int v61 = v47 + v60;
        v46 = v57;
        v47 = v61;
      }
      int v62 = 1;
      v6 = v46;
      break;
    }
  }
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  int v65 = 0;
  int v66 = v65 + v0;
  v1[v66] = v64;
  return;
}

kernel void kernel_main(device int* v67 [[buffer(0)]], device int* v68 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v69 = static_cast<int>(__simt_tid3.x);
  int v70 = 0;
  int v71 = v70 + v69;
  int v72 = v68[v71];
  int v73 = 4;
  int v74 = v73 + v69;
  int v75 = v68[v74];
  helper0(v69, v67, v72, v75, static_cast<int>(__simt_tid3.x));
  int v76 = 8;
  int v77 = v76 + v69;
  int v78 = v68[v77];
  int v79 = 2;
  int v80;
  v80 = v79;
  switch (v78) {
    case 0:
      {
      int v81 = 12;
      int v82 = v81 + v69;
      int v83 = v68[v82];
      int v84 = 4;
      int v85 = v69 + v84;
      int v86;
      v86 = v85;
      switch (v83) {
        case 0:
          {
          int v87 = 0;
          int v88 = 0;
          int v89;
          int v90;
          v89 = v87;
          v90 = v88;
          while (true) {
            int v91 = 4;
            int v92 = v90 * v91;
            int v93 = v92 + v69;
            int v94 = 16;
            int v95 = v94 + v93;
            int v96 = v68[v95];
            int v97 = 0;
            bool v98 = v96 != v97;
            v89 = v89;
            v90 = v90;
            if (!v98) break;
            int v99 = v89 + v90;
            int v100 = 1;
            int v101 = v90 + v100;
            v89 = v99;
            v90 = v101;
          }
          bool v102 = true;
          v86 = v89;
        }
        default:
          {
          int v103 = 3;
          v86 = v103;
          break;
        }
      }
      bool v104 = true;
      v80 = v86;
    }
    default:
      {
      int v105 = 1;
      v80 = v105;
      break;
    }
  }
  bool v106 = true;
  int v107 = 16;
  int v108 = v107 + v69;
  bool v109 = true;
  int v110 = simt_wave_count_bits(v109);
  v67[v108] = v110;
  int v111 = 0;
  int v112 = 0;
  int v113;
  int v114;
  v113 = v111;
  v114 = v112;
  while (true) {
    int v115 = 4;
    int v116 = v114 * v115;
    int v117 = v116 + v69;
    int v118 = 36;
    int v119 = v118 + v117;
    int v120 = v68[v119];
    int v121 = 0;
    bool v122 = v120 != v121;
    v113 = v113;
    v114 = v114;
    if (!v122) break;
    int v123 = v113 + v114;
    int v124 = 1;
    int v125 = v114 + v124;
    v113 = v123;
    v114 = v125;
    continue;
    ;
  }
  bool v126 = true;
  int v127 = 32;
  int v128 = v127 + v69;
  bool v129 = true;
  int v130 = simt_wave_count_bits(v129);
  v67[v128] = v130;
  int v131 = 0;
  int v132 = 0;
  int v133;
  int v134;
  v133 = v131;
  v134 = v132;
  while (true) {
    int v135 = 4;
    int v136 = v134 * v135;
    int v137 = v136 + v69;
    int v138 = 56;
    int v139 = v138 + v137;
    int v140 = v68[v139];
    int v141 = 0;
    bool v142 = v140 != v141;
    v133 = v133;
    v134 = v134;
    if (!v142) break;
    int v143 = v133 + v134;
    int v144 = 1;
    int v145 = v134 + v144;
    v133 = v143;
    v134 = v145;
  }
  bool v146 = true;
  int v147 = 48;
  int v148 = v147 + v69;
  bool v149 = true;
  int v150 = simt_wave_count_bits(v149);
  v67[v148] = v150;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
