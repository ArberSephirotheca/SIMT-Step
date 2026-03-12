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
  int v4 = 4;
  int v5 = v0 + v4;
  int v6 = 0;
  int v7;
  v7 = v6;
  switch (v3) {
    default:
      {
      int v8 = 0;
      int v9 = 0;
      int v10;
      int v11;
      v10 = v8;
      v11 = v9;
      while (true) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v13 + v14;
        bool v16 = v11 < v15;
        v10 = v10;
        v11 = v11;
        if (!v16) break;
        int v17 = 3;
        int v18 = v3 % v17;
        int v19 = 2;
        int v20;
        v20 = v19;
        switch (v18) {
          default:
            {
            int v21 = 1;
            int v22 = v0 + v21;
            v20 = v22;
            break;
          }
          case 0:
            {
            int v23 = 4;
            v20 = v23;
            break;
          }
          case 1:
            {
            v20 = v0;
            break;
          }
          case 2:
            {
            v20 = v0;
            break;
          }
        }
        int v24 = 1;
        int v25 = v11 + v24;
        v10 = v20;
        v11 = v25;
      }
      int v26 = 1;
      v7 = v10;
    }
    case 0:
      {
      int v27 = 4;
      v7 = v27;
      break;
    }
  }
  bool v28 = true;
  int v29 = simt_wave_count_bits(v28);
  int v30 = 0;
  int v31 = v30 + v0;
  v1[v31] = v29;
  int v32 = 0;
  bool v33 = v2 != v32;
  int v34 = v33 ? v5 : v7;
  return;
}

kernel void kernel_main(device int* v35 [[buffer(0)]], device int* v36 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v37 = static_cast<int>(__simt_tid3.x);
  int v38 = 0;
  int v39 = v38 + v37;
  int v40 = v36[v39];
  int v41 = 4;
  int v42 = v41 + v37;
  int v43 = v36[v42];
  helper0(v37, v35, v40, v43, static_cast<int>(__simt_tid3.x));
  int v44 = 0;
  int v45 = 0;
  int v46;
  int v47;
  v46 = v44;
  v47 = v45;
  while (true) {
    int v48 = 4;
    int v49 = v47 * v48;
    int v50 = v49 + v37;
    int v51 = 8;
    int v52 = v51 + v50;
    int v53 = v36[v52];
    int v54 = 0;
    bool v55 = v53 != v54;
    v46 = v46;
    v47 = v47;
    if (!v55) break;
    int v56 = v46 + v47;
    int v57 = 1;
    int v58 = v47 + v57;
    v46 = v56;
    v47 = v58;
  }
  bool v59 = true;
  int v60 = 16;
  int v61 = v60 + v37;
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  v35[v61] = v63;
  int v64 = 28;
  int v65 = v64 + v37;
  int v66 = v36[v65];
  int v67 = 3;
  int v68;
  v68 = v67;
  switch (v66) {
    default:
      {
      v68 = v37;
    }
    case 0:
      {
      int v69 = 32;
      int v70 = v69 + v37;
      int v71 = v36[v70];
      int v72 = 3;
      int v73;
      v73 = v72;
      switch (v71) {
        case 0:
          {
          int v74 = 0;
          int v75 = 0;
          int v76;
          int v77;
          v76 = v74;
          v77 = v75;
          while (true) {
            int v78 = 4;
            int v79 = v77 * v78;
            int v80 = v79 + v37;
            int v81 = 36;
            int v82 = v81 + v80;
            int v83 = v36[v82];
            int v84 = 0;
            bool v85 = v83 != v84;
            v76 = v76;
            v77 = v77;
            if (!v85) break;
            int v86 = v76 + v77;
            int v87 = 1;
            int v88 = v77 + v87;
            v76 = v86;
            v77 = v88;
          }
          bool v89 = true;
          v73 = v76;
          break;
        }
        case 1:
          {
          int v90 = 3;
          int v91 = v37 + v90;
          v73 = v91;
          break;
        }
        case 2:
          {
          v73 = v37;
          break;
        }
        default:
          {
          int v92 = 0;
          int v93 = 0;
          int v94;
          int v95;
          v94 = v92;
          v95 = v93;
          while (true) {
            int v96 = 4;
            int v97 = v95 * v96;
            int v98 = v97 + v37;
            int v99 = 56;
            int v100 = v99 + v98;
            int v101 = v36[v100];
            int v102 = 0;
            bool v103 = v101 != v102;
            v94 = v94;
            v95 = v95;
            if (!v103) break;
            int v104 = v94 + v95;
            int v105 = 1;
            int v106 = v95 + v105;
            v94 = v104;
            v95 = v106;
          }
          bool v107 = true;
          v73 = v94;
          break;
        }
      }
      bool v108 = true;
      v68 = v73;
    }
    case 1:
      {
      int v109 = 76;
      int v110 = v109 + v37;
      int v111 = v36[v110];
      int v112 = 1;
      int v113 = v37 + v112;
      int v114;
      v114 = v113;
      switch (v111) {
        default:
          {
          int v115 = 80;
          int v116 = v115 + v37;
          int v117 = v36[v116];
          int v118;
          v118 = v37;
          switch (v117) {
            case 0:
              {
              int v119 = 3;
              int v120 = v37 + v119;
              v118 = v120;
              break;
            }
            case 1:
              {
              v118 = v37;
              break;
            }
            default:
              {
              v118 = v37;
              break;
            }
          }
          bool v121 = true;
          v114 = v118;
          break;
        }
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
            int v128 = v127 + v37;
            int v129 = 84;
            int v130 = v129 + v128;
            int v131 = v36[v130];
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
          }
          bool v137 = true;
          v114 = v124;
          break;
        }
        case 1:
          {
          int v138 = 104;
          int v139 = v138 + v37;
          int v140 = v36[v139];
          int v141 = 1;
          int v142 = v37 + v141;
          int v143;
          v143 = v142;
          switch (v140) {
            case 0:
              {
              v143 = v37;
              break;
            }
            default:
              {
              v143 = v37;
              break;
            }
          }
          bool v144 = true;
          v114 = v143;
          break;
        }
        case 2:
          {
          int v145 = 108;
          int v146 = v145 + v37;
          int v147 = v36[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            v150 = v37;
          } else {
            int v151 = 3;
            v150 = v151;
          }
          v114 = v150;
          break;
        }
      }
      bool v152 = true;
      v68 = v114;
      break;
    }
  }
  bool v153 = true;
  int v154 = 32;
  int v155 = v154 + v37;
  bool v156 = true;
  int v157 = simt_wave_count_bits(v156);
  v35[v155] = v157;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
