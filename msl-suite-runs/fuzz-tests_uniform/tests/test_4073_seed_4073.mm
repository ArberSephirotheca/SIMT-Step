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
  int v6 = 4;
  int v7 = v3 % v6;
  int v8 = 1;
  int v9;
  v9 = v8;
  switch (v7) {
    case 0:
      {
      int v10 = 0;
      int v11 = 0;
      int v12;
      int v13;
      v12 = v10;
      v13 = v11;
      while (true) {
        int v14 = 4;
        int v15 = v3 % v14;
        int v16 = 1;
        int v17 = v15 + v16;
        bool v18 = v13 < v17;
        v12 = v12;
        v13 = v13;
        if (!v18) break;
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 2;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          int v24 = 4;
          int v25 = v0 + v24;
          v21 = v25;
        }
        int v26 = 1;
        int v27 = v13 + v26;
        v12 = v21;
        v13 = v27;
      }
      int v28 = 3;
      v9 = v12;
      break;
    }
    default:
      {
      int v29;
      v29 = v0;
      switch (v3) {
        case 0:
          {
          int v30 = 0;
          bool v31 = v2 != v30;
          int v32;
          if (v31) {
            int v33 = 2;
            int v34 = v0 + v33;
            v32 = v34;
          } else {
            v32 = v0;
          }
          v29 = v32;
          break;
        }
        default:
          {
          int v35 = 0;
          v29 = v35;
          break;
        }
      }
      v9 = v29;
      break;
    }
    case 1:
      {
      int v36 = 3;
      int v37 = v3 % v36;
      int v38 = 3;
      int v39;
      v39 = v38;
      switch (v37) {
        case 0:
          {
          v39 = v0;
        }
        case 1:
          {
          int v40 = 2;
          int v41 = v3 % v40;
          int v42 = 2;
          int v43;
          v43 = v42;
          switch (v41) {
            case 0:
              {
              int v44 = 1;
              int v45 = v0 + v44;
              v43 = v45;
              break;
            }
            default:
              {
              int v46 = 3;
              v43 = v46;
              break;
            }
          }
          v39 = v43;
          break;
        }
        case 2:
          {
          int v47 = 1;
          int v48 = v0 + v47;
          v39 = v48;
        }
        default:
          {
          int v49 = 0;
          bool v50 = v2 != v49;
          int v51;
          if (v50) {
            int v52 = 4;
            int v53 = v0 + v52;
            v51 = v53;
          } else {
            v51 = v0;
          }
          v39 = v51;
          break;
        }
      }
      v9 = v39;
      break;
    }
    case 2:
      {
      int v54 = 2;
      int v55 = v3 % v54;
      int v56 = 3;
      int v57;
      v57 = v56;
      switch (v55) {
        case 0:
          {
          int v58 = 0;
          bool v59 = v2 != v58;
          int v60;
          if (v59) {
            v60 = v0;
          } else {
            int v61 = 4;
            v60 = v61;
          }
          v57 = v60;
          break;
        }
        case 1:
          {
          int v62 = 4;
          int v63 = v3 % v62;
          int v64;
          v64 = v0;
          switch (v63) {
            case 0:
              {
              int v65 = 2;
              v64 = v65;
            }
            default:
              {
              v64 = v0;
              break;
            }
            case 1:
              {
              int v66 = 3;
              v64 = v66;
              break;
            }
            case 2:
              {
              v64 = v0;
              break;
            }
          }
          v57 = v64;
        }
        default:
          {
          int v67 = 0;
          bool v68 = v2 != v67;
          int v69;
          if (v68) {
            int v70 = 3;
            int v71 = v0 + v70;
            v69 = v71;
          } else {
            int v72 = 0;
            v69 = v72;
          }
          v57 = v69;
          break;
        }
      }
      int v73 = 3;
      int v74 = v0 + v73;
      v9 = v57;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 0;
  int v78 = v77 + v0;
  v1[v78] = v76;
  int v79 = 0;
  bool v80 = v2 != v79;
  int v81 = v80 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v82 [[buffer(0)]], device int* v83 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v84 = static_cast<int>(__simt_tid3.x);
  int v85 = 0;
  int v86 = v85 + v84;
  int v87 = v83[v86];
  int v88 = 4;
  int v89 = v88 + v84;
  int v90 = v83[v89];
  helper0(v84, v82, v87, v90, static_cast<int>(__simt_tid3.x));
  int v91 = 8;
  int v92 = v91 + v84;
  int v93 = v83[v92];
  int v94 = 0;
  bool v95 = v93 != v94;
  int v96;
  if (v95) {
    int v97 = 12;
    int v98 = v97 + v84;
    int v99 = v83[v98];
    uint v100 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v101 = (int)(v100);
    int v102;
    v102 = v101;
    switch (v99) {
      default:
        {
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v84;
          int v110 = 16;
          int v111 = v110 + v109;
          int v112 = v83[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          v105 = v115;
          v106 = v117;
        }
        bool v118 = true;
        v102 = v105;
      }
      case 0:
        {
        int v119 = 36;
        int v120 = v119 + v84;
        int v121 = v83[v120];
        int v122 = 0;
        bool v123 = v121 != v122;
        int v124;
        if (v123) {
          int v125 = 3;
          int v126 = v84 + v125;
          v124 = v126;
        } else {
          int v127 = 3;
          int v128 = v84 + v127;
          v124 = v128;
        }
        v102 = v124;
        break;
      }
    }
    bool v129 = true;
    v96 = v102;
  } else {
    int v130 = 0;
    int v131 = 0;
    int v132;
    int v133;
    v132 = v130;
    v133 = v131;
    while (true) {
      int v134 = 4;
      int v135 = v133 * v134;
      int v136 = v135 + v84;
      int v137 = 40;
      int v138 = v137 + v136;
      int v139 = v83[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      v132 = v132;
      v133 = v133;
      if (!v141) break;
      int v142 = v132 + v133;
      int v143 = 1;
      int v144 = v133 + v143;
      v132 = v142;
      v133 = v144;
      break;
      ;
    }
    bool v145 = true;
    v96 = v132;
  }
  int v146 = 16;
  int v147 = v146 + v84;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v82[v147] = v149;
  int v150 = 0;
  int v151 = 0;
  int v152;
  int v153;
  v152 = v150;
  v153 = v151;
  while (true) {
    int v154 = 4;
    int v155 = v153 * v154;
    int v156 = v155 + v84;
    int v157 = 60;
    int v158 = v157 + v156;
    int v159 = v83[v158];
    int v160 = 0;
    bool v161 = v159 != v160;
    v152 = v152;
    v153 = v153;
    if (!v161) break;
    int v162 = v152 + v153;
    int v163 = 1;
    int v164 = v153 + v163;
    v152 = v162;
    v153 = v164;
  }
  bool v165 = true;
  int v166 = 32;
  int v167 = v166 + v84;
  bool v168 = true;
  int v169 = simt_wave_count_bits(v168);
  v82[v167] = v169;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
