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
  uint v4 = simt_lane_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 1;
    int v16 = v9 + v15;
    v8 = v0;
    v9 = v16;
    continue;
    ;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 0;
  bool v22 = v2 != v21;
  int v23 = v22 ? v5 : v8;
  int v24 = 2;
  int v25 = v3 % v24;
  int v26 = 1;
  int v27;
  v27 = v26;
  switch (v25) {
    default:
      {
      int v28 = 4;
      int v29 = v3 % v28;
      int v30 = 0;
      int v31;
      v31 = v30;
      switch (v29) {
        case 0:
          {
          int v32 = 0;
          bool v33 = v2 != v32;
          int v34;
          if (v33) {
            v34 = v0;
          } else {
            int v35 = 2;
            int v36 = v0 + v35;
            v34 = v36;
          }
          int v37 = 0;
          int v38 = v0 + v37;
          v31 = v34;
        }
        case 1:
          {
          int v39 = 0;
          int v40 = 0;
          int v41;
          int v42;
          v41 = v39;
          v42 = v40;
          while (true) {
            int v43 = 4;
            int v44 = v3 % v43;
            int v45 = 1;
            int v46 = v44 + v45;
            bool v47 = v42 < v46;
            v41 = v41;
            v42 = v42;
            if (!v47) break;
            int v48 = 1;
            int v49 = v42 + v48;
            v41 = v0;
            v42 = v49;
          }
          int v50 = 1;
          int v51 = v0 + v50;
          v31 = v41;
        }
        case 2:
          {
          v31 = v0;
          break;
        }
        default:
          {
          int v52 = 0;
          int v53 = 0;
          int v54;
          int v55;
          v54 = v52;
          v55 = v53;
          while (true) {
            int v56 = 4;
            int v57 = v3 % v56;
            int v58 = 1;
            int v59 = v57 + v58;
            bool v60 = v55 < v59;
            v54 = v54;
            v55 = v55;
            if (!v60) break;
            int v61 = 1;
            int v62 = v55 + v61;
            v54 = v0;
            v55 = v62;
          }
          v31 = v54;
          break;
        }
      }
      int v63 = 4;
      int v64 = v0 + v63;
      v27 = v31;
      break;
    }
    case 0:
      {
      int v65 = 0;
      bool v66 = v2 != v65;
      int v67;
      if (v66) {
        int v68 = 0;
        int v69 = 0;
        int v70;
        int v71;
        v70 = v68;
        v71 = v69;
        while (true) {
          int v72 = 4;
          int v73 = v3 % v72;
          int v74 = 1;
          int v75 = v73 + v74;
          bool v76 = v71 < v75;
          v70 = v70;
          v71 = v71;
          if (!v76) break;
          int v77 = 2;
          int v78 = 1;
          int v79 = v71 + v78;
          v70 = v77;
          v71 = v79;
          break;
          ;
        }
        v67 = v70;
      } else {
        v67 = v0;
      }
      int v80 = 0;
      int v81 = v0 + v80;
      v27 = v67;
      break;
    }
  }
  bool v82 = true;
  int v83 = simt_wave_count_bits(v82);
  int v84 = 16;
  int v85 = v84 + v0;
  v1[v85] = v83;
  int v86 = 0;
  bool v87 = v2 != v86;
  int v88 = v87 ? v23 : v27;
  return;
}

kernel void kernel_main(device int* v89 [[buffer(0)]], device int* v90 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v91 = static_cast<int>(__simt_tid3.x);
  int v92 = 0;
  int v93 = v92 + v91;
  int v94 = v90[v93];
  int v95 = 4;
  int v96 = v95 + v91;
  int v97 = v90[v96];
  helper0(v91, v89, v94, v97, static_cast<int>(__simt_tid3.x));
  int v98 = 8;
  int v99 = v98 + v91;
  int v100 = v90[v99];
  int v101 = 0;
  bool v102 = v100 != v101;
  int v103;
  if (v102) {
    int v104 = 1;
    int v105 = v91 + v104;
    v103 = v105;
  } else {
    uint v106 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v107 = (int)(v106);
    v103 = v107;
  }
  int v108 = 32;
  int v109 = v108 + v91;
  bool v110 = true;
  int v111 = simt_wave_count_bits(v110);
  v89[v109] = v111;
  int v112 = 12;
  int v113 = v112 + v91;
  int v114 = v90[v113];
  int v115 = 0;
  bool v116 = v114 != v115;
  int v117;
  if (v116) {
    int v118 = 16;
    int v119 = v118 + v91;
    int v120 = v90[v119];
    uint v121 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v122 = (int)(v121);
    int v123;
    v123 = v122;
    switch (v120) {
      default:
        {
        v123 = v91;
        break;
      }
      case 0:
        {
        int v124 = 20;
        int v125 = v124 + v91;
        int v126 = v90[v125];
        int v127 = 0;
        bool v128 = v126 != v127;
        int v129;
        if (v128) {
          int v130 = 3;
          int v131 = v91 + v130;
          v129 = v131;
        } else {
          int v132 = 2;
          v129 = v132;
        }
        v123 = v129;
      }
      case 1:
        {
        int v133 = 0;
        int v134 = 0;
        int v135;
        int v136;
        v135 = v133;
        v136 = v134;
        while (true) {
          int v137 = 4;
          int v138 = v136 * v137;
          int v139 = v138 + v91;
          int v140 = 24;
          int v141 = v140 + v139;
          int v142 = v90[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          v135 = v135;
          v136 = v136;
          if (!v144) break;
          int v145 = v135 + v136;
          int v146 = 1;
          int v147 = v136 + v146;
          v135 = v145;
          v136 = v147;
        }
        bool v148 = true;
        v123 = v135;
      }
      case 2:
        {
        int v149 = 4;
        v123 = v149;
        break;
      }
    }
    bool v150 = true;
    v117 = v123;
  } else {
    int v151 = 0;
    int v152 = 0;
    int v153;
    int v154;
    v153 = v151;
    v154 = v152;
    while (true) {
      int v155 = 4;
      int v156 = v154 * v155;
      int v157 = v156 + v91;
      int v158 = 44;
      int v159 = v158 + v157;
      int v160 = v90[v159];
      int v161 = 0;
      bool v162 = v160 != v161;
      v153 = v153;
      v154 = v154;
      if (!v162) break;
      int v163 = v153 + v154;
      int v164 = 1;
      int v165 = v154 + v164;
      v153 = v163;
      v154 = v165;
    }
    bool v166 = true;
    v117 = v153;
  }
  int v167 = 48;
  int v168 = v167 + v91;
  bool v169 = true;
  int v170 = simt_wave_count_bits(v169);
  v89[v168] = v170;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
