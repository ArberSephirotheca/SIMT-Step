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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    bool v8 = v2 != v7;
    int v9;
    if (v8) {
      int v10 = 0;
      bool v11 = v2 != v10;
      int v12;
      if (v11) {
        uint v13 = simt_subgroup_id(__simt_tid);
        int v14 = (int)(v13);
        v12 = v14;
      } else {
        uint v15 = simt_lane_id(__simt_tid);
        int v16 = (int)(v15);
        v12 = v16;
      }
      uint v17 = simt_subgroup_id(__simt_tid);
      int v18 = (int)(v17);
      v9 = v12;
    } else {
      int v19 = 3;
      int v20 = v3 % v19;
      int v21;
      v21 = v0;
      switch (v20) {
        case 0:
          {
          int v22 = 2;
          int v23 = v0 + v22;
          v21 = v23;
          break;
        }
        case 1:
          {
          v21 = v0;
          break;
        }
        default:
          {
          v21 = v0;
          break;
        }
      }
      uint v24 = simt_lane_id(__simt_tid);
      int v25 = (int)(v24);
      v9 = v21;
    }
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    v6 = v9;
  } else {
    int v28 = 0;
    bool v29 = v2 != v28;
    int v30;
    if (v29) {
      int v31 = 2;
      int v32 = v3 % v31;
      int v33 = 2;
      int v34 = v0 + v33;
      int v35;
      v35 = v34;
      switch (v32) {
        default:
          {
          int v36 = 4;
          v35 = v36;
        }
        case 0:
          {
          int v37 = 3;
          v35 = v37;
          break;
        }
      }
      int v38 = 1;
      int v39 = v0 + v38;
      v30 = v35;
    } else {
      int v40 = 2;
      int v41 = v3 % v40;
      int v42;
      v42 = v0;
      switch (v41) {
        case 0:
          {
          v42 = v0;
          break;
        }
        default:
          {
          v42 = v0;
          break;
        }
        case 1:
          {
          int v43 = 3;
          int v44 = v0 + v43;
          v42 = v44;
          break;
        }
      }
      int v45 = 1;
      v30 = v42;
    }
    uint v46 = simt_subgroup_id(__simt_tid);
    int v47 = (int)(v46);
    v6 = v30;
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 0;
  int v62 = 0;
  int v63;
  int v64;
  v63 = v61;
  v64 = v62;
  while (true) {
    int v65 = 4;
    int v66 = v64 * v65;
    int v67 = v66 + v54;
    int v68 = 8;
    int v69 = v68 + v67;
    int v70 = v53[v69];
    int v71 = 0;
    bool v72 = v70 != v71;
    v63 = v63;
    v64 = v64;
    if (!v72) break;
    int v73 = 28;
    int v74 = v73 + v54;
    int v75 = v53[v74];
    int v76 = 3;
    int v77;
    v77 = v76;
    switch (v75) {
      case 0:
        {
        int v78 = 32;
        int v79 = v78 + v54;
        int v80 = v53[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        int v83;
        if (v82) {
          int v84 = 1;
          v83 = v84;
        } else {
          int v85 = 2;
          v83 = v85;
        }
        v77 = v83;
        break;
      }
      default:
        {
        int v86 = 3;
        int v87 = v54 + v86;
        v77 = v87;
        break;
      }
    }
    bool v88 = true;
    int v89 = v63 + v77;
    int v90 = 1;
    int v91 = v64 + v90;
    v63 = v89;
    v64 = v91;
  }
  bool v92 = true;
  int v93 = 16;
  int v94 = v93 + v54;
  bool v95 = true;
  int v96 = simt_wave_count_bits(v95);
  v52[v94] = v96;
  int v97 = 36;
  int v98 = v97 + v54;
  int v99 = v53[v98];
  int v100 = 0;
  bool v101 = v99 != v100;
  int v102;
  if (v101) {
    int v103 = 40;
    int v104 = v103 + v54;
    int v105 = v53[v104];
    int v106;
    v106 = v54;
    switch (v105) {
      default:
        {
        int v107 = 44;
        int v108 = v107 + v54;
        int v109 = v53[v108];
        int v110;
        v110 = v54;
        switch (v109) {
          default:
            {
            int v111 = 2;
            v110 = v111;
            break;
          }
          case 0:
            {
            v110 = v54;
          }
          case 1:
            {
            v110 = v54;
            break;
          }
        }
        bool v112 = true;
        v106 = v110;
        break;
      }
      case 0:
        {
        int v113 = 48;
        int v114 = v113 + v54;
        int v115 = v53[v114];
        int v116;
        v116 = v54;
        switch (v115) {
          case 0:
            {
            int v117 = 4;
            v116 = v117;
            break;
          }
          default:
            {
            int v118 = 3;
            int v119 = v54 + v118;
            v116 = v119;
            break;
          }
        }
        bool v120 = true;
        v106 = v116;
        break;
      }
      case 1:
        {
        int v121 = 52;
        int v122 = v121 + v54;
        int v123 = v53[v122];
        int v124 = 2;
        int v125;
        v125 = v124;
        switch (v123) {
          case 0:
            {
            v125 = v54;
            break;
          }
          case 1:
            {
            int v126 = 1;
            int v127 = v54 + v126;
            v125 = v127;
          }
          case 2:
            {
            int v128 = 0;
            int v129 = v54 + v128;
            v125 = v129;
            break;
          }
          default:
            {
            int v130 = 3;
            int v131 = v54 + v130;
            v125 = v131;
            break;
          }
        }
        bool v132 = true;
        v106 = v125;
        break;
      }
      case 2:
        {
        int v133 = 56;
        int v134 = v133 + v54;
        int v135 = v53[v134];
        int v136;
        v136 = v54;
        switch (v135) {
          case 0:
            {
            int v137 = 4;
            v136 = v137;
            break;
          }
          default:
            {
            int v138 = 0;
            int v139 = v54 + v138;
            v136 = v139;
            break;
          }
          case 1:
            {
            int v140 = 3;
            int v141 = v54 + v140;
            v136 = v141;
            break;
          }
        }
        bool v142 = true;
        v106 = v136;
        break;
      }
    }
    bool v143 = true;
    v102 = v106;
  } else {
    int v144 = 60;
    int v145 = v144 + v54;
    int v146 = v53[v145];
    int v147 = 0;
    bool v148 = v146 != v147;
    int v149;
    if (v148) {
      int v150 = 64;
      int v151 = v150 + v54;
      int v152 = v53[v151];
      int v153 = 0;
      bool v154 = v152 != v153;
      int v155;
      if (v154) {
        v155 = v54;
      } else {
        int v156 = 4;
        int v157 = v54 + v156;
        v155 = v157;
      }
      v149 = v155;
    } else {
      int v158 = 68;
      int v159 = v158 + v54;
      int v160 = v53[v159];
      int v161;
      v161 = v54;
      switch (v160) {
        default:
          {
          v161 = v54;
          break;
        }
        case 0:
          {
          int v162 = 2;
          v161 = v162;
          break;
        }
      }
      bool v163 = true;
      v149 = v161;
    }
    v102 = v149;
  }
  int v164 = 32;
  int v165 = v164 + v54;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v52[v165] = v167;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
