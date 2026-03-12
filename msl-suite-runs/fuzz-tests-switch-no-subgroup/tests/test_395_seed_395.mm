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
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 2;
      int v12;
      v12 = v11;
      switch (v10) {
        default:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15;
          v15 = v0;
          switch (v14) {
            default:
              {
              int v16 = 4;
              int v17 = v0 + v16;
              v15 = v17;
              break;
            }
            case 0:
              {
              int v18 = 2;
              int v19 = v0 + v18;
              v15 = v19;
              break;
            }
            case 1:
              {
              v15 = v0;
              break;
            }
          }
          v12 = v15;
          break;
        }
        case 0:
          {
          int v20 = 2;
          int v21 = v3 % v20;
          int v22;
          v22 = v0;
          switch (v21) {
            default:
              {
              v22 = v0;
              break;
            }
            case 0:
              {
              int v23 = 4;
              v22 = v23;
              break;
            }
          }
          v12 = v22;
          break;
        }
      }
      v8 = v12;
      break;
    }
    case 0:
      {
      int v24 = 0;
      v8 = v24;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
    case 2:
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
        break;
        ;
      }
      v8 = v27;
      break;
    }
  }
  bool v47 = true;
  int v48 = simt_wave_count_bits(v47);
  int v49 = 0;
  int v50 = v49 + v0;
  v1[v50] = v48;
  return;
}

kernel void kernel_main(device int* v51 [[buffer(0)]], device int* v52 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v53 = static_cast<int>(__simt_tid3.x);
  int v54 = 0;
  int v55 = v54 + v53;
  int v56 = v52[v55];
  int v57 = 4;
  int v58 = v57 + v53;
  int v59 = v52[v58];
  helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
  int v60 = 8;
  int v61 = v60 + v53;
  int v62 = v52[v61];
  uint v63 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v64 = (int)(v63);
  int v65;
  v65 = v64;
  switch (v62) {
    default:
      {
      int v66 = 1;
      int v67 = v53 + v66;
      v65 = v67;
      break;
    }
    case 0:
      {
      int v68 = 12;
      int v69 = v68 + v53;
      int v70 = v52[v69];
      int v71 = 0;
      bool v72 = v70 != v71;
      int v73;
      if (v72) {
        int v74 = 0;
        int v75 = 0;
        int v76;
        int v77;
        v76 = v74;
        v77 = v75;
        while (true) {
          int v78 = 4;
          int v79 = v77 * v78;
          int v80 = v79 + v53;
          int v81 = 16;
          int v82 = v81 + v80;
          int v83 = v52[v82];
          int v84 = 0;
          bool v85 = v83 != v84;
          v76 = v76;
          v77 = v77;
          if (!v85) break;
          int v86 = v76 + v77;
          int v87 = 1;
          int v88 = v77 + v87;
          bool v89 = true;
          v76 = v86;
          v77 = v88;
        }
        v73 = v76;
      } else {
        v73 = v53;
      }
      v65 = v73;
      break;
    }
  }
  int v90 = 36;
  int v91 = v90 + v53;
  int v92 = v52[v91];
  int v93 = 0;
  bool v94 = v92 != v93;
  int v95;
  if (v94) {
    int v96 = 40;
    int v97 = v96 + v53;
    int v98 = v52[v97];
    uint v99 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v100 = (int)(v99);
    int v101;
    v101 = v100;
    switch (v98) {
      default:
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
          int v108 = v107 + v53;
          int v109 = 44;
          int v110 = v109 + v108;
          int v111 = v52[v110];
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
        }
        v101 = v104;
      }
      case 0:
        {
        int v118 = 64;
        int v119 = v118 + v53;
        int v120 = v52[v119];
        int v121 = 0;
        bool v122 = v120 != v121;
        int v123;
        if (v122) {
          int v124 = 3;
          int v125 = v53 + v124;
          v123 = v125;
        } else {
          v123 = v53;
        }
        v101 = v123;
        break;
      }
      case 1:
        {
        int v126 = 68;
        int v127 = v126 + v53;
        int v128 = v52[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        int v131;
        if (v130) {
          v131 = v53;
        } else {
          v131 = v53;
        }
        v101 = v131;
        break;
      }
    }
    v95 = v101;
  } else {
    int v132 = 0;
    int v133 = 0;
    int v134;
    int v135;
    v134 = v132;
    v135 = v133;
    while (true) {
      int v136 = 4;
      int v137 = v135 * v136;
      int v138 = v137 + v53;
      int v139 = 72;
      int v140 = v139 + v138;
      int v141 = v52[v140];
      int v142 = 0;
      bool v143 = v141 != v142;
      v134 = v134;
      v135 = v135;
      if (!v143) break;
      int v144 = 92;
      int v145 = v144 + v53;
      int v146 = v52[v145];
      int v147 = 1;
      int v148;
      v148 = v147;
      switch (v146) {
        case 0:
          {
          int v149 = 4;
          int v150 = v53 + v149;
          v148 = v150;
        }
        case 1:
          {
          int v151 = 0;
          int v152 = v53 + v151;
          v148 = v152;
        }
        case 2:
          {
          v148 = v53;
        }
        default:
          {
          v148 = v53;
          break;
        }
      }
      int v153 = v134 + v148;
      int v154 = 1;
      int v155 = v135 + v154;
      bool v156 = true;
      int v157 = 16;
      int v158 = 4;
      int v159 = v135 * v158;
      int v160 = v157 + v159;
      int v161 = v160 + v53;
      bool v162 = true;
      int v163 = simt_wave_count_bits(v162);
      v51[v161] = v163;
      v134 = v153;
      v135 = v155;
    }
    v95 = v134;
  }
  int v164 = 32;
  int v165 = v164 + v53;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v51[v165] = v167;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
