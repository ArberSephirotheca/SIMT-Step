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
    uint v7 = simt_lane_id(__simt_tid);
    int v8 = (int)(v7);
    v6 = v8;
  } else {
    int v9 = 3;
    int v10 = v3 % v9;
    uint v11 = simt_lane_id(__simt_tid);
    int v12 = (int)(v11);
    int v13;
    v13 = v12;
    switch (v10) {
      case 0:
        {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          int v17 = 3;
          int v18 = v0 + v17;
          v16 = v18;
        } else {
          int v19 = 2;
          v16 = v19;
        }
        v13 = v16;
      }
      case 1:
        {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          int v23 = 4;
          int v24 = v0 + v23;
          v22 = v24;
        } else {
          int v25 = 4;
          v22 = v25;
        }
        int v26 = 1;
        int v27 = v0 + v26;
        v13 = v22;
        break;
      }
      default:
        {
        int v28 = 2;
        int v29 = v3 % v28;
        int v30;
        v30 = v0;
        switch (v29) {
          default:
            {
            v30 = v0;
            break;
          }
          case 0:
            {
            int v31 = 3;
            v30 = v31;
          }
          case 1:
            {
            int v32 = 1;
            int v33 = v0 + v32;
            v30 = v33;
            break;
          }
        }
        int v34 = 2;
        int v35 = v0 + v34;
        v13 = v30;
        break;
      }
    }
    int v36 = 4;
    int v37 = v0 + v36;
    v6 = v13;
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
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
  uint v54 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56;
  v56 = v55;
  switch (v53) {
    case 0:
      {
      int v57 = 12;
      int v58 = v57 + v44;
      int v59 = v43[v58];
      int v60 = 0;
      bool v61 = v59 != v60;
      int v62;
      if (v61) {
        int v63 = 4;
        int v64 = v44 + v63;
        v62 = v64;
      } else {
        int v65 = 16;
        int v66 = v65 + v44;
        int v67 = v43[v66];
        int v68;
        v68 = v44;
        switch (v67) {
          case 0:
            {
            int v69 = 0;
            v68 = v69;
            break;
          }
          default:
            {
            v68 = v44;
            break;
          }
          case 1:
            {
            int v70 = 3;
            int v71 = v44 + v70;
            v68 = v71;
            break;
          }
          case 2:
            {
            v68 = v44;
            break;
          }
        }
        bool v72 = true;
        v62 = v68;
      }
      v56 = v62;
      break;
    }
    default:
      {
      int v73 = 20;
      int v74 = v73 + v44;
      int v75 = v43[v74];
      int v76 = 0;
      bool v77 = v75 != v76;
      int v78;
      if (v77) {
        int v79 = 24;
        int v80 = v79 + v44;
        int v81 = v43[v80];
        int v82 = 3;
        int v83 = v44 + v82;
        int v84;
        v84 = v83;
        switch (v81) {
          case 0:
            {
            int v85 = 4;
            int v86 = v44 + v85;
            v84 = v86;
            break;
          }
          default:
            {
            v84 = v44;
            break;
          }
        }
        bool v87 = true;
        v78 = v84;
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
          int v94 = v93 + v44;
          int v95 = 28;
          int v96 = v95 + v94;
          int v97 = v43[v96];
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
        v78 = v90;
      }
      v56 = v78;
      break;
    }
    case 1:
      {
      v56 = v44;
      break;
    }
  }
  bool v104 = true;
  int v105 = 16;
  int v106 = v105 + v44;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v42[v106] = v108;
  int v109 = 48;
  int v110 = v109 + v44;
  int v111 = v43[v110];
  int v112 = 0;
  bool v113 = v111 != v112;
  int v114;
  if (v113) {
    uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v116 = (int)(v115);
    v114 = v116;
  } else {
    int v117 = 52;
    int v118 = v117 + v44;
    int v119 = v43[v118];
    int v120 = 1;
    int v121;
    v121 = v120;
    switch (v119) {
      default:
        {
        int v122 = 0;
        int v123 = 0;
        int v124;
        int v125;
        v124 = v122;
        v125 = v123;
        while (true) {
          int v126 = 4;
          int v127 = v125 * v126;
          int v128 = v127 + v44;
          int v129 = 56;
          int v130 = v129 + v128;
          int v131 = v43[v130];
          int v132 = 0;
          bool v133 = v131 != v132;
          v124 = v124;
          v125 = v125;
          if (!v133) break;
          int v134 = v124 + v125;
          int v135 = 1;
          int v136 = v125 + v135;
          v124 = v134;
          v125 = v136;
        }
        bool v137 = true;
        v121 = v124;
        break;
      }
      case 0:
        {
        int v138 = 76;
        int v139 = v138 + v44;
        int v140 = v43[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        int v143;
        if (v142) {
          v143 = v44;
        } else {
          v143 = v44;
        }
        v121 = v143;
        break;
      }
      case 1:
        {
        int v144 = 0;
        int v145 = 0;
        int v146;
        int v147;
        v146 = v144;
        v147 = v145;
        while (true) {
          int v148 = 4;
          int v149 = v147 * v148;
          int v150 = v149 + v44;
          int v151 = 80;
          int v152 = v151 + v150;
          int v153 = v43[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          v146 = v146;
          v147 = v147;
          if (!v155) break;
          int v156 = v146 + v147;
          int v157 = 1;
          int v158 = v147 + v157;
          v146 = v156;
          v147 = v158;
        }
        bool v159 = true;
        v121 = v146;
        break;
      }
    }
    bool v160 = true;
    v114 = v121;
  }
  int v161 = 32;
  int v162 = v161 + v44;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v42[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
