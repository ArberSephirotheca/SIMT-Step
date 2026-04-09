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
      v6 = v0;
      break;
    }
    case 1:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 3;
        int v11 = v0 + v10;
        v9 = v11;
      } else {
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
          int v21 = 4;
          int v22 = v0 + v21;
          int v23 = 1;
          int v24 = v15 + v23;
          v14 = v22;
          v15 = v24;
        }
        v9 = v14;
      }
      v6 = v9;
      break;
    }
    default:
      {
      int v25 = 0;
      int v26 = 0;
      int v27;
      int v28;
      v27 = v25;
      v28 = v26;
      while (true) {
        int v29 = 4;
        int v30 = v3 % v29;
        int v31 = 1;
        int v32 = v30 + v31;
        bool v33 = v28 < v32;
        v27 = v27;
        v28 = v28;
        if (!v33) break;
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
          int v43 = 1;
          int v44 = 1;
          int v45 = v37 + v44;
          v36 = v43;
          v37 = v45;
          break;
          ;
        }
        int v46 = 1;
        int v47 = v28 + v46;
        v27 = v36;
        v28 = v47;
      }
      v6 = v27;
      break;
    }
  }
  bool v48 = true;
  int v49 = simt_wave_count_bits(v48);
  int v50 = 0;
  int v51 = v50 + v0;
  v1[v51] = v49;
  return;
}

kernel void kernel_main(device int* v52 [[buffer(0)]], device int* v53 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v54 = static_cast<int>(__simt_tid3.x);
  int v55 = 0;
  int v56 = v55 + v54;
  int v57 = v53[v56];
  int v58 = 4;
  int v59 = v58 + v54;
  int v60 = v53[v59];
  helper0(v54, v52, v57, v60, static_cast<int>(__simt_tid3.x));
  int v61 = 3;
  int v62 = 8;
  int v63 = v62 + v54;
  int v64 = v53[v63];
  int v65;
  v65 = v54;
  switch (v64) {
    case 0:
      {
      int v66 = 0;
      int v67 = 0;
      int v68;
      int v69;
      v68 = v66;
      v69 = v67;
      while (true) {
        int v70 = 4;
        int v71 = v69 * v70;
        int v72 = v71 + v54;
        int v73 = 12;
        int v74 = v73 + v72;
        int v75 = v53[v74];
        int v76 = 0;
        bool v77 = v75 != v76;
        v68 = v68;
        v69 = v69;
        if (!v77) break;
        int v78 = v68 + v69;
        int v79 = 1;
        int v80 = v69 + v79;
        bool v81 = true;
        v68 = v78;
        v69 = v80;
      }
      v65 = v68;
    }
    default:
      {
      int v82 = 32;
      int v83 = v82 + v54;
      int v84 = v53[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        int v88 = 0;
        v87 = v88;
      } else {
        int v89 = 36;
        int v90 = v89 + v54;
        int v91 = v53[v90];
        int v92 = 0;
        bool v93 = v91 != v92;
        int v94;
        if (v93) {
          v94 = v54;
        } else {
          int v95 = 0;
          v94 = v95;
        }
        v87 = v94;
      }
      v65 = v87;
      break;
    }
    case 1:
      {
      int v96 = 40;
      int v97 = v96 + v54;
      int v98 = v53[v97];
      int v99 = 0;
      bool v100 = v98 != v99;
      int v101;
      if (v100) {
        int v102 = 44;
        int v103 = v102 + v54;
        int v104 = v53[v103];
        int v105 = 0;
        bool v106 = v104 != v105;
        int v107;
        if (v106) {
          int v108 = 1;
          v107 = v108;
        } else {
          int v109 = 0;
          v107 = v109;
        }
        v101 = v107;
      } else {
        int v110 = 48;
        int v111 = v110 + v54;
        int v112 = v53[v111];
        int v113 = 0;
        bool v114 = v112 != v113;
        int v115;
        if (v114) {
          int v116 = 2;
          v115 = v116;
        } else {
          int v117 = 4;
          int v118 = v54 + v117;
          v115 = v118;
        }
        v101 = v115;
      }
      v65 = v101;
    }
    case 2:
      {
      int v119 = 52;
      int v120 = v119 + v54;
      int v121 = v53[v120];
      int v122;
      v122 = v54;
      switch (v121) {
        case 0:
          {
          int v123 = 56;
          int v124 = v123 + v54;
          int v125 = v53[v124];
          int v126 = 1;
          int v127;
          v127 = v126;
          switch (v125) {
            default:
              {
              v127 = v54;
              break;
            }
            case 0:
              {
              int v128 = 4;
              v127 = v128;
              break;
            }
            case 1:
              {
              v127 = v54;
              break;
            }
          }
          v122 = v127;
          break;
        }
        case 1:
          {
          int v129 = 60;
          int v130 = v129 + v54;
          int v131 = v53[v130];
          int v132 = 1;
          int v133;
          v133 = v132;
          switch (v131) {
            case 0:
              {
              v133 = v54;
            }
            default:
              {
              int v134 = 4;
              v133 = v134;
              break;
            }
          }
          bool v135 = true;
          v122 = v133;
          break;
        }
        default:
          {
          int v136 = 64;
          int v137 = v136 + v54;
          int v138 = v53[v137];
          int v139 = 4;
          int v140;
          v140 = v139;
          switch (v138) {
            case 0:
              {
              int v141 = 0;
              v140 = v141;
              break;
            }
            default:
              {
              v140 = v54;
              break;
            }
          }
          v122 = v140;
          break;
        }
      }
      v65 = v122;
      break;
    }
  }
  bool v142 = true;
  int v143 = 16;
  int v144 = v143 + v54;
  bool v145 = true;
  int v146 = simt_wave_count_bits(v145);
  v52[v144] = v146;
  int v147 = 0;
  int v148 = 0;
  int v149;
  int v150;
  v149 = v147;
  v150 = v148;
  while (true) {
    int v151 = 4;
    int v152 = v150 * v151;
    int v153 = v152 + v54;
    int v154 = 68;
    int v155 = v154 + v153;
    int v156 = v53[v155];
    int v157 = 0;
    bool v158 = v156 != v157;
    v149 = v149;
    v150 = v150;
    if (!v158) break;
    int v159 = v149 + v150;
    int v160 = 1;
    int v161 = v150 + v160;
    bool v162 = true;
    int v163 = 32;
    int v164 = 4;
    int v165 = v150 * v164;
    int v166 = v163 + v165;
    int v167 = v166 + v54;
    bool v168 = true;
    int v169 = simt_wave_count_bits(v168);
    v52[v167] = v169;
    v149 = v159;
    v150 = v161;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 43; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
