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
  bool v9 = v2 != v8;
  int v10;
  if (v9) {
    int v11 = 0;
    bool v12 = v2 != v11;
    int v13;
    if (v12) {
      bool v14 = true;
      int v15 = simt_wave_count_bits(v14);
      int v16 = 16;
      int v17 = v16 + v0;
      v1[v17] = v15;
      v13 = v15;
    } else {
      int v18 = 0;
      int v19 = 0;
      int v20;
      int v21;
      v20 = v18;
      v21 = v19;
      while (true) {
        int v22 = 4;
        int v23 = v3 % v22;
        int v24 = 1;
        int v25 = v23 + v24;
        bool v26 = v21 < v25;
        v20 = v20;
        v21 = v21;
        if (!v26) break;
        bool v27 = true;
        int v28 = simt_wave_count_bits(v27);
        int v29 = 32;
        int v30 = 4;
        int v31 = v21 * v30;
        int v32 = v29 + v31;
        int v33 = v32 + v0;
        v1[v33] = v28;
        int v34 = 1;
        int v35 = v21 + v34;
        v20 = v28;
        v21 = v35;
      }
      v13 = v20;
    }
    v10 = v13;
  } else {
    int v36 = 3;
    int v37 = v3 % v36;
    int v38 = 3;
    int v39 = v0 + v38;
    int v40;
    v40 = v39;
    switch (v37) {
      case 0:
        {
        int v41 = 4;
        int v42 = v3 % v41;
        int v43 = 4;
        int v44 = v0 + v43;
        int v45;
        v45 = v44;
        switch (v42) {
          case 0:
            {
            v45 = v0;
            break;
          }
          case 1:
            {
            int v46 = 0;
            int v47 = v0 + v46;
            v45 = v47;
            break;
          }
          default:
            {
            int v48 = 4;
            v45 = v48;
            break;
          }
          case 2:
            {
            int v49 = 0;
            int v50 = v0 + v49;
            v45 = v50;
            break;
          }
        }
        v40 = v45;
      }
      case 1:
        {
        int v51 = 0;
        int v52 = v0 + v51;
        int v53;
        v53 = v52;
        switch (v3) {
          default:
            {
            v53 = v0;
            break;
          }
          case 0:
            {
            int v54 = 3;
            int v55 = v0 + v54;
            v53 = v55;
            break;
          }
        }
        v40 = v53;
      }
      case 2:
        {
        int v56;
        v56 = v0;
        switch (v3) {
          case 0:
            {
            int v57 = 2;
            v56 = v57;
          }
          default:
            {
            int v58 = 1;
            v56 = v58;
            break;
          }
        }
        v40 = v56;
      }
      default:
        {
        int v59 = 4;
        v40 = v59;
        break;
      }
    }
    v10 = v40;
  }
  int v60 = 0;
  bool v61 = v2 != v60;
  int v62 = v61 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v63 [[buffer(0)]], device int* v64 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v65 = static_cast<int>(__simt_tid3.x);
  int v66 = 0;
  int v67 = v66 + v65;
  int v68 = v64[v67];
  int v69 = 4;
  int v70 = v69 + v65;
  int v71 = v64[v70];
  helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v65;
    int v79 = 8;
    int v80 = v79 + v78;
    int v81 = v64[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = v74 + v75;
    int v85 = 1;
    int v86 = v75 + v85;
    bool v87 = true;
    int v88 = 48;
    int v89 = 4;
    int v90 = v75 * v89;
    int v91 = v88 + v90;
    int v92 = v91 + v65;
    bool v93 = true;
    int v94 = simt_wave_count_bits(v93);
    v63[v92] = v94;
    v74 = v84;
    v75 = v86;
  }
  int v95 = 0;
  int v96 = 0;
  int v97;
  int v98;
  v97 = v95;
  v98 = v96;
  while (true) {
    int v99 = 4;
    int v100 = v98 * v99;
    int v101 = v100 + v65;
    int v102 = 28;
    int v103 = v102 + v101;
    int v104 = v64[v103];
    int v105 = 0;
    bool v106 = v104 != v105;
    v97 = v97;
    v98 = v98;
    if (!v106) break;
    int v107 = 1;
    int v108 = v65 + v107;
    int v109 = v97 + v108;
    int v110 = 1;
    int v111 = v98 + v110;
    bool v112 = true;
    int v113 = 64;
    int v114 = 4;
    int v115 = v98 * v114;
    int v116 = v113 + v115;
    int v117 = v116 + v65;
    bool v118 = true;
    int v119 = simt_wave_count_bits(v118);
    v63[v117] = v119;
    v97 = v109;
    v98 = v111;
    continue;
    ;
  }
  int v120 = 48;
  int v121 = v120 + v65;
  int v122 = v64[v121];
  int v123 = 0;
  bool v124 = v122 != v123;
  int v125;
  if (v124) {
    int v126 = 52;
    int v127 = v126 + v65;
    int v128 = v64[v127];
    int v129 = 1;
    int v130 = v65 + v129;
    int v131;
    v131 = v130;
    switch (v128) {
      default:
        {
        int v132 = 56;
        int v133 = v132 + v65;
        int v134 = v64[v133];
        int v135 = 0;
        bool v136 = v134 != v135;
        int v137;
        if (v136) {
          int v138 = 1;
          v137 = v138;
        } else {
          int v139 = 4;
          int v140 = v65 + v139;
          v137 = v140;
        }
        v131 = v137;
        break;
      }
      case 0:
        {
        int v141 = 60;
        int v142 = v141 + v65;
        int v143 = v64[v142];
        int v144;
        v144 = v65;
        switch (v143) {
          case 0:
            {
            int v145 = 0;
            int v146 = v65 + v145;
            v144 = v146;
          }
          default:
            {
            int v147 = 4;
            v144 = v147;
          }
          case 1:
            {
            int v148 = 2;
            int v149 = v65 + v148;
            v144 = v149;
            break;
          }
        }
        v131 = v144;
        break;
      }
    }
    v125 = v131;
  } else {
    int v150 = 64;
    int v151 = v150 + v65;
    int v152 = v64[v151];
    int v153 = 2;
    int v154;
    v154 = v153;
    switch (v152) {
      default:
        {
        v154 = v65;
      }
      case 0:
        {
        int v155 = 68;
        int v156 = v155 + v65;
        int v157 = v64[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          int v161 = 1;
          int v162 = v65 + v161;
          v160 = v162;
        } else {
          int v163 = 2;
          v160 = v163;
        }
        v154 = v160;
        break;
      }
    }
    v125 = v154;
  }
  int v164 = 80;
  int v165 = v164 + v65;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v63[v165] = v167;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
