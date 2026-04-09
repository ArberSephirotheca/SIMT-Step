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
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  int v22 = 0;
  int v23;
  int v24;
  v23 = v21;
  v24 = v22;
  while (true) {
    int v25 = 4;
    int v26 = v3 % v25;
    int v27 = 1;
    int v28 = v26 + v27;
    bool v29 = v24 < v28;
    v23 = v23;
    v24 = v24;
    if (!v29) break;
    int v30 = 0;
    int v31 = 0;
    int v32;
    int v33;
    v32 = v30;
    v33 = v31;
    while (true) {
      int v34 = 4;
      int v35 = v3 % v34;
      int v36 = 1;
      int v37 = v35 + v36;
      bool v38 = v33 < v37;
      v32 = v32;
      v33 = v33;
      if (!v38) break;
      int v39 = 4;
      int v40 = 1;
      int v41 = v33 + v40;
      v32 = v39;
      v33 = v41;
    }
    int v42 = 1;
    int v43 = v0 + v42;
    int v44 = 1;
    int v45 = v24 + v44;
    v23 = v32;
    v24 = v45;
    continue;
    ;
  }
  bool v46 = true;
  int v47 = simt_wave_count_bits(v46);
  int v48 = 16;
  int v49 = v48 + v0;
  v1[v49] = v47;
  int v50 = 0;
  bool v51 = v2 != v50;
  int v52 = v51 ? v6 : v23;
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
  int v66;
  v66 = v65;
  switch (v64) {
    default:
      {
      int v67 = 12;
      int v68 = v67 + v55;
      int v69 = v54[v68];
      int v70;
      v70 = v55;
      switch (v69) {
        case 0:
          {
          int v71 = 4;
          int v72 = v55 + v71;
          v70 = v72;
        }
        default:
          {
          int v73 = 0;
          int v74 = 0;
          int v75;
          int v76;
          v75 = v73;
          v76 = v74;
          while (true) {
            int v77 = 4;
            int v78 = v76 * v77;
            int v79 = v78 + v55;
            int v80 = 16;
            int v81 = v80 + v79;
            int v82 = v54[v81];
            int v83 = 0;
            bool v84 = v82 != v83;
            v75 = v75;
            v76 = v76;
            if (!v84) break;
            int v85 = v75 + v76;
            int v86 = 1;
            int v87 = v76 + v86;
            v75 = v85;
            v76 = v87;
          }
          bool v88 = true;
          v70 = v75;
        }
        case 1:
          {
          int v89 = 3;
          int v90 = v55 + v89;
          v70 = v90;
          break;
        }
        case 2:
          {
          int v91 = 0;
          int v92 = 0;
          int v93;
          int v94;
          v93 = v91;
          v94 = v92;
          while (true) {
            int v95 = 4;
            int v96 = v94 * v95;
            int v97 = v96 + v55;
            int v98 = 36;
            int v99 = v98 + v97;
            int v100 = v54[v99];
            int v101 = 0;
            bool v102 = v100 != v101;
            v93 = v93;
            v94 = v94;
            if (!v102) break;
            int v103 = v93 + v94;
            int v104 = 1;
            int v105 = v94 + v104;
            v93 = v103;
            v94 = v105;
          }
          bool v106 = true;
          v70 = v93;
          break;
        }
      }
      bool v107 = true;
      v66 = v70;
      break;
    }
    case 0:
      {
      int v108 = 56;
      int v109 = v108 + v55;
      int v110 = v54[v109];
      int v111 = 3;
      int v112 = v55 + v111;
      int v113;
      v113 = v112;
      switch (v110) {
        default:
          {
          int v114 = 60;
          int v115 = v114 + v55;
          int v116 = v54[v115];
          int v117 = 0;
          bool v118 = v116 != v117;
          int v119;
          if (v118) {
            v119 = v55;
          } else {
            int v120 = 4;
            int v121 = v55 + v120;
            v119 = v121;
          }
          v113 = v119;
        }
        case 0:
          {
          int v122 = 2;
          v113 = v122;
          break;
        }
      }
      bool v123 = true;
      v66 = v113;
      break;
    }
    case 1:
      {
      int v124 = 0;
      int v125 = 0;
      int v126;
      int v127;
      v126 = v124;
      v127 = v125;
      while (true) {
        int v128 = 4;
        int v129 = v127 * v128;
        int v130 = v129 + v55;
        int v131 = 64;
        int v132 = v131 + v130;
        int v133 = v54[v132];
        int v134 = 0;
        bool v135 = v133 != v134;
        v126 = v126;
        v127 = v127;
        if (!v135) break;
        int v136 = v126 + v127;
        int v137 = 1;
        int v138 = v127 + v137;
        v126 = v136;
        v127 = v138;
      }
      bool v139 = true;
      v66 = v126;
      break;
    }
  }
  bool v140 = true;
  int v141 = 32;
  int v142 = v141 + v55;
  bool v143 = true;
  int v144 = simt_wave_count_bits(v143);
  v53[v142] = v144;
  int v145 = 0;
  int v146 = 0;
  int v147;
  int v148;
  v147 = v145;
  v148 = v146;
  while (true) {
    int v149 = 4;
    int v150 = v148 * v149;
    int v151 = v150 + v55;
    int v152 = 84;
    int v153 = v152 + v151;
    int v154 = v54[v153];
    int v155 = 0;
    bool v156 = v154 != v155;
    v147 = v147;
    v148 = v148;
    if (!v156) break;
    int v157 = v147 + v148;
    int v158 = 1;
    int v159 = v148 + v158;
    v147 = v157;
    v148 = v159;
    continue;
    ;
  }
  bool v160 = true;
  int v161 = 48;
  int v162 = v161 + v55;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v53[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 104; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
