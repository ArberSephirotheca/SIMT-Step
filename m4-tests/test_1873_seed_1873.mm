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
  int v4 = 0;
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  bool v23 = v2 != v22;
  int v24;
  if (v23) {
    int v25 = 2;
    int v26 = v3 % v25;
    int v27 = 3;
    int v28;
    v28 = v27;
    switch (v26) {
      default:
        {
        int v29 = 2;
        int v30 = v3 % v29;
        int v31 = 0;
        int v32;
        v32 = v31;
        switch (v30) {
          case 0:
            {
            int v33 = 4;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          case 1:
            {
            v32 = v0;
            break;
          }
          default:
            {
            v32 = v0;
            break;
          }
        }
        int v35 = 1;
        int v36 = v0 + v35;
        v28 = v32;
        break;
      }
      case 0:
        {
        int v37 = 3;
        int v38 = v0 + v37;
        v28 = v38;
        break;
      }
    }
    v24 = v28;
  } else {
    int v39 = 0;
    bool v40 = v2 != v39;
    int v41;
    if (v40) {
      bool v42 = true;
      int v43 = simt_wave_count_bits(v42);
      int v44 = 16;
      int v45 = v44 + v0;
      v1[v45] = v43;
      v41 = v43;
    } else {
      bool v46 = true;
      int v47 = simt_wave_count_bits(v46);
      int v48 = 32;
      int v49 = v48 + v0;
      v1[v49] = v47;
      v41 = v47;
    }
    v24 = v41;
  }
  int v50 = 0;
  bool v51 = v2 != v50;
  int v52 = v51 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
  int v62 = 8;
  int v63 = v62 + v55;
  int v64 = v54[v63];
  int v65 = 0;
  bool v66 = v64 != v65;
  int v67;
  if (v66) {
    int v68 = 0;
    v67 = v68;
  } else {
    uint v69 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v70 = (int)(v69);
    v67 = v70;
  }
  int v71 = 48;
  int v72 = v71 + v55;
  bool v73 = true;
  int v74 = simt_wave_count_bits(v73);
  v53[v72] = v74;
  int v75 = 0;
  int v76 = 0;
  int v77;
  int v78;
  v77 = v75;
  v78 = v76;
  while (true) {
    int v79 = 4;
    int v80 = v78 * v79;
    int v81 = v80 + v55;
    int v82 = 12;
    int v83 = v82 + v81;
    int v84 = v54[v83];
    int v85 = 0;
    bool v86 = v84 != v85;
    v77 = v77;
    v78 = v78;
    if (!v86) break;
    int v87 = v77 + v78;
    int v88 = 1;
    int v89 = v78 + v88;
    bool v90 = true;
    int v91 = 64;
    int v92 = 4;
    int v93 = v78 * v92;
    int v94 = v91 + v93;
    int v95 = v94 + v55;
    bool v96 = true;
    int v97 = simt_wave_count_bits(v96);
    v53[v95] = v97;
    v77 = v87;
    v78 = v89;
  }
  int v98 = 1;
  int v99 = v55 + v98;
  int v100 = 32;
  int v101 = v100 + v55;
  int v102 = v54[v101];
  int v103;
  v103 = v55;
  switch (v102) {
    case 0:
      {
      int v104 = 36;
      int v105 = v104 + v55;
      int v106 = v54[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        v109 = v55;
      } else {
        int v110 = 40;
        int v111 = v110 + v55;
        int v112 = v54[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        int v115;
        if (v114) {
          int v116 = 4;
          int v117 = v55 + v116;
          v115 = v117;
        } else {
          int v118 = 1;
          v115 = v118;
        }
        v109 = v115;
      }
      v103 = v109;
      break;
    }
    default:
      {
      int v119 = 44;
      int v120 = v119 + v55;
      int v121 = v54[v120];
      int v122;
      v122 = v55;
      switch (v121) {
        case 0:
          {
          int v123 = 4;
          v122 = v123;
          break;
        }
        default:
          {
          int v124 = 48;
          int v125 = v124 + v55;
          int v126 = v54[v125];
          int v127 = 1;
          int v128;
          v128 = v127;
          switch (v126) {
            default:
              {
              v128 = v55;
            }
            case 0:
              {
              v128 = v55;
              break;
            }
          }
          v122 = v128;
        }
        case 1:
          {
          int v129 = 52;
          int v130 = v129 + v55;
          int v131 = v54[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          int v134;
          if (v133) {
            v134 = v55;
          } else {
            int v135 = 0;
            int v136 = v55 + v135;
            v134 = v136;
          }
          v122 = v134;
        }
        case 2:
          {
          int v137 = 56;
          int v138 = v137 + v55;
          int v139 = v54[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 2;
            v142 = v143;
          } else {
            v142 = v55;
          }
          v122 = v142;
          break;
        }
      }
      bool v144 = true;
      v103 = v122;
      break;
    }
    case 1:
      {
      int v145 = 60;
      int v146 = v145 + v55;
      int v147 = v54[v146];
      int v148 = 0;
      bool v149 = v147 != v148;
      int v150;
      if (v149) {
        int v151 = 64;
        int v152 = v151 + v55;
        int v153 = v54[v152];
        int v154;
        v154 = v55;
        switch (v153) {
          default:
            {
            int v155 = 3;
            v154 = v155;
            break;
          }
          case 0:
            {
            int v156 = 1;
            int v157 = v55 + v156;
            v154 = v157;
            break;
          }
        }
        bool v158 = true;
        v150 = v154;
      } else {
        int v159 = 4;
        int v160 = v55 + v159;
        v150 = v160;
      }
      v103 = v150;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 75; ++idx) {
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
