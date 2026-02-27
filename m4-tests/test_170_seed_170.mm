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
    int v13 = 3;
    int v14 = v3 % v13;
    uint v15 = simt_subgroup_id(__simt_tid);
    int v16 = (int)(v15);
    int v17;
    v17 = v16;
    switch (v14) {
      case 0:
        {
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
          int v27 = 4;
          int v28 = v0 + v27;
          int v29 = 1;
          int v30 = v21 + v29;
          v20 = v28;
          v21 = v30;
        }
        v17 = v20;
        break;
      }
      case 1:
        {
        int v31 = 3;
        int v32 = v3 % v31;
        int v33 = 3;
        int v34 = v0 + v33;
        int v35;
        v35 = v34;
        switch (v32) {
          case 0:
            {
            int v36 = 4;
            v35 = v36;
            break;
          }
          default:
            {
            v35 = v0;
            break;
          }
          case 1:
            {
            int v37 = 4;
            v35 = v37;
            break;
          }
          case 2:
            {
            int v38 = 1;
            v35 = v38;
            break;
          }
        }
        v17 = v35;
      }
      case 2:
        {
        int v39 = 3;
        int v40 = v3 % v39;
        int v41;
        v41 = v0;
        switch (v40) {
          case 0:
            {
            int v42 = 4;
            int v43 = v0 + v42;
            v41 = v43;
            break;
          }
          default:
            {
            int v44 = 4;
            v41 = v44;
            break;
          }
          case 1:
            {
            int v45 = 2;
            v41 = v45;
          }
          case 2:
            {
            int v46 = 2;
            int v47 = v0 + v46;
            v41 = v47;
            break;
          }
        }
        int v48 = 3;
        v17 = v41;
      }
      default:
        {
        int v49 = 0;
        int v50 = 0;
        int v51;
        int v52;
        v51 = v49;
        v52 = v50;
        while (true) {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55 = 1;
          int v56 = v54 + v55;
          bool v57 = v52 < v56;
          v51 = v51;
          v52 = v52;
          if (!v57) break;
          int v58 = 0;
          int v59 = 1;
          int v60 = v52 + v59;
          v51 = v58;
          v52 = v60;
        }
        v17 = v51;
        break;
      }
    }
    bool v61 = true;
    int v62 = simt_wave_count_bits(v61);
    int v63 = 0;
    int v64 = 4;
    int v65 = v7 * v64;
    int v66 = v63 + v65;
    int v67 = v66 + v0;
    v1[v67] = v62;
    int v68 = 1;
    int v69 = v7 + v68;
    v6 = v17;
    v7 = v69;
    break;
    ;
  }
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
  int v79 = 8;
  int v80 = v79 + v72;
  int v81 = v71[v80];
  int v82;
  v82 = v72;
  switch (v81) {
    default:
      {
      int v83 = 12;
      int v84 = v83 + v72;
      int v85 = v71[v84];
      int v86 = 0;
      bool v87 = v85 != v86;
      int v88;
      if (v87) {
        v88 = v72;
      } else {
        int v89 = 1;
        v88 = v89;
      }
      v82 = v88;
      break;
    }
    case 0:
      {
      int v90 = 0;
      int v91 = 0;
      int v92;
      int v93;
      v92 = v90;
      v93 = v91;
      while (true) {
        int v94 = 4;
        int v95 = v93 * v94;
        int v96 = v95 + v72;
        int v97 = 16;
        int v98 = v97 + v96;
        int v99 = v71[v98];
        int v100 = 0;
        bool v101 = v99 != v100;
        v92 = v92;
        v93 = v93;
        if (!v101) break;
        int v102 = v92 + v93;
        int v103 = 1;
        int v104 = v93 + v103;
        bool v105 = true;
        v92 = v102;
        v93 = v104;
      }
      v82 = v92;
      break;
    }
  }
  int v106 = 0;
  int v107 = 0;
  int v108;
  int v109;
  v108 = v106;
  v109 = v107;
  while (true) {
    int v110 = 4;
    int v111 = v109 * v110;
    int v112 = v111 + v72;
    int v113 = 36;
    int v114 = v113 + v112;
    int v115 = v71[v114];
    int v116 = 0;
    bool v117 = v115 != v116;
    v108 = v108;
    v109 = v109;
    if (!v117) break;
    int v118 = 0;
    int v119 = 0;
    int v120;
    int v121;
    v120 = v118;
    v121 = v119;
    while (true) {
      int v122 = 4;
      int v123 = v121 * v122;
      int v124 = v123 + v72;
      int v125 = 56;
      int v126 = v125 + v124;
      int v127 = v71[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      v120 = v120;
      v121 = v121;
      if (!v129) break;
      int v130 = 0;
      int v131 = 0;
      int v132;
      int v133;
      v132 = v130;
      v133 = v131;
      while (true) {
        int v134 = 4;
        int v135 = v133 * v134;
        int v136 = v135 + v72;
        int v137 = 76;
        int v138 = v137 + v136;
        int v139 = v71[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        v132 = v132;
        v133 = v133;
        if (!v141) break;
        int v142 = v132 + v133;
        int v143 = 1;
        int v144 = v133 + v143;
        bool v145 = true;
        int v146 = 16;
        int v147 = 4;
        int v148 = v133 * v147;
        int v149 = v146 + v148;
        int v150 = v149 + v72;
        bool v151 = true;
        int v152 = simt_wave_count_bits(v151);
        v70[v150] = v152;
        v132 = v142;
        v133 = v144;
      }
      int v153 = v120 + v132;
      int v154 = 1;
      int v155 = v121 + v154;
      bool v156 = true;
      int v157 = 32;
      int v158 = 4;
      int v159 = v121 * v158;
      int v160 = v157 + v159;
      int v161 = v160 + v72;
      bool v162 = true;
      int v163 = simt_wave_count_bits(v162);
      v70[v161] = v163;
      v120 = v153;
      v121 = v155;
    }
    int v164 = v108 + v120;
    int v165 = 1;
    int v166 = v109 + v165;
    bool v167 = true;
    int v168 = 48;
    int v169 = 4;
    int v170 = v109 * v169;
    int v171 = v168 + v170;
    int v172 = v171 + v72;
    bool v173 = true;
    int v174 = simt_wave_count_bits(v173);
    v70[v172] = v174;
    v108 = v164;
    v109 = v166;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
