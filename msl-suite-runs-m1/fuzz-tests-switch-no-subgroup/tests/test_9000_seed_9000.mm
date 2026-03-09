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
  int v4 = 4;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
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
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          v16 = v0;
        } else {
          v16 = v0;
        }
        v11 = v16;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v17 = 0;
      bool v18 = v2 != v17;
      int v19;
      if (v18) {
        int v20 = 0;
        bool v21 = v2 != v20;
        int v22;
        if (v21) {
          int v23 = 2;
          int v24 = v0 + v23;
          v22 = v24;
        } else {
          int v25 = 3;
          int v26 = v0 + v25;
          v22 = v26;
        }
        v19 = v22;
      } else {
        int v27 = 0;
        v19 = v27;
      }
      v8 = v19;
      break;
    }
    default:
      {
      int v28 = 0;
      bool v29 = v2 != v28;
      int v30;
      if (v29) {
        v30 = v0;
      } else {
        v30 = v0;
      }
      v8 = v30;
      break;
    }
    case 2:
      {
      int v31 = 1;
      int v32 = v0 + v31;
      v8 = v32;
      break;
    }
  }
  bool v33 = true;
  int v34 = simt_wave_count_bits(v33);
  int v35 = 0;
  int v36 = v35 + v0;
  v1[v36] = v34;
  return;
}

kernel void kernel_main(device int* v37 [[buffer(0)]], device int* v38 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v39 = static_cast<int>(__simt_tid3.x);
  int v40 = 0;
  int v41 = v40 + v39;
  int v42 = v38[v41];
  int v43 = 4;
  int v44 = v43 + v39;
  int v45 = v38[v44];
  helper0(v39, v37, v42, v45, static_cast<int>(__simt_tid3.x));
  int v46 = 8;
  int v47 = v46 + v39;
  int v48 = v38[v47];
  int v49;
  v49 = v39;
  switch (v48) {
    default:
      {
      int v50 = 12;
      int v51 = v50 + v39;
      int v52 = v38[v51];
      int v53 = 1;
      int v54 = v39 + v53;
      int v55;
      v55 = v54;
      switch (v52) {
        case 0:
          {
          int v56 = 16;
          int v57 = v56 + v39;
          int v58 = v38[v57];
          int v59 = 0;
          bool v60 = v58 != v59;
          int v61;
          if (v60) {
            v61 = v39;
          } else {
            int v62 = 0;
            int v63 = v39 + v62;
            v61 = v63;
          }
          v55 = v61;
          break;
        }
        default:
          {
          int v64 = 20;
          int v65 = v64 + v39;
          int v66 = v38[v65];
          int v67 = 0;
          bool v68 = v66 != v67;
          int v69;
          if (v68) {
            int v70 = 3;
            int v71 = v39 + v70;
            v69 = v71;
          } else {
            int v72 = 2;
            int v73 = v39 + v72;
            v69 = v73;
          }
          v55 = v69;
          break;
        }
        case 1:
          {
          int v74 = 3;
          int v75 = v39 + v74;
          v55 = v75;
        }
        case 2:
          {
          int v76 = 24;
          int v77 = v76 + v39;
          int v78 = v38[v77];
          int v79 = 0;
          bool v80 = v78 != v79;
          int v81;
          if (v80) {
            int v82 = 0;
            int v83 = v39 + v82;
            v81 = v83;
          } else {
            int v84 = 2;
            int v85 = v39 + v84;
            v81 = v85;
          }
          v55 = v81;
          break;
        }
      }
      v49 = v55;
    }
    case 0:
      {
      int v86 = 0;
      int v87 = 0;
      int v88;
      int v89;
      v88 = v86;
      v89 = v87;
      while (true) {
        int v90 = 4;
        int v91 = v89 * v90;
        int v92 = v91 + v39;
        int v93 = 28;
        int v94 = v93 + v92;
        int v95 = v38[v94];
        int v96 = 0;
        bool v97 = v95 != v96;
        v88 = v88;
        v89 = v89;
        if (!v97) break;
        int v98 = 48;
        int v99 = v98 + v39;
        int v100 = v38[v99];
        int v101 = 0;
        int v102 = v39 + v101;
        int v103;
        v103 = v102;
        switch (v100) {
          case 0:
            {
            int v104 = 0;
            int v105 = v39 + v104;
            v103 = v105;
            break;
          }
          case 1:
            {
            int v106 = 0;
            int v107 = v39 + v106;
            v103 = v107;
          }
          case 2:
            {
            int v108 = 4;
            v103 = v108;
            break;
          }
          default:
            {
            v103 = v39;
            break;
          }
        }
        int v109 = v88 + v103;
        int v110 = 1;
        int v111 = v89 + v110;
        bool v112 = true;
        v88 = v109;
        v89 = v111;
      }
      v49 = v88;
      break;
    }
    case 1:
      {
      int v113 = 52;
      int v114 = v113 + v39;
      int v115 = v38[v114];
      int v116 = 3;
      int v117;
      v117 = v116;
      switch (v115) {
        case 0:
          {
          int v118 = 56;
          int v119 = v118 + v39;
          int v120 = v38[v119];
          int v121 = 0;
          int v122 = v39 + v121;
          int v123;
          v123 = v122;
          switch (v120) {
            case 0:
              {
              int v124 = 2;
              v123 = v124;
            }
            case 1:
              {
              int v125 = 0;
              v123 = v125;
            }
            case 2:
              {
              v123 = v39;
              break;
            }
            default:
              {
              int v126 = 1;
              v123 = v126;
              break;
            }
          }
          v117 = v123;
          break;
        }
        case 1:
          {
          int v127 = 60;
          int v128 = v127 + v39;
          int v129 = v38[v128];
          int v130;
          v130 = v39;
          switch (v129) {
            default:
              {
              int v131 = 2;
              int v132 = v39 + v131;
              v130 = v132;
            }
            case 0:
              {
              int v133 = 1;
              int v134 = v39 + v133;
              v130 = v134;
            }
            case 1:
              {
              v130 = v39;
              break;
            }
          }
          v117 = v130;
          break;
        }
        default:
          {
          int v135 = 64;
          int v136 = v135 + v39;
          int v137 = v38[v136];
          int v138 = 0;
          bool v139 = v137 != v138;
          int v140;
          if (v139) {
            int v141 = 3;
            int v142 = v39 + v141;
            v140 = v142;
          } else {
            v140 = v39;
          }
          v117 = v140;
          break;
        }
      }
      v49 = v117;
    }
    case 2:
      {
      int v143 = 68;
      int v144 = v143 + v39;
      int v145 = v38[v144];
      int v146 = 0;
      bool v147 = v145 != v146;
      int v148;
      if (v147) {
        int v149 = 0;
        int v150 = 0;
        int v151;
        int v152;
        v151 = v149;
        v152 = v150;
        while (true) {
          int v153 = 4;
          int v154 = v152 * v153;
          int v155 = v154 + v39;
          int v156 = 72;
          int v157 = v156 + v155;
          int v158 = v38[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          v151 = v151;
          v152 = v152;
          if (!v160) break;
          int v161 = v151 + v152;
          int v162 = 1;
          int v163 = v152 + v162;
          bool v164 = true;
          v151 = v161;
          v152 = v163;
        }
        v148 = v151;
      } else {
        int v165 = 92;
        int v166 = v165 + v39;
        int v167 = v38[v166];
        int v168 = 1;
        int v169;
        v169 = v168;
        switch (v167) {
          case 0:
            {
            v169 = v39;
            break;
          }
          default:
            {
            int v170 = 2;
            v169 = v170;
            break;
          }
        }
        v148 = v169;
      }
      v49 = v148;
      break;
    }
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
