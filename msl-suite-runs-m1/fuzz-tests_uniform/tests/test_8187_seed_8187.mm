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
  int v6 = 3;
  int v7 = v3 % v6;
  int v8 = 2;
  int v9;
  v9 = v8;
  switch (v7) {
    default:
      {
      int v10 = 4;
      int v11 = v3 % v10;
      int v12 = 4;
      int v13;
      v13 = v12;
      switch (v11) {
        case 0:
          {
          int v14 = 3;
          int v15 = v3 % v14;
          int v16 = 4;
          int v17;
          v17 = v16;
          switch (v15) {
            case 0:
              {
              int v18 = 3;
              int v19 = v0 + v18;
              v17 = v19;
              break;
            }
            case 1:
              {
              int v20 = 4;
              v17 = v20;
            }
            default:
              {
              v17 = v0;
              break;
            }
            case 2:
              {
              v17 = v0;
              break;
            }
          }
          v13 = v17;
          break;
        }
        case 1:
          {
          int v21 = 3;
          int v22 = v3 % v21;
          int v23 = 2;
          int v24 = v0 + v23;
          int v25;
          v25 = v24;
          switch (v22) {
            case 0:
              {
              int v26 = 4;
              int v27 = v0 + v26;
              v25 = v27;
            }
            default:
              {
              v25 = v0;
              break;
            }
            case 1:
              {
              int v28 = 1;
              int v29 = v0 + v28;
              v25 = v29;
              break;
            }
            case 2:
              {
              v25 = v0;
              break;
            }
          }
          int v30 = 2;
          int v31 = v0 + v30;
          v13 = v25;
          break;
        }
        case 2:
          {
          int v32 = 4;
          v13 = v32;
          break;
        }
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 3;
            int v43 = v0 + v42;
            int v44 = 1;
            int v45 = v36 + v44;
            v35 = v43;
            v36 = v45;
          }
          int v46 = 2;
          v13 = v35;
          break;
        }
      }
      int v47 = 1;
      int v48 = v0 + v47;
      v9 = v13;
      break;
    }
    case 0:
      {
      int v49 = 2;
      int v50 = v3 % v49;
      int v51 = 0;
      int v52;
      v52 = v51;
      switch (v50) {
        default:
          {
          int v53 = 0;
          bool v54 = v2 != v53;
          int v55;
          if (v54) {
            int v56 = 1;
            v55 = v56;
          } else {
            int v57 = 1;
            v55 = v57;
          }
          int v58 = 1;
          int v59 = v0 + v58;
          v52 = v55;
          break;
        }
        case 0:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 1;
            int v70 = v0 + v69;
            int v71 = 1;
            int v72 = v63 + v71;
            v62 = v70;
            v63 = v72;
          }
          int v73 = 2;
          v52 = v62;
          break;
        }
      }
      int v74 = 0;
      int v75 = v0 + v74;
      v9 = v52;
      break;
    }
    case 1:
      {
      int v76 = 0;
      bool v77 = v2 != v76;
      int v78;
      if (v77) {
        int v79 = 0;
        int v80 = 0;
        int v81;
        int v82;
        v81 = v79;
        v82 = v80;
        while (true) {
          int v83 = 4;
          int v84 = v3 % v83;
          int v85 = 1;
          int v86 = v84 + v85;
          bool v87 = v82 < v86;
          v81 = v81;
          v82 = v82;
          if (!v87) break;
          int v88 = 1;
          int v89 = v82 + v88;
          v81 = v0;
          v82 = v89;
          break;
          ;
        }
        int v90 = 2;
        v78 = v81;
      } else {
        int v91 = 0;
        bool v92 = v2 != v91;
        int v93;
        if (v92) {
          int v94 = 3;
          v93 = v94;
        } else {
          int v95 = 3;
          v93 = v95;
        }
        int v96 = 3;
        int v97 = v0 + v96;
        v78 = v93;
      }
      int v98 = 1;
      v9 = v78;
      break;
    }
  }
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  int v101 = 0;
  int v102 = v101 + v0;
  v1[v102] = v100;
  int v103 = 0;
  bool v104 = v2 != v103;
  int v105 = v104 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v116 = (int)(v115);
  uint v117 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v118 = (int)(v117);
  int v119 = 8;
  int v120 = v119 + v108;
  int v121 = v107[v120];
  int v122 = 0;
  bool v123 = v121 != v122;
  int v124;
  if (v123) {
    int v125 = 12;
    int v126 = v125 + v108;
    int v127 = v107[v126];
    int v128;
    v128 = v108;
    switch (v127) {
      default:
        {
        int v129 = 16;
        int v130 = v129 + v108;
        int v131 = v107[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          int v135 = 0;
          int v136 = v108 + v135;
          v134 = v136;
        } else {
          v134 = v108;
        }
        v128 = v134;
        break;
      }
      case 0:
        {
        int v137 = 20;
        int v138 = v137 + v108;
        int v139 = v107[v138];
        int v140 = 0;
        bool v141 = v139 != v140;
        int v142;
        if (v141) {
          v142 = v108;
        } else {
          int v143 = 0;
          v142 = v143;
        }
        v128 = v142;
        break;
      }
    }
    bool v144 = true;
    v124 = v128;
  } else {
    int v145 = 24;
    int v146 = v145 + v108;
    int v147 = v107[v146];
    int v148 = 0;
    bool v149 = v147 != v148;
    int v150;
    if (v149) {
      int v151 = 28;
      int v152 = v151 + v108;
      int v153 = v107[v152];
      int v154 = 1;
      int v155;
      v155 = v154;
      switch (v153) {
        case 0:
          {
          int v156 = 2;
          int v157 = v108 + v156;
          v155 = v157;
        }
        default:
          {
          int v158 = 1;
          v155 = v158;
          break;
        }
      }
      bool v159 = true;
      v150 = v155;
    } else {
      uint v160 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v161 = (int)(v160);
      v150 = v161;
    }
    v124 = v150;
  }
  int v162 = 16;
  int v163 = v162 + v108;
  bool v164 = true;
  int v165 = simt_wave_count_bits(v164);
  v106[v163] = v165;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 20; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
