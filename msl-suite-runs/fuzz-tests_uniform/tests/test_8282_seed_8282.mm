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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 4;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v0 + v9;
      v8 = v10;
    }
    default:
      {
      int v11 = 2;
      v8 = v11;
      break;
    }
  }
  bool v12 = true;
  int v13 = simt_wave_count_bits(v12);
  int v14 = 0;
  int v15 = v14 + v0;
  v1[v15] = v13;
  int v16 = 0;
  bool v17 = v2 != v16;
  int v18;
  if (v17) {
    int v19 = 0;
    bool v20 = v2 != v19;
    int v21;
    if (v20) {
      int v22 = 3;
      int v23 = v3 % v22;
      int v24 = 1;
      int v25 = v0 + v24;
      int v26;
      v26 = v25;
      switch (v23) {
        case 0:
          {
          int v27 = 3;
          int v28 = v0 + v27;
          v26 = v28;
          break;
        }
        default:
          {
          int v29 = 3;
          v26 = v29;
          break;
        }
        case 1:
          {
          int v30 = 3;
          int v31 = v0 + v30;
          v26 = v31;
          break;
        }
      }
      int v32 = 1;
      int v33 = v0 + v32;
      v21 = v26;
    } else {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 0;
        v36 = v37;
      } else {
        uint v38 = simt_subgroup_id(__simt_tid);
        int v39 = (int)(v38);
        v36 = v39;
      }
      int v40 = 2;
      v21 = v36;
    }
    uint v41 = simt_subgroup_id(__simt_tid);
    int v42 = (int)(v41);
    v18 = v21;
  } else {
    int v43 = 0;
    int v44 = 0;
    int v45;
    int v46;
    v45 = v43;
    v46 = v44;
    while (true) {
      int v47 = 4;
      int v48 = v3 % v47;
      int v49 = 1;
      int v50 = v48 + v49;
      bool v51 = v46 < v50;
      v45 = v45;
      v46 = v46;
      if (!v51) break;
      int v52 = 2;
      int v53 = v3 % v52;
      uint v54 = simt_subgroup_id(__simt_tid);
      int v55 = (int)(v54);
      int v56;
      v56 = v55;
      switch (v53) {
        case 0:
          {
          int v57 = 2;
          v56 = v57;
          break;
        }
        case 1:
          {
          int v58 = 1;
          int v59 = v0 + v58;
          v56 = v59;
        }
        default:
          {
          int v60 = 0;
          int v61 = v0 + v60;
          v56 = v61;
          break;
        }
      }
      uint v62 = simt_subgroup_id(__simt_tid);
      int v63 = (int)(v62);
      int v64 = 1;
      int v65 = v46 + v64;
      v45 = v56;
      v46 = v65;
      break;
      ;
    }
    int v66 = 0;
    v18 = v45;
  }
  bool v67 = true;
  int v68 = simt_wave_count_bits(v67);
  int v69 = 16;
  int v70 = v69 + v0;
  v1[v70] = v68;
  int v71 = 0;
  bool v72 = v2 != v71;
  int v73 = v72 ? v8 : v18;
  return;
}

kernel void kernel_main(device int* v74 [[buffer(0)]], device int* v75 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v76 = static_cast<int>(__simt_tid3.x);
  int v77 = 0;
  int v78 = v77 + v76;
  int v79 = v75[v78];
  int v80 = 4;
  int v81 = v80 + v76;
  int v82 = v75[v81];
  helper0(v76, v74, v79, v82, static_cast<int>(__simt_tid3.x));
  int v83 = 8;
  int v84 = v83 + v76;
  int v85 = v75[v84];
  int v86 = 0;
  bool v87 = v85 != v86;
  int v88;
  if (v87) {
    int v89 = 0;
    int v90 = 0;
    int v91;
    int v92;
    v91 = v89;
    v92 = v90;
    while (true) {
      int v93 = 4;
      int v94 = v92 * v93;
      int v95 = v94 + v76;
      int v96 = 12;
      int v97 = v96 + v95;
      int v98 = v75[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      v91 = v91;
      v92 = v92;
      if (!v100) break;
      int v101 = 32;
      int v102 = v101 + v76;
      int v103 = v75[v102];
      int v104 = 0;
      bool v105 = v103 != v104;
      int v106;
      if (v105) {
        uint v107 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v108 = (int)(v107);
        v106 = v108;
      } else {
        v106 = v76;
      }
      int v109 = v91 + v106;
      int v110 = 1;
      int v111 = v92 + v110;
      v91 = v109;
      v92 = v111;
    }
    bool v112 = true;
    v88 = v91;
  } else {
    int v113 = 3;
    int v114 = v76 + v113;
    v88 = v114;
  }
  int v115 = 32;
  int v116 = v115 + v76;
  bool v117 = true;
  int v118 = simt_wave_count_bits(v117);
  v74[v116] = v118;
  int v119 = 0;
  int v120 = 0;
  int v121;
  int v122;
  v121 = v119;
  v122 = v120;
  while (true) {
    int v123 = 4;
    int v124 = v122 * v123;
    int v125 = v124 + v76;
    int v126 = 36;
    int v127 = v126 + v125;
    int v128 = v75[v127];
    int v129 = 0;
    bool v130 = v128 != v129;
    v121 = v121;
    v122 = v122;
    if (!v130) break;
    int v131 = 56;
    int v132 = v131 + v76;
    int v133 = v75[v132];
    int v134 = 0;
    bool v135 = v133 != v134;
    int v136;
    if (v135) {
      int v137 = 60;
      int v138 = v137 + v76;
      int v139 = v75[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      int v142;
      if (v141) {
        int v143 = 0;
        int v144 = v76 + v143;
        v142 = v144;
      } else {
        int v145 = 3;
        int v146 = v76 + v145;
        v142 = v146;
      }
      v136 = v142;
    } else {
      int v147 = 64;
      int v148 = v147 + v76;
      int v149 = v75[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 2;
        v152 = v153;
      } else {
        uint v154 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v155 = (int)(v154);
        v152 = v155;
      }
      v136 = v152;
    }
    int v156 = v121 + v136;
    int v157 = 1;
    int v158 = v122 + v157;
    v121 = v156;
    v122 = v158;
  }
  bool v159 = true;
  int v160 = 48;
  int v161 = v160 + v76;
  bool v162 = true;
  int v163 = simt_wave_count_bits(v162);
  v74[v161] = v163;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
