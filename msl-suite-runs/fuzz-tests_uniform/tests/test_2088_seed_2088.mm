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
    int v13 = 0;
    int v14 = 0;
    int v15;
    int v16;
    v15 = v13;
    v16 = v14;
    while (true) {
      int v17 = 4;
      int v18 = v3 % v17;
      int v19 = 1;
      int v20 = v18 + v19;
      bool v21 = v16 < v20;
      v15 = v15;
      v16 = v16;
      if (!v21) break;
      int v22 = 4;
      int v23 = v3 % v22;
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      int v26;
      v26 = v25;
      switch (v23) {
        case 0:
          {
          int v27 = 0;
          int v28 = v0 + v27;
          v26 = v28;
          break;
        }
        case 1:
          {
          v26 = v0;
          break;
        }
        default:
          {
          int v29 = 4;
          int v30 = v0 + v29;
          v26 = v30;
        }
        case 2:
          {
          int v31 = 3;
          int v32 = v0 + v31;
          v26 = v32;
          break;
        }
      }
      int v33 = 1;
      int v34 = v16 + v33;
      v15 = v26;
      v16 = v34;
    }
    int v35 = 0;
    int v36 = v0 + v35;
    int v37 = 1;
    int v38 = v7 + v37;
    v6 = v15;
    v7 = v38;
    break;
    ;
  }
  bool v39 = true;
  int v40 = simt_wave_count_bits(v39);
  int v41 = 0;
  int v42 = v41 + v0;
  v1[v42] = v40;
  return;
}

kernel void kernel_main(device int* v43 [[buffer(0)]], device int* v44 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v45 = static_cast<int>(__simt_tid3.x);
  int v46 = 0;
  int v47 = v46 + v45;
  int v48 = v44[v47];
  int v49 = 4;
  int v50 = v49 + v45;
  int v51 = v44[v50];
  helper0(v45, v43, v48, v51, static_cast<int>(__simt_tid3.x));
  int v52 = 8;
  int v53 = v52 + v45;
  int v54 = v44[v53];
  int v55 = 0;
  bool v56 = v54 != v55;
  int v57;
  if (v56) {
    int v58 = 12;
    int v59 = v58 + v45;
    int v60 = v44[v59];
    int v61 = 0;
    bool v62 = v60 != v61;
    int v63;
    if (v62) {
      int v64 = 0;
      int v65 = 0;
      int v66;
      int v67;
      v66 = v64;
      v67 = v65;
      while (true) {
        int v68 = 4;
        int v69 = v67 * v68;
        int v70 = v69 + v45;
        int v71 = 16;
        int v72 = v71 + v70;
        int v73 = v44[v72];
        int v74 = 0;
        bool v75 = v73 != v74;
        v66 = v66;
        v67 = v67;
        if (!v75) break;
        int v76 = v66 + v67;
        int v77 = 1;
        int v78 = v67 + v77;
        v66 = v76;
        v67 = v78;
        break;
        ;
      }
      bool v79 = true;
      v63 = v66;
    } else {
      int v80 = 36;
      int v81 = v80 + v45;
      int v82 = v44[v81];
      int v83 = 0;
      bool v84 = v82 != v83;
      int v85;
      if (v84) {
        v85 = v45;
      } else {
        uint v86 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v87 = (int)(v86);
        v85 = v87;
      }
      v63 = v85;
    }
    v57 = v63;
  } else {
    int v88 = 0;
    int v89 = 0;
    int v90;
    int v91;
    v90 = v88;
    v91 = v89;
    while (true) {
      int v92 = 4;
      int v93 = v91 * v92;
      int v94 = v93 + v45;
      int v95 = 40;
      int v96 = v95 + v94;
      int v97 = v44[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      v90 = v90;
      v91 = v91;
      if (!v99) break;
      int v100 = v90 + v91;
      int v101 = 1;
      int v102 = v91 + v101;
      v90 = v100;
      v91 = v102;
    }
    bool v103 = true;
    v57 = v90;
  }
  int v104 = 16;
  int v105 = v104 + v45;
  bool v106 = true;
  int v107 = simt_wave_count_bits(v106);
  v43[v105] = v107;
  int v108 = 0;
  int v109 = 0;
  int v110;
  int v111;
  v110 = v108;
  v111 = v109;
  while (true) {
    int v112 = 4;
    int v113 = v111 * v112;
    int v114 = v113 + v45;
    int v115 = 60;
    int v116 = v115 + v114;
    int v117 = v44[v116];
    int v118 = 0;
    bool v119 = v117 != v118;
    v110 = v110;
    v111 = v111;
    if (!v119) break;
    int v120 = 80;
    int v121 = v120 + v45;
    int v122 = v44[v121];
    uint v123 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v124 = (int)(v123);
    int v125;
    v125 = v124;
    switch (v122) {
      case 0:
        {
        int v126 = 1;
        int v127 = v45 + v126;
        v125 = v127;
        break;
      }
      default:
        {
        int v128 = 84;
        int v129 = v128 + v45;
        int v130 = v44[v129];
        int v131 = 4;
        int v132 = v45 + v131;
        int v133;
        v133 = v132;
        switch (v130) {
          case 0:
            {
            v133 = v45;
            break;
          }
          case 1:
            {
            int v134 = 2;
            v133 = v134;
            break;
          }
          default:
            {
            int v135 = 3;
            int v136 = v45 + v135;
            v133 = v136;
            break;
          }
          case 2:
            {
            int v137 = 2;
            int v138 = v45 + v137;
            v133 = v138;
            break;
          }
        }
        bool v139 = true;
        v125 = v133;
        break;
      }
      case 1:
        {
        int v140 = 0;
        int v141 = 0;
        int v142;
        int v143;
        v142 = v140;
        v143 = v141;
        while (true) {
          int v144 = 4;
          int v145 = v143 * v144;
          int v146 = v145 + v45;
          int v147 = 88;
          int v148 = v147 + v146;
          int v149 = v44[v148];
          int v150 = 0;
          bool v151 = v149 != v150;
          v142 = v142;
          v143 = v143;
          if (!v151) break;
          int v152 = v142 + v143;
          int v153 = 1;
          int v154 = v143 + v153;
          v142 = v152;
          v143 = v154;
          break;
          ;
        }
        bool v155 = true;
        v125 = v142;
        break;
      }
    }
    bool v156 = true;
    int v157 = v110 + v125;
    int v158 = 1;
    int v159 = v111 + v158;
    v110 = v157;
    v111 = v159;
  }
  bool v160 = true;
  int v161 = 32;
  int v162 = v161 + v45;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v43[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
