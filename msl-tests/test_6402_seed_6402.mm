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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 0;
        bool v11 = v2 != v10;
        int v12;
        if (v11) {
          int v13 = 0;
          v12 = v13;
        } else {
          int v14 = 2;
          v12 = v14;
        }
        int v15 = 3;
        v9 = v12;
      } else {
        int v16 = 0;
        int v17 = v0 + v16;
        v9 = v17;
      }
      v6 = v9;
      break;
    }
    case 1:
      {
      int v18 = 3;
      int v19 = v3 % v18;
      int v20;
      v20 = v0;
      switch (v19) {
        case 0:
          {
          int v21 = 1;
          int v22;
          v22 = v21;
          switch (v3) {
            default:
              {
              int v23 = 3;
              int v24 = v0 + v23;
              v22 = v24;
              break;
            }
            case 0:
              {
              int v25 = 0;
              v22 = v25;
              break;
            }
          }
          int v26 = 4;
          v20 = v22;
          break;
        }
        case 1:
          {
          int v27 = 0;
          int v28 = 0;
          int v29;
          int v30;
          v29 = v27;
          v30 = v28;
          while (true) {
            int v31 = 4;
            int v32 = v3 % v31;
            int v33 = 1;
            int v34 = v32 + v33;
            bool v35 = v30 < v34;
            v29 = v29;
            v30 = v30;
            if (!v35) break;
            int v36 = 4;
            int v37 = v0 + v36;
            int v38 = 1;
            int v39 = v30 + v38;
            v29 = v37;
            v30 = v39;
            break;
            ;
          }
          v20 = v29;
          break;
        }
        case 2:
          {
          int v40 = 0;
          int v41 = 0;
          int v42;
          int v43;
          v42 = v40;
          v43 = v41;
          while (true) {
            int v44 = 4;
            int v45 = v3 % v44;
            int v46 = 1;
            int v47 = v45 + v46;
            bool v48 = v43 < v47;
            v42 = v42;
            v43 = v43;
            if (!v48) break;
            int v49 = 4;
            int v50 = v0 + v49;
            int v51 = 1;
            int v52 = v43 + v51;
            v42 = v50;
            v43 = v52;
          }
          int v53 = 4;
          v20 = v42;
        }
        default:
          {
          int v54 = 0;
          bool v55 = v2 != v54;
          int v56;
          if (v55) {
            int v57 = 3;
            v56 = v57;
          } else {
            v56 = v0;
          }
          int v58 = 1;
          v20 = v56;
          break;
        }
      }
      int v59 = 2;
      int v60 = v0 + v59;
      v6 = v20;
    }
    default:
      {
      int v61 = 0;
      int v62 = 0;
      int v63;
      int v64;
      v63 = v61;
      v64 = v62;
      while (true) {
        int v65 = 4;
        int v66 = v3 % v65;
        int v67 = 1;
        int v68 = v66 + v67;
        bool v69 = v64 < v68;
        v63 = v63;
        v64 = v64;
        if (!v69) break;
        int v70 = 0;
        int v71 = 0;
        int v72;
        int v73;
        v72 = v70;
        v73 = v71;
        while (true) {
          int v74 = 4;
          int v75 = v3 % v74;
          int v76 = 1;
          int v77 = v75 + v76;
          bool v78 = v73 < v77;
          v72 = v72;
          v73 = v73;
          if (!v78) break;
          int v79 = 1;
          int v80 = 1;
          int v81 = v73 + v80;
          v72 = v79;
          v73 = v81;
        }
        int v82 = 3;
        int v83 = v0 + v82;
        int v84 = 1;
        int v85 = v64 + v84;
        v63 = v72;
        v64 = v85;
      }
      int v86 = 0;
      v6 = v63;
      break;
    }
  }
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  int v89 = 0;
  int v90 = v89 + v0;
  v1[v90] = v88;
  return;
}

kernel void kernel_main(device int* v91 [[buffer(0)]], device int* v92 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v93 = static_cast<int>(__simt_tid3.x);
  int v94 = 0;
  int v95 = v94 + v93;
  int v96 = v92[v95];
  int v97 = 4;
  int v98 = v97 + v93;
  int v99 = v92[v98];
  helper0(v93, v91, v96, v99, static_cast<int>(__simt_tid3.x));
  int v100 = 0;
  int v101 = 0;
  int v102;
  int v103;
  v102 = v100;
  v103 = v101;
  while (true) {
    int v104 = 4;
    int v105 = v103 * v104;
    int v106 = v105 + v93;
    int v107 = 8;
    int v108 = v107 + v106;
    int v109 = v92[v108];
    int v110 = 0;
    bool v111 = v109 != v110;
    v102 = v102;
    v103 = v103;
    if (!v111) break;
    int v112 = 0;
    int v113 = 0;
    int v114;
    int v115;
    v114 = v112;
    v115 = v113;
    while (true) {
      int v116 = 4;
      int v117 = v115 * v116;
      int v118 = v117 + v93;
      int v119 = 28;
      int v120 = v119 + v118;
      int v121 = v92[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      v114 = v114;
      v115 = v115;
      if (!v123) break;
      int v124 = v114 + v115;
      int v125 = 1;
      int v126 = v115 + v125;
      v114 = v124;
      v115 = v126;
    }
    bool v127 = true;
    int v128 = v102 + v114;
    int v129 = 1;
    int v130 = v103 + v129;
    v102 = v128;
    v103 = v130;
  }
  bool v131 = true;
  int v132 = 16;
  int v133 = v132 + v93;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v91[v133] = v135;
  int v136 = 48;
  int v137 = v136 + v93;
  int v138 = v92[v137];
  int v139 = 0;
  bool v140 = v138 != v139;
  int v141;
  if (v140) {
    int v142 = 0;
    int v143 = 0;
    int v144;
    int v145;
    v144 = v142;
    v145 = v143;
    while (true) {
      int v146 = 4;
      int v147 = v145 * v146;
      int v148 = v147 + v93;
      int v149 = 52;
      int v150 = v149 + v148;
      int v151 = v92[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      v144 = v144;
      v145 = v145;
      if (!v153) break;
      int v154 = v144 + v145;
      int v155 = 1;
      int v156 = v145 + v155;
      v144 = v154;
      v145 = v156;
      continue;
      ;
    }
    bool v157 = true;
    v141 = v144;
  } else {
    int v158 = 4;
    v141 = v158;
  }
  int v159 = 32;
  int v160 = v159 + v93;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v91[v160] = v162;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
