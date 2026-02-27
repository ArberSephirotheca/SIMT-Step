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
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_subgroup_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          v20 = v0;
          break;
        }
        default:
          {
          int v21 = 4;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        case 1:
          {
          int v23 = 2;
          int v24 = v0 + v23;
          v20 = v24;
          break;
        }
      }
      bool v25 = true;
      int v26 = simt_wave_count_bits(v25);
      int v27 = 0;
      int v28 = 4;
      int v29 = v10 * v28;
      int v30 = v27 + v29;
      int v31 = v30 + v0;
      v1[v31] = v26;
      int v32 = 1;
      int v33 = v10 + v32;
      v9 = v20;
      v10 = v33;
      continue;
      ;
    }
    v6 = v9;
  } else {
    bool v34 = true;
    int v35 = simt_wave_count_bits(v34);
    int v36 = 16;
    int v37 = v36 + v0;
    v1[v37] = v35;
    v6 = v35;
  }
  return;
}

kernel void kernel_main(device int* v38 [[buffer(0)]], device int* v39 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v40 = static_cast<int>(__simt_tid3.x);
  int v41 = 0;
  int v42 = v41 + v40;
  int v43 = v39[v42];
  int v44 = 4;
  int v45 = v44 + v40;
  int v46 = v39[v45];
  helper0(v40, v38, v43, v46, static_cast<int>(__simt_tid3.x));
  int v47 = 8;
  int v48 = v47 + v40;
  int v49 = v39[v48];
  uint v50 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v51 = (int)(v50);
  int v52;
  v52 = v51;
  switch (v49) {
    default:
      {
      int v53 = 1;
      int v54 = v40 + v53;
      v52 = v54;
      break;
    }
    case 0:
      {
      int v55 = 12;
      int v56 = v55 + v40;
      int v57 = v39[v56];
      int v58 = 0;
      bool v59 = v57 != v58;
      int v60;
      if (v59) {
        int v61 = 4;
        v60 = v61;
      } else {
        int v62 = 16;
        int v63 = v62 + v40;
        int v64 = v39[v63];
        int v65 = 0;
        bool v66 = v64 != v65;
        int v67;
        if (v66) {
          int v68 = 1;
          v67 = v68;
        } else {
          int v69 = 0;
          int v70 = v40 + v69;
          v67 = v70;
        }
        v60 = v67;
      }
      v52 = v60;
      break;
    }
  }
  int v71 = 20;
  int v72 = v71 + v40;
  int v73 = v39[v72];
  int v74;
  v74 = v40;
  switch (v73) {
    case 0:
      {
      int v75 = 24;
      int v76 = v75 + v40;
      int v77 = v39[v76];
      int v78 = 0;
      int v79 = v40 + v78;
      int v80;
      v80 = v79;
      switch (v77) {
        case 0:
          {
          int v81 = 0;
          int v82 = 0;
          int v83;
          int v84;
          v83 = v81;
          v84 = v82;
          while (true) {
            int v85 = 4;
            int v86 = v84 * v85;
            int v87 = v86 + v40;
            int v88 = 28;
            int v89 = v88 + v87;
            int v90 = v39[v89];
            int v91 = 0;
            bool v92 = v90 != v91;
            v83 = v83;
            v84 = v84;
            if (!v92) break;
            int v93 = v83 + v84;
            int v94 = 1;
            int v95 = v84 + v94;
            bool v96 = true;
            v83 = v93;
            v84 = v95;
          }
          v80 = v83;
          break;
        }
        default:
          {
          int v97 = 0;
          int v98 = 0;
          int v99;
          int v100;
          v99 = v97;
          v100 = v98;
          while (true) {
            int v101 = 4;
            int v102 = v100 * v101;
            int v103 = v102 + v40;
            int v104 = 48;
            int v105 = v104 + v103;
            int v106 = v39[v105];
            int v107 = 0;
            bool v108 = v106 != v107;
            v99 = v99;
            v100 = v100;
            if (!v108) break;
            int v109 = v99 + v100;
            int v110 = 1;
            int v111 = v100 + v110;
            bool v112 = true;
            v99 = v109;
            v100 = v111;
          }
          v80 = v99;
          break;
        }
        case 1:
          {
          int v113 = 68;
          int v114 = v113 + v40;
          int v115 = v39[v114];
          int v116 = 0;
          bool v117 = v115 != v116;
          int v118;
          if (v117) {
            v118 = v40;
          } else {
            int v119 = 3;
            int v120 = v40 + v119;
            v118 = v120;
          }
          v80 = v118;
          break;
        }
        case 2:
          {
          int v121 = 3;
          v80 = v121;
          break;
        }
      }
      v74 = v80;
      break;
    }
    default:
      {
      int v122 = 4;
      v74 = v122;
      break;
    }
  }
  bool v123 = true;
  int v124 = 32;
  int v125 = v124 + v40;
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  v38[v125] = v127;
  int v128 = 0;
  int v129 = 0;
  int v130;
  int v131;
  v130 = v128;
  v131 = v129;
  while (true) {
    int v132 = 4;
    int v133 = v131 * v132;
    int v134 = v133 + v40;
    int v135 = 72;
    int v136 = v135 + v134;
    int v137 = v39[v136];
    int v138 = 0;
    bool v139 = v137 != v138;
    v130 = v130;
    v131 = v131;
    if (!v139) break;
    int v140 = 92;
    int v141 = v140 + v40;
    int v142 = v39[v141];
    uint v143 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v144 = (int)(v143);
    int v145;
    v145 = v144;
    switch (v142) {
      case 0:
        {
        int v146 = 96;
        int v147 = v146 + v40;
        int v148 = v39[v147];
        int v149;
        v149 = v40;
        switch (v148) {
          case 0:
            {
            int v150 = 1;
            int v151 = v40 + v150;
            v149 = v151;
          }
          default:
            {
            v149 = v40;
            break;
          }
          case 1:
            {
            int v152 = 0;
            v149 = v152;
            break;
          }
        }
        v145 = v149;
        break;
      }
      default:
        {
        int v153 = 1;
        int v154 = v40 + v153;
        v145 = v154;
        break;
      }
      case 1:
        {
        v145 = v40;
        break;
      }
    }
    int v155 = v130 + v145;
    int v156 = 1;
    int v157 = v131 + v156;
    bool v158 = true;
    int v159 = 48;
    int v160 = 4;
    int v161 = v131 * v160;
    int v162 = v159 + v161;
    int v163 = v162 + v40;
    bool v164 = true;
    int v165 = simt_wave_count_bits(v164);
    v38[v163] = v165;
    v130 = v155;
    v131 = v157;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 59; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
