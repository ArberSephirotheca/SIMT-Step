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
    case 1:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 3;
        int v15;
        v15 = v14;
        switch (v13) {
          case 0:
            {
            int v16 = 0;
            int v17 = v0 + v16;
            v15 = v17;
            break;
          }
          default:
            {
            v15 = v0;
            break;
          }
        }
        int v18 = 0;
        int v19 = v0 + v18;
        v11 = v15;
      } else {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          v22 = v0;
        } else {
          v22 = v0;
        }
        int v23 = 2;
        int v24 = v0 + v23;
        v11 = v22;
      }
      int v25 = 4;
      int v26 = v0 + v25;
      v8 = v11;
    }
    default:
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
        int v36 = 3;
        int v37 = v3 % v36;
        int v38 = 2;
        int v39;
        v39 = v38;
        switch (v37) {
          case 0:
            {
            int v40 = 1;
            int v41 = v0 + v40;
            v39 = v41;
            break;
          }
          default:
            {
            int v42 = 3;
            int v43 = v0 + v42;
            v39 = v43;
          }
          case 1:
            {
            int v44 = 3;
            v39 = v44;
          }
          case 2:
            {
            v39 = v0;
            break;
          }
        }
        int v45 = 3;
        int v46 = 1;
        int v47 = v30 + v46;
        v29 = v39;
        v30 = v47;
        break;
        ;
      }
      int v48 = 3;
      int v49 = v0 + v48;
      v8 = v29;
    }
    case 2:
      {
      int v50 = 3;
      int v51 = v3 % v50;
      int v52 = 3;
      int v53;
      v53 = v52;
      switch (v51) {
        case 0:
          {
          int v54 = 2;
          int v55 = v3 % v54;
          int v56;
          v56 = v0;
          switch (v55) {
            default:
              {
              int v57 = 1;
              v56 = v57;
              break;
            }
            case 0:
              {
              v56 = v0;
              break;
            }
          }
          int v58 = 4;
          v53 = v56;
          break;
        }
        case 1:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            int v62 = 1;
            v61 = v62;
          } else {
            int v63 = 3;
            int v64 = v0 + v63;
            v61 = v64;
          }
          v53 = v61;
          break;
        }
        case 2:
          {
          int v65 = 0;
          int v66 = 0;
          int v67;
          int v68;
          v67 = v65;
          v68 = v66;
          while (true) {
            int v69 = 4;
            int v70 = v3 % v69;
            int v71 = 1;
            int v72 = v70 + v71;
            bool v73 = v68 < v72;
            v67 = v67;
            v68 = v68;
            if (!v73) break;
            int v74 = 1;
            int v75 = v68 + v74;
            v67 = v0;
            v68 = v75;
          }
          int v76 = 4;
          int v77 = v0 + v76;
          v53 = v67;
          break;
        }
        default:
          {
          int v78 = 3;
          int v79 = v3 % v78;
          int v80 = 0;
          int v81;
          v81 = v80;
          switch (v79) {
            default:
              {
              int v82 = 1;
              v81 = v82;
              break;
            }
            case 0:
              {
              int v83 = 4;
              int v84 = v0 + v83;
              v81 = v84;
            }
            case 1:
              {
              v81 = v0;
              break;
            }
            case 2:
              {
              int v85 = 1;
              v81 = v85;
              break;
            }
          }
          v53 = v81;
          break;
        }
      }
      v8 = v53;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 8;
  int v100 = v99 + v92;
  int v101 = v91[v100];
  int v102 = 0;
  bool v103 = v101 != v102;
  int v104;
  if (v103) {
    int v105 = 12;
    int v106 = v105 + v92;
    int v107 = v91[v106];
    int v108 = 1;
    int v109 = v92 + v108;
    int v110;
    v110 = v109;
    switch (v107) {
      default:
        {
        int v111 = 16;
        int v112 = v111 + v92;
        int v113 = v91[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          int v117 = 0;
          v116 = v117;
        } else {
          v116 = v92;
        }
        v110 = v116;
        break;
      }
      case 0:
        {
        int v118 = 20;
        int v119 = v118 + v92;
        int v120 = v91[v119];
        int v121 = 4;
        int v122;
        v122 = v121;
        switch (v120) {
          case 0:
            {
            v122 = v92;
            break;
          }
          case 1:
            {
            v122 = v92;
            break;
          }
          case 2:
            {
            int v123 = 1;
            int v124 = v92 + v123;
            v122 = v124;
            break;
          }
          default:
            {
            v122 = v92;
            break;
          }
        }
        bool v125 = true;
        v110 = v122;
        break;
      }
      case 1:
        {
        int v126 = 24;
        int v127 = v126 + v92;
        int v128 = v91[v127];
        int v129;
        v129 = v92;
        switch (v128) {
          default:
            {
            v129 = v92;
            break;
          }
          case 0:
            {
            v129 = v92;
            break;
          }
          case 1:
            {
            v129 = v92;
            break;
          }
        }
        bool v130 = true;
        v110 = v129;
        break;
      }
    }
    bool v131 = true;
    v104 = v110;
  } else {
    int v132 = 28;
    int v133 = v132 + v92;
    int v134 = v91[v133];
    int v135 = 3;
    int v136 = v92 + v135;
    int v137;
    v137 = v136;
    switch (v134) {
      default:
        {
        int v138 = 32;
        int v139 = v138 + v92;
        int v140 = v91[v139];
        int v141 = 0;
        bool v142 = v140 != v141;
        int v143;
        if (v142) {
          int v144 = 1;
          int v145 = v92 + v144;
          v143 = v145;
        } else {
          v143 = v92;
        }
        v137 = v143;
        break;
      }
      case 0:
        {
        int v146 = 36;
        int v147 = v146 + v92;
        int v148 = v91[v147];
        int v149 = 0;
        bool v150 = v148 != v149;
        int v151;
        if (v150) {
          int v152 = 3;
          v151 = v152;
        } else {
          int v153 = 0;
          int v154 = v92 + v153;
          v151 = v154;
        }
        v137 = v151;
      }
      case 1:
        {
        int v155 = 40;
        int v156 = v155 + v92;
        int v157 = v91[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        int v160;
        if (v159) {
          int v161 = 2;
          int v162 = v92 + v161;
          v160 = v162;
        } else {
          int v163 = 2;
          v160 = v163;
        }
        v137 = v160;
        break;
      }
    }
    bool v164 = true;
    v104 = v137;
  }
  int v165 = 16;
  int v166 = v165 + v92;
  bool v167 = true;
  int v168 = simt_wave_count_bits(v167);
  v90[v166] = v168;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
