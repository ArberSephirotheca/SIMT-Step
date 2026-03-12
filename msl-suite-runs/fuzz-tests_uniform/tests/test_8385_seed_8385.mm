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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6;
  v6 = v5;
  switch (v3) {
    case 0:
      {
      int v7 = 3;
      int v8;
      v8 = v7;
      switch (v3) {
        case 0:
          {
          int v9 = 0;
          bool v10 = v2 != v9;
          int v11;
          if (v10) {
            int v12 = 1;
            int v13 = v0 + v12;
            v11 = v13;
          } else {
            int v14 = 4;
            v11 = v14;
          }
          int v15 = 3;
          int v16 = v0 + v15;
          v8 = v11;
          break;
        }
        default:
          {
          v8 = v0;
          break;
        }
      }
      v6 = v8;
      break;
    }
    default:
      {
      int v17 = 3;
      int v18 = v3 % v17;
      int v19;
      v19 = v0;
      switch (v18) {
        default:
          {
          int v20 = 3;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v0 + v22;
          int v24;
          v24 = v23;
          switch (v21) {
            default:
              {
              int v25 = 4;
              v24 = v25;
              break;
            }
            case 0:
              {
              int v26 = 3;
              v24 = v26;
            }
            case 1:
              {
              v24 = v0;
              break;
            }
          }
          int v27 = 2;
          int v28 = v0 + v27;
          v19 = v24;
        }
        case 0:
          {
          int v29 = 0;
          bool v30 = v2 != v29;
          int v31;
          if (v30) {
            v31 = v0;
          } else {
            v31 = v0;
          }
          int v32 = 0;
          int v33 = v0 + v32;
          v19 = v31;
        }
        case 1:
          {
          int v34 = 0;
          int v35 = 0;
          int v36;
          int v37;
          v36 = v34;
          v37 = v35;
          while (true) {
            int v38 = 4;
            int v39 = v3 % v38;
            int v40 = 1;
            int v41 = v39 + v40;
            bool v42 = v37 < v41;
            v36 = v36;
            v37 = v37;
            if (!v42) break;
            int v43 = 4;
            int v44 = 1;
            int v45 = v37 + v44;
            v36 = v43;
            v37 = v45;
          }
          int v46 = 1;
          int v47 = v0 + v46;
          v19 = v36;
          break;
        }
        case 2:
          {
          int v48 = 0;
          bool v49 = v2 != v48;
          int v50;
          if (v49) {
            v50 = v0;
          } else {
            int v51 = 4;
            int v52 = v0 + v51;
            v50 = v52;
          }
          int v53 = 0;
          v19 = v50;
          break;
        }
      }
      v6 = v19;
      break;
    }
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  return;
}

kernel void kernel_main(device int* v58 [[buffer(0)]], device int* v59 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v60 = static_cast<int>(__simt_tid3.x);
  int v61 = 0;
  int v62 = v61 + v60;
  int v63 = v59[v62];
  int v64 = 4;
  int v65 = v64 + v60;
  int v66 = v59[v65];
  helper0(v60, v58, v63, v66, static_cast<int>(__simt_tid3.x));
  int v67 = 0;
  int v68 = 0;
  int v69;
  int v70;
  v69 = v67;
  v70 = v68;
  while (true) {
    int v71 = 4;
    int v72 = v70 * v71;
    int v73 = v72 + v60;
    int v74 = 8;
    int v75 = v74 + v73;
    int v76 = v59[v75];
    int v77 = 0;
    bool v78 = v76 != v77;
    v69 = v69;
    v70 = v70;
    if (!v78) break;
    int v79 = v69 + v70;
    int v80 = 1;
    int v81 = v70 + v80;
    v69 = v79;
    v70 = v81;
  }
  bool v82 = true;
  int v83 = 16;
  int v84 = v83 + v60;
  bool v85 = true;
  int v86 = simt_wave_count_bits(v85);
  v58[v84] = v86;
  uint v87 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v88 = (int)(v87);
  int v89 = 0;
  int v90 = 0;
  int v91;
  int v92;
  v91 = v89;
  v92 = v90;
  while (true) {
    int v93 = 4;
    int v94 = v92 * v93;
    int v95 = v94 + v60;
    int v96 = 28;
    int v97 = v96 + v95;
    int v98 = v59[v97];
    int v99 = 0;
    bool v100 = v98 != v99;
    v91 = v91;
    v92 = v92;
    if (!v100) break;
    int v101 = v91 + v92;
    int v102 = 1;
    int v103 = v92 + v102;
    v91 = v101;
    v92 = v103;
    continue;
    ;
  }
  bool v104 = true;
  int v105 = 32;
  int v106 = v105 + v60;
  bool v107 = true;
  int v108 = simt_wave_count_bits(v107);
  v58[v106] = v108;
  int v109 = 48;
  int v110 = v109 + v60;
  int v111 = v59[v110];
  uint v112 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v113 = (int)(v112);
  int v114;
  v114 = v113;
  switch (v111) {
    default:
      {
      int v115 = 52;
      int v116 = v115 + v60;
      int v117 = v59[v116];
      int v118 = 4;
      int v119 = v60 + v118;
      int v120;
      v120 = v119;
      switch (v117) {
        case 0:
          {
          int v121 = 0;
          int v122 = 0;
          int v123;
          int v124;
          v123 = v121;
          v124 = v122;
          while (true) {
            int v125 = 4;
            int v126 = v124 * v125;
            int v127 = v126 + v60;
            int v128 = 56;
            int v129 = v128 + v127;
            int v130 = v59[v129];
            int v131 = 0;
            bool v132 = v130 != v131;
            v123 = v123;
            v124 = v124;
            if (!v132) break;
            int v133 = v123 + v124;
            int v134 = 1;
            int v135 = v124 + v134;
            v123 = v133;
            v124 = v135;
            break;
            ;
          }
          bool v136 = true;
          v120 = v123;
          break;
        }
        default:
          {
          int v137 = 76;
          int v138 = v137 + v60;
          int v139 = v59[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          int v142;
          if (v141) {
            int v143 = 1;
            int v144 = v60 + v143;
            v142 = v144;
          } else {
            v142 = v60;
          }
          v120 = v142;
        }
        case 1:
          {
          int v145 = 0;
          int v146 = 0;
          int v147;
          int v148;
          v147 = v145;
          v148 = v146;
          while (true) {
            int v149 = 4;
            int v150 = v148 * v149;
            int v151 = v150 + v60;
            int v152 = 80;
            int v153 = v152 + v151;
            int v154 = v59[v153];
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
          v120 = v147;
          break;
        }
      }
      bool v161 = true;
      v114 = v120;
    }
    case 0:
      {
      int v162 = 4;
      v114 = v162;
      break;
    }
  }
  bool v163 = true;
  int v164 = 48;
  int v165 = v164 + v60;
  bool v166 = true;
  int v167 = simt_wave_count_bits(v166);
  v58[v165] = v167;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
