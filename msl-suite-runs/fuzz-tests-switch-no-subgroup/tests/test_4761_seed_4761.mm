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
  int v8 = 4;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
      v12 = v0;
      break;
    }
    case 0:
      {
      int v13 = 2;
      int v14 = v3 % v13;
      int v15 = 0;
      int v16 = v0 + v15;
      int v17;
      v17 = v16;
      switch (v14) {
        case 0:
          {
          int v18 = 4;
          v17 = v18;
        }
        case 1:
          {
          v17 = v0;
          break;
        }
        default:
          {
          int v19 = 0;
          bool v20 = v2 != v19;
          int v21;
          if (v20) {
            int v22 = 0;
            int v23 = v0 + v22;
            v21 = v23;
          } else {
            int v24 = 1;
            v21 = v24;
          }
          v17 = v21;
          break;
        }
      }
      v12 = v17;
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
        int v34 = 0;
        int v35 = 0;
        int v36;
        int v37;
        v36 = v34;
        v37 = v35;
        while (true) {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v39 + v40;
          bool v42 = v37 < v41;
          v36 = v36;
          v37 = v37;
          if (!v42) break;
          int v43 = 1;
          int v44 = v37 + v43;
          v36 = v0;
          v37 = v44;
        }
        int v45 = 1;
        int v46 = v28 + v45;
        v27 = v36;
        v28 = v46;
      }
      v12 = v27;
      break;
    }
    case 2:
      {
      v12 = v0;
      break;
    }
  }
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
  int v59 = 0;
  int v60 = 0;
  int v61;
  int v62;
  v61 = v59;
  v62 = v60;
  while (true) {
    int v63 = 4;
    int v64 = v62 * v63;
    int v65 = v64 + v52;
    int v66 = 8;
    int v67 = v66 + v65;
    int v68 = v51[v67];
    int v69 = 0;
    bool v70 = v68 != v69;
    v61 = v61;
    v62 = v62;
    if (!v70) break;
    int v71 = v61 + v62;
    int v72 = 1;
    int v73 = v62 + v72;
    bool v74 = true;
    int v75 = 16;
    int v76 = 4;
    int v77 = v62 * v76;
    int v78 = v75 + v77;
    int v79 = v78 + v52;
    bool v80 = true;
    int v81 = simt_wave_count_bits(v80);
    v50[v79] = v81;
    v61 = v71;
    v62 = v73;
  }
  int v82 = 28;
  int v83 = v82 + v52;
  int v84 = v51[v83];
  int v85 = 0;
  int v86;
  v86 = v85;
  switch (v84) {
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
        int v93 = v92 + v52;
        int v94 = 32;
        int v95 = v94 + v93;
        int v96 = v51[v95];
        int v97 = 0;
        bool v98 = v96 != v97;
        v89 = v89;
        v90 = v90;
        if (!v98) break;
        int v99 = 52;
        int v100 = v99 + v52;
        int v101 = v51[v100];
        int v102 = 2;
        int v103 = v52 + v102;
        int v104;
        v104 = v103;
        switch (v101) {
          default:
            {
            int v105 = 0;
            v104 = v105;
            break;
          }
          case 0:
            {
            v104 = v52;
            break;
          }
        }
        int v106 = v89 + v104;
        int v107 = 1;
        int v108 = v90 + v107;
        bool v109 = true;
        v89 = v106;
        v90 = v108;
      }
      v86 = v89;
      break;
    }
    case 1:
      {
      int v110 = 56;
      int v111 = v110 + v52;
      int v112 = v51[v111];
      int v113;
      v113 = v52;
      switch (v112) {
        default:
          {
          int v114 = 60;
          int v115 = v114 + v52;
          int v116 = v51[v115];
          int v117 = 3;
          int v118 = v52 + v117;
          int v119;
          v119 = v118;
          switch (v116) {
            case 0:
              {
              int v120 = 4;
              int v121 = v52 + v120;
              v119 = v121;
              break;
            }
            default:
              {
              v119 = v52;
              break;
            }
            case 1:
              {
              int v122 = 2;
              int v123 = v52 + v122;
              v119 = v123;
              break;
            }
          }
          bool v124 = true;
          v113 = v119;
          break;
        }
        case 0:
          {
          int v125 = 64;
          int v126 = v125 + v52;
          int v127 = v51[v126];
          int v128 = 4;
          int v129 = v52 + v128;
          int v130;
          v130 = v129;
          switch (v127) {
            case 0:
              {
              int v131 = 4;
              int v132 = v52 + v131;
              v130 = v132;
            }
            default:
              {
              int v133 = 4;
              int v134 = v52 + v133;
              v130 = v134;
            }
            case 1:
              {
              v130 = v52;
              break;
            }
          }
          v113 = v130;
          break;
        }
        case 1:
          {
          v113 = v52;
          break;
        }
        case 2:
          {
          int v135 = 68;
          int v136 = v135 + v52;
          int v137 = v51[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          int v140;
          if (v139) {
            int v141 = 3;
            v140 = v141;
          } else {
            v140 = v52;
          }
          v113 = v140;
          break;
        }
      }
      bool v142 = true;
      v86 = v113;
    }
    default:
      {
      int v143 = 72;
      int v144 = v143 + v52;
      int v145 = v51[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 1;
        int v150 = v52 + v149;
        v148 = v150;
      } else {
        int v151 = 76;
        int v152 = v151 + v52;
        int v153 = v51[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 1;
          v156 = v157;
        } else {
          v156 = v52;
        }
        v148 = v156;
      }
      v86 = v148;
      break;
    }
  }
  bool v158 = true;
  int v159 = 32;
  int v160 = v159 + v52;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v50[v160] = v162;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
