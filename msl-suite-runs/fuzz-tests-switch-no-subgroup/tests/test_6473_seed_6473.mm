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
    int v17 = 0;
    int v18 = 0;
    int v19;
    int v20;
    v19 = v17;
    v20 = v18;
    while (true) {
      int v21 = 4;
      int v22 = v3 % v21;
      int v23 = 1;
      int v24 = v22 + v23;
      bool v25 = v20 < v24;
      v19 = v19;
      v20 = v20;
      if (!v25) break;
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
        bool v35 = true;
        int v36 = simt_wave_count_bits(v35);
        int v37 = 16;
        int v38 = 4;
        int v39 = v29 * v38;
        int v40 = v37 + v39;
        int v41 = v40 + v0;
        v1[v41] = v36;
        int v42 = 1;
        int v43 = v29 + v42;
        v28 = v36;
        v29 = v43;
        break;
        ;
      }
      int v44 = 1;
      int v45 = v20 + v44;
      v19 = v28;
      v20 = v45;
    }
    int v46 = 1;
    int v47 = v11 + v46;
    v10 = v19;
    v11 = v47;
  }
  int v48 = 0;
  bool v49 = v2 != v48;
  int v50 = v49 ? v5 : v10;
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
  int v60 = 0;
  bool v61 = v56 != v60;
  if (v61) {
  } else {
    int v62 = 0;
    int v63 = 0;
    int v64;
    int v65;
    v64 = v62;
    v65 = v63;
    while (true) {
      int v66 = 1;
      bool v67 = v65 < v66;
      v64 = v64;
      v65 = v65;
      if (!v67) break;
      int v68;
      v68 = v53;
      switch (v53) {
        default:
          {
          int v69 = 3;
          int v70 = v68 + v69;
          v68 = v70;
          break;
        }
        case 0:
          {
          int v71 = 4;
          int v72 = v68 + v71;
          v68 = v72;
          break;
        }
      }
      helper0(v53, v51, v56, v59, static_cast<int>(__simt_tid3.x));
      int v73 = 1;
      int v74 = v65 + v73;
      v64 = v64;
      v65 = v74;
    }
  }
  uint v75 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v76 = (int)(v75);
  int v77 = 8;
  int v78 = v77 + v53;
  int v79 = v52[v78];
  int v80 = 0;
  bool v81 = v79 != v80;
  int v82;
  if (v81) {
    int v83 = 12;
    int v84 = v83 + v53;
    int v85 = v52[v84];
    int v86 = 0;
    bool v87 = v85 != v86;
    int v88;
    if (v87) {
      int v89 = 2;
      int v90 = v53 + v89;
      v88 = v90;
    } else {
      uint v91 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v92 = (int)(v91);
      v88 = v92;
    }
    int v93 = 32;
    int v94 = v93 + v53;
    bool v95 = true;
    int v96 = simt_wave_count_bits(v95);
    v51[v94] = v96;
    v82 = v88;
  } else {
    int v97 = 16;
    int v98 = v97 + v53;
    int v99 = v52[v98];
    int v100 = 1;
    int v101;
    v101 = v100;
    switch (v99) {
      case 0:
        {
        int v102 = 20;
        int v103 = v102 + v53;
        int v104 = v52[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        int v107;
        if (v106) {
          int v108 = 4;
          int v109 = v53 + v108;
          v107 = v109;
        } else {
          v107 = v53;
        }
        v101 = v107;
        break;
      }
      default:
        {
        int v110 = 1;
        v101 = v110;
        break;
      }
      case 1:
        {
        int v111 = 24;
        int v112 = v111 + v53;
        int v113 = v52[v112];
        int v114 = 2;
        int v115 = v53 + v114;
        int v116;
        v116 = v115;
        switch (v113) {
          case 0:
            {
            int v117 = 0;
            int v118 = v53 + v117;
            v116 = v118;
            break;
          }
          case 1:
            {
            v116 = v53;
            break;
          }
          case 2:
            {
            v116 = v53;
            break;
          }
          default:
            {
            int v119 = 1;
            int v120 = v53 + v119;
            v116 = v120;
            break;
          }
        }
        bool v121 = true;
        v101 = v116;
        break;
      }
      case 2:
        {
        int v122 = 28;
        int v123 = v122 + v53;
        int v124 = v52[v123];
        int v125 = 3;
        int v126 = v53 + v125;
        int v127;
        v127 = v126;
        switch (v124) {
          case 0:
            {
            v127 = v53;
          }
          case 1:
            {
            int v128 = 2;
            int v129 = v53 + v128;
            v127 = v129;
          }
          case 2:
            {
            int v130 = 2;
            v127 = v130;
          }
          default:
            {
            v127 = v53;
            break;
          }
        }
        v101 = v127;
        break;
      }
    }
    v82 = v101;
  }
  int v131 = 48;
  int v132 = v131 + v53;
  bool v133 = true;
  int v134 = simt_wave_count_bits(v133);
  v51[v132] = v134;
  int v135 = 32;
  int v136 = v135 + v53;
  int v137 = v52[v136];
  int v138 = 0;
  bool v139 = v137 != v138;
  int v140;
  if (v139) {
    int v141 = 4;
    v140 = v141;
  } else {
    int v142 = 36;
    int v143 = v142 + v53;
    int v144 = v52[v143];
    int v145 = 0;
    bool v146 = v144 != v145;
    int v147;
    if (v146) {
      int v148 = 40;
      int v149 = v148 + v53;
      int v150 = v52[v149];
      int v151;
      v151 = v53;
      switch (v150) {
        default:
          {
          v151 = v53;
        }
        case 0:
          {
          v151 = v53;
          break;
        }
      }
      v147 = v151;
    } else {
      int v152 = 44;
      int v153 = v152 + v53;
      int v154 = v52[v153];
      int v155;
      v155 = v53;
      switch (v154) {
        case 0:
          {
          int v156 = 2;
          v155 = v156;
          break;
        }
        case 1:
          {
          v155 = v53;
          break;
        }
        case 2:
          {
          v155 = v53;
          break;
        }
        default:
          {
          int v157 = 4;
          int v158 = v53 + v157;
          v155 = v158;
          break;
        }
      }
      v147 = v155;
    }
    int v159 = 64;
    int v160 = v159 + v53;
    bool v161 = true;
    int v162 = simt_wave_count_bits(v161);
    v51[v160] = v162;
    v140 = v147;
  }
  int v163 = 80;
  int v164 = v163 + v53;
  bool v165 = true;
  int v166 = simt_wave_count_bits(v165);
  v51[v164] = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
