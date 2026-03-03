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
  int v5 = v0 + v4;
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    v8 = v10;
  } else {
    int v11 = 2;
    int v12 = v3 % v11;
    uint v13 = simt_lane_id(__simt_tid);
    int v14 = (int)(v13);
    int v15;
    v15 = v14;
    switch (v12) {
      default:
        {
        int v16 = 2;
        int v17 = v0 + v16;
        v15 = v17;
        break;
      }
      case 0:
        {
        int v18 = 0;
        bool v19 = v2 != v18;
        int v20;
        if (v19) {
          int v21 = 1;
          v20 = v21;
        } else {
          v20 = v0;
        }
        int v22 = 4;
        int v23 = v0 + v22;
        v15 = v20;
      }
      case 1:
        {
        int v24 = 4;
        int v25 = v3 % v24;
        int v26 = 0;
        int v27;
        v27 = v26;
        switch (v25) {
          case 0:
            {
            v27 = v0;
            break;
          }
          case 1:
            {
            int v28 = 1;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
          default:
            {
            int v30 = 4;
            int v31 = v0 + v30;
            v27 = v31;
            break;
          }
          case 2:
            {
            v27 = v0;
            break;
          }
        }
        int v32 = 1;
        v15 = v27;
        break;
      }
    }
    uint v33 = simt_subgroup_id(__simt_tid);
    int v34 = (int)(v33);
    v8 = v15;
  }
  bool v35 = true;
  int v36 = simt_wave_count_bits(v35);
  int v37 = 0;
  int v38 = v37 + v0;
  v1[v38] = v36;
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  int v54 = 4;
  int v55 = v44 + v54;
  int v56;
  v56 = v55;
  switch (v53) {
    default:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v60 * v61;
        int v63 = v62 + v44;
        int v64 = 12;
        int v65 = v64 + v63;
        int v66 = v43[v65];
        int v67 = 0;
        bool v68 = v66 != v67;
        v59 = v59;
        v60 = v60;
        if (!v68) break;
        int v69 = v59 + v60;
        int v70 = 1;
        int v71 = v60 + v70;
        v59 = v69;
        v60 = v71;
      }
      bool v72 = true;
      v56 = v59;
      break;
    }
    case 0:
      {
      v56 = v44;
      break;
    }
  }
  bool v73 = true;
  int v74 = 16;
  int v75 = v74 + v44;
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  v42[v75] = v77;
  int v78 = 32;
  int v79 = v78 + v44;
  int v80 = v43[v79];
  int v81 = 0;
  bool v82 = v80 != v81;
  int v83;
  if (v82) {
    int v84 = 2;
    int v85 = v44 + v84;
    v83 = v85;
  } else {
    int v86 = 0;
    int v87 = 0;
    int v88;
    int v89;
    v88 = v86;
    v89 = v87;
    while (true) {
      int v90 = 4;
      int v91 = v89 * v90;
      int v92 = v91 + v44;
      int v93 = 36;
      int v94 = v93 + v92;
      int v95 = v43[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      v88 = v88;
      v89 = v89;
      if (!v97) break;
      int v98 = 56;
      int v99 = v98 + v44;
      int v100 = v43[v99];
      uint v101 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v102 = (int)(v101);
      int v103;
      v103 = v102;
      switch (v100) {
        case 0:
          {
          v103 = v44;
          break;
        }
        case 1:
          {
          int v104 = 0;
          v103 = v104;
          break;
        }
        default:
          {
          int v105 = 4;
          int v106 = v44 + v105;
          v103 = v106;
          break;
        }
      }
      bool v107 = true;
      int v108 = v88 + v103;
      int v109 = 1;
      int v110 = v89 + v109;
      v88 = v108;
      v89 = v110;
    }
    bool v111 = true;
    v83 = v88;
  }
  int v112 = 32;
  int v113 = v112 + v44;
  bool v114 = true;
  int v115 = simt_wave_count_bits(v114);
  v42[v113] = v115;
  int v116 = 60;
  int v117 = v116 + v44;
  int v118 = v43[v117];
  int v119 = 0;
  bool v120 = v118 != v119;
  int v121;
  if (v120) {
    int v122 = 64;
    int v123 = v122 + v44;
    int v124 = v43[v123];
    int v125 = 0;
    bool v126 = v124 != v125;
    int v127;
    if (v126) {
      int v128 = 0;
      int v129 = 0;
      int v130;
      int v131;
      v130 = v128;
      v131 = v129;
      while (true) {
        int v132 = 4;
        int v133 = v131 * v132;
        int v134 = v133 + v44;
        int v135 = 68;
        int v136 = v135 + v134;
        int v137 = v43[v136];
        int v138 = 0;
        bool v139 = v137 != v138;
        v130 = v130;
        v131 = v131;
        if (!v139) break;
        int v140 = v130 + v131;
        int v141 = 1;
        int v142 = v131 + v141;
        v130 = v140;
        v131 = v142;
        break;
        ;
      }
      bool v143 = true;
      v127 = v130;
    } else {
      int v144 = 88;
      int v145 = v144 + v44;
      int v146 = v43[v145];
      int v147 = 0;
      bool v148 = v146 != v147;
      int v149;
      if (v148) {
        int v150 = 4;
        v149 = v150;
      } else {
        int v151 = 0;
        int v152 = v44 + v151;
        v149 = v152;
      }
      v127 = v149;
    }
    v121 = v127;
  } else {
    int v153 = 0;
    int v154 = 0;
    int v155;
    int v156;
    v155 = v153;
    v156 = v154;
    while (true) {
      int v157 = 4;
      int v158 = v156 * v157;
      int v159 = v158 + v44;
      int v160 = 92;
      int v161 = v160 + v159;
      int v162 = v43[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      v155 = v155;
      v156 = v156;
      if (!v164) break;
      int v165 = v155 + v156;
      int v166 = 1;
      int v167 = v156 + v166;
      v155 = v165;
      v156 = v167;
      continue;
      ;
    }
    bool v168 = true;
    v121 = v155;
  }
  int v169 = 48;
  int v170 = v169 + v44;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v42[v170] = v172;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
