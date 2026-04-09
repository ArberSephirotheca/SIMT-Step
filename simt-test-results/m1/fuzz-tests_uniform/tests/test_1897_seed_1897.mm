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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      v8 = v0;
    }
    default:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 0;
          int v13 = 0;
          int v14;
          int v15;
          v14 = v12;
          v15 = v13;
          while (true) {
            int v16 = 4;
            int v17 = v3 % v16;
            int v18 = 1;
            int v19 = v17 + v18;
            bool v20 = v15 < v19;
            v14 = v14;
            v15 = v15;
            if (!v20) break;
            int v21 = 1;
            int v22 = v15 + v21;
            v14 = v0;
            v15 = v22;
          }
          int v23 = 0;
          v11 = v14;
          break;
        }
        case 1:
          {
          int v24 = 0;
          bool v25 = v2 != v24;
          int v26;
          if (v25) {
            int v27 = 0;
            v26 = v27;
          } else {
            int v28 = 2;
            v26 = v28;
          }
          int v29 = 3;
          v11 = v26;
          break;
        }
        default:
          {
          int v30 = 4;
          int v31 = v0 + v30;
          v11 = v31;
          break;
        }
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34;
      v34 = v0;
      switch (v33) {
        case 0:
          {
          int v35 = 4;
          int v36;
          v36 = v35;
          switch (v3) {
            default:
              {
              int v37 = 1;
              v36 = v37;
              break;
            }
            case 0:
              {
              int v38 = 1;
              v36 = v38;
              break;
            }
          }
          int v39 = 2;
          int v40 = v0 + v39;
          v34 = v36;
        }
        case 1:
          {
          int v41 = 0;
          int v42 = 0;
          int v43;
          int v44;
          v43 = v41;
          v44 = v42;
          while (true) {
            int v45 = 4;
            int v46 = v3 % v45;
            int v47 = 1;
            int v48 = v46 + v47;
            bool v49 = v44 < v48;
            v43 = v43;
            v44 = v44;
            if (!v49) break;
            int v50 = 3;
            int v51 = 1;
            int v52 = v44 + v51;
            v43 = v50;
            v44 = v52;
            continue;
            ;
          }
          int v53 = 0;
          v34 = v43;
        }
        default:
          {
          int v54 = 0;
          int v55 = 0;
          int v56;
          int v57;
          v56 = v54;
          v57 = v55;
          while (true) {
            int v58 = 4;
            int v59 = v3 % v58;
            int v60 = 1;
            int v61 = v59 + v60;
            bool v62 = v57 < v61;
            v56 = v56;
            v57 = v57;
            if (!v62) break;
            int v63 = 1;
            int v64 = v57 + v63;
            v56 = v0;
            v57 = v64;
          }
          int v65 = 3;
          v34 = v56;
        }
        case 2:
          {
          int v66 = 0;
          bool v67 = v2 != v66;
          int v68;
          if (v67) {
            int v69 = 2;
            v68 = v69;
          } else {
            v68 = v0;
          }
          int v70 = 0;
          int v71 = v0 + v70;
          v34 = v68;
          break;
        }
      }
      v8 = v34;
      break;
    }
  }
  bool v72 = true;
  int v73 = simt_wave_count_bits(v72);
  int v74 = 0;
  int v75 = v74 + v0;
  v1[v75] = v73;
  int v76 = 0;
  bool v77 = v2 != v76;
  int v78 = v77 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 8;
  int v89 = v88 + v81;
  int v90 = v80[v89];
  int v91;
  v91 = v81;
  switch (v90) {
    case 0:
      {
      v91 = v81;
      break;
    }
    default:
      {
      int v92 = 2;
      int v93 = v81 + v92;
      v91 = v93;
      break;
    }
    case 1:
      {
      int v94 = 12;
      int v95 = v94 + v81;
      int v96 = v80[v95];
      int v97 = 0;
      bool v98 = v96 != v97;
      int v99;
      if (v98) {
        int v100 = 0;
        int v101 = 0;
        int v102;
        int v103;
        v102 = v100;
        v103 = v101;
        while (true) {
          int v104 = 4;
          int v105 = v103 * v104;
          int v106 = v105 + v81;
          int v107 = 16;
          int v108 = v107 + v106;
          int v109 = v80[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          v102 = v102;
          v103 = v103;
          if (!v111) break;
          int v112 = v102 + v103;
          int v113 = 1;
          int v114 = v103 + v113;
          v102 = v112;
          v103 = v114;
          continue;
          ;
        }
        bool v115 = true;
        v99 = v102;
      } else {
        int v116 = 3;
        int v117 = v81 + v116;
        v99 = v117;
      }
      v91 = v99;
      break;
    }
  }
  bool v118 = true;
  int v119 = 16;
  int v120 = v119 + v81;
  bool v121 = true;
  int v122 = simt_wave_count_bits(v121);
  v79[v120] = v122;
  int v123 = 36;
  int v124 = v123 + v81;
  int v125 = v80[v124];
  int v126 = 0;
  bool v127 = v125 != v126;
  int v128;
  if (v127) {
    int v129 = 0;
    int v130 = 0;
    int v131;
    int v132;
    v131 = v129;
    v132 = v130;
    while (true) {
      int v133 = 4;
      int v134 = v132 * v133;
      int v135 = v134 + v81;
      int v136 = 40;
      int v137 = v136 + v135;
      int v138 = v80[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      v131 = v131;
      v132 = v132;
      if (!v140) break;
      int v141 = v131 + v132;
      int v142 = 1;
      int v143 = v132 + v142;
      v131 = v141;
      v132 = v143;
    }
    bool v144 = true;
    v128 = v131;
  } else {
    int v145 = 0;
    int v146 = 0;
    int v147;
    int v148;
    v147 = v145;
    v148 = v146;
    while (true) {
      int v149 = 4;
      int v150 = v148 * v149;
      int v151 = v150 + v81;
      int v152 = 60;
      int v153 = v152 + v151;
      int v154 = v80[v153];
      int v155 = 0;
      bool v156 = v154 != v155;
      v147 = v147;
      v148 = v148;
      if (!v156) break;
      int v157 = 80;
      int v158 = v157 + v81;
      int v159 = v80[v158];
      uint v160 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v161 = (int)(v160);
      int v162;
      v162 = v161;
      switch (v159) {
        case 0:
          {
          int v163 = 4;
          v162 = v163;
          break;
        }
        case 1:
          {
          v162 = v81;
          break;
        }
        default:
          {
          v162 = v81;
          break;
        }
      }
      bool v164 = true;
      int v165 = v147 + v162;
      int v166 = 1;
      int v167 = v148 + v166;
      v147 = v165;
      v148 = v167;
    }
    bool v168 = true;
    v128 = v147;
  }
  int v169 = 32;
  int v170 = v169 + v81;
  bool v171 = true;
  int v172 = simt_wave_count_bits(v171);
  v79[v170] = v172;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
