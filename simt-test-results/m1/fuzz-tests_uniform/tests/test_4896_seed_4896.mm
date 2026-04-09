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
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 0;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          bool v12 = v2 != v11;
          int v13;
          if (v12) {
            int v14 = 0;
            int v15 = v0 + v14;
            v13 = v15;
          } else {
            int v16 = 4;
            v13 = v16;
          }
          int v17 = 0;
          v10 = v13;
          break;
        }
        default:
          {
          int v18 = 0;
          bool v19 = v2 != v18;
          int v20;
          if (v19) {
            int v21 = 4;
            v20 = v21;
          } else {
            int v22 = 4;
            int v23 = v0 + v22;
            v20 = v23;
          }
          int v24 = 2;
          int v25 = v0 + v24;
          v10 = v20;
          break;
        }
        case 1:
          {
          int v26 = 4;
          int v27 = v3 % v26;
          int v28;
          v28 = v0;
          switch (v27) {
            case 0:
              {
              int v29 = 1;
              v28 = v29;
              break;
            }
            default:
              {
              int v30 = 0;
              int v31 = v0 + v30;
              v28 = v31;
              break;
            }
            case 1:
              {
              v28 = v0;
              break;
            }
            case 2:
              {
              int v32 = 4;
              v28 = v32;
              break;
            }
          }
          v10 = v28;
          break;
        }
        case 2:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 3;
            v35 = v36;
          } else {
            int v37 = 1;
            int v38 = v0 + v37;
            v35 = v38;
          }
          int v39 = 2;
          v10 = v35;
          break;
        }
      }
      v6 = v10;
      break;
    }
    case 1:
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
        int v49 = 0;
        bool v50 = v2 != v49;
        int v51;
        if (v50) {
          int v52 = 3;
          v51 = v52;
        } else {
          int v53 = 3;
          v51 = v53;
        }
        int v54 = 4;
        int v55 = v0 + v54;
        int v56 = 1;
        int v57 = v43 + v56;
        v42 = v51;
        v43 = v57;
      }
      v6 = v42;
      break;
    }
    default:
      {
      int v58 = 2;
      int v59 = v3 % v58;
      int v60 = 2;
      int v61;
      v61 = v60;
      switch (v59) {
        case 0:
          {
          int v62 = 0;
          int v63 = 0;
          int v64;
          int v65;
          v64 = v62;
          v65 = v63;
          while (true) {
            int v66 = 4;
            int v67 = v3 % v66;
            int v68 = 1;
            int v69 = v67 + v68;
            bool v70 = v65 < v69;
            v64 = v64;
            v65 = v65;
            if (!v70) break;
            int v71 = 4;
            int v72 = 1;
            int v73 = v65 + v72;
            v64 = v71;
            v65 = v73;
          }
          int v74 = 4;
          int v75 = v0 + v74;
          v61 = v64;
          break;
        }
        default:
          {
          int v76 = 0;
          int v77 = v0 + v76;
          v61 = v77;
          break;
        }
      }
      int v78 = 1;
      v6 = v61;
      break;
    }
  }
  bool v79 = true;
  int v80 = simt_wave_count_bits(v79);
  int v81 = 0;
  int v82 = v81 + v0;
  v1[v82] = v80;
  return;
}

kernel void kernel_main(device int* v83 [[buffer(0)]], device int* v84 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v85 = static_cast<int>(__simt_tid3.x);
  int v86 = 0;
  int v87 = v86 + v85;
  int v88 = v84[v87];
  int v89 = 4;
  int v90 = v89 + v85;
  int v91 = v84[v90];
  helper0(v85, v83, v88, v91, static_cast<int>(__simt_tid3.x));
  int v92 = 1;
  int v93 = 8;
  int v94 = v93 + v85;
  int v95 = v84[v94];
  int v96 = 0;
  bool v97 = v95 != v96;
  int v98;
  if (v97) {
    int v99 = 0;
    int v100 = 0;
    int v101;
    int v102;
    v101 = v99;
    v102 = v100;
    while (true) {
      int v103 = 4;
      int v104 = v102 * v103;
      int v105 = v104 + v85;
      int v106 = 12;
      int v107 = v106 + v105;
      int v108 = v84[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      v101 = v101;
      v102 = v102;
      if (!v110) break;
      int v111 = 1;
      int v112 = v101 + v111;
      int v113 = 1;
      int v114 = v102 + v113;
      v101 = v112;
      v102 = v114;
    }
    bool v115 = true;
    v98 = v101;
  } else {
    int v116 = 32;
    int v117 = v116 + v85;
    int v118 = v84[v117];
    int v119 = 1;
    int v120;
    v120 = v119;
    switch (v118) {
      case 0:
        {
        int v121 = 36;
        int v122 = v121 + v85;
        int v123 = v84[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        int v126;
        if (v125) {
          v126 = v85;
        } else {
          int v127 = 1;
          int v128 = v85 + v127;
          v126 = v128;
        }
        v120 = v126;
      }
      case 1:
        {
        int v129 = 40;
        int v130 = v129 + v85;
        int v131 = v84[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          int v135 = 1;
          v134 = v135;
        } else {
          int v136 = 1;
          v134 = v136;
        }
        v120 = v134;
        break;
      }
      case 2:
        {
        v120 = v85;
      }
      default:
        {
        int v137 = 44;
        int v138 = v137 + v85;
        int v139 = v84[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          v142 = v85;
        } else {
          int v143 = 2;
          int v144 = v85 + v143;
          v142 = v144;
        }
        v120 = v142;
        break;
      }
    }
    bool v145 = true;
    v98 = v120;
  }
  int v146 = 16;
  int v147 = v146 + v85;
  bool v148 = true;
  int v149 = simt_wave_count_bits(v148);
  v83[v147] = v149;
  int v150 = 48;
  int v151 = v150 + v85;
  int v152 = v84[v151];
  int v153 = 0;
  bool v154 = v152 != v153;
  int v155;
  if (v154) {
    int v156 = 1;
    int v157 = v85 + v156;
    v155 = v157;
  } else {
    int v158 = 2;
    v155 = v158;
  }
  int v159 = 32;
  int v160 = v159 + v85;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v83[v160] = v162;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
