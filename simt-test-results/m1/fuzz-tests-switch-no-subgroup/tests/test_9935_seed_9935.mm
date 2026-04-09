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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 3;
  int v9 = v3 % v8;
  uint v10 = simt_subgroup_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    default:
      {
      int v13 = 2;
      v12 = v13;
      break;
    }
    case 0:
      {
      int v14 = 0;
      int v15 = 0;
      int v16;
      int v17;
      v16 = v14;
      v17 = v15;
      while (true) {
        int v18 = 4;
        int v19 = v3 % v18;
        int v20 = 1;
        int v21 = v19 + v20;
        bool v22 = v17 < v21;
        v16 = v16;
        v17 = v17;
        if (!v22) break;
        int v23;
        v23 = v0;
        switch (v3) {
          default:
            {
            v23 = v0;
            break;
          }
          case 0:
            {
            int v24 = 0;
            int v25 = v0 + v24;
            v23 = v25;
            break;
          }
        }
        int v26 = 4;
        int v27 = v0 + v26;
        int v28 = 1;
        int v29 = v17 + v28;
        v16 = v23;
        v17 = v29;
      }
      v12 = v16;
      break;
    }
    case 1:
      {
      v12 = v0;
      break;
    }
    case 2:
      {
      int v30 = 0;
      int v31 = 0;
      int v32;
      int v33;
      v32 = v30;
      v33 = v31;
      while (true) {
        int v34 = 4;
        int v35 = v3 % v34;
        int v36 = 1;
        int v37 = v35 + v36;
        bool v38 = v33 < v37;
        v32 = v32;
        v33 = v33;
        if (!v38) break;
        int v39 = 0;
        int v40 = 0;
        int v41;
        int v42;
        v41 = v39;
        v42 = v40;
        while (true) {
          int v43 = 4;
          int v44 = v3 % v43;
          int v45 = 1;
          int v46 = v44 + v45;
          bool v47 = v42 < v46;
          v41 = v41;
          v42 = v42;
          if (!v47) break;
          int v48 = 0;
          int v49 = 1;
          int v50 = v42 + v49;
          v41 = v48;
          v42 = v50;
        }
        int v51 = 1;
        int v52 = v33 + v51;
        v32 = v41;
        v33 = v52;
      }
      v12 = v32;
      break;
    }
  }
  int v53 = 0;
  bool v54 = v2 != v53;
  int v55 = v54 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  int v65 = 0;
  bool v66 = v61 != v65;
  if (v66) {
    int v67 = 8;
    int v68 = v67 + v58;
    int v69 = v57[v68];
    int v70 = 0;
    bool v71 = v69 != v70;
    if (v71) {
      helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v72 = 12;
  int v73 = v72 + v58;
  int v74 = v57[v73];
  int v75 = 0;
  int v76;
  v76 = v75;
  switch (v74) {
    case 0:
      {
      int v77 = 16;
      int v78 = v77 + v58;
      int v79 = v57[v78];
      int v80 = 1;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 20;
          int v83 = v82 + v58;
          int v84 = v57[v83];
          int v85;
          v85 = v58;
          switch (v84) {
            case 0:
              {
              int v86 = 0;
              v85 = v86;
            }
            default:
              {
              int v87 = 2;
              v85 = v87;
            }
            case 1:
              {
              v85 = v58;
              break;
            }
          }
          v81 = v85;
          break;
        }
        case 1:
          {
          int v88 = 0;
          int v89 = 0;
          int v90;
          int v91;
          v90 = v88;
          v91 = v89;
          while (true) {
            int v92 = 4;
            int v93 = v91 * v92;
            int v94 = v93 + v58;
            int v95 = 24;
            int v96 = v95 + v94;
            int v97 = v57[v96];
            int v98 = 0;
            bool v99 = v97 != v98;
            v90 = v90;
            v91 = v91;
            if (!v99) break;
            int v100 = v90 + v91;
            int v101 = 1;
            int v102 = v91 + v101;
            bool v103 = true;
            v90 = v100;
            v91 = v102;
          }
          v81 = v90;
          break;
        }
        default:
          {
          int v104 = 44;
          int v105 = v104 + v58;
          int v106 = v57[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            v109 = v58;
          } else {
            int v110 = 4;
            int v111 = v58 + v110;
            v109 = v111;
          }
          v81 = v109;
          break;
        }
      }
      bool v112 = true;
      v76 = v81;
      break;
    }
    case 1:
      {
      int v113 = 48;
      int v114 = v113 + v58;
      int v115 = v57[v114];
      int v116 = 4;
      int v117;
      v117 = v116;
      switch (v115) {
        default:
          {
          int v118 = 52;
          int v119 = v118 + v58;
          int v120 = v57[v119];
          int v121 = 4;
          int v122;
          v122 = v121;
          switch (v120) {
            default:
              {
              int v123 = 1;
              int v124 = v58 + v123;
              v122 = v124;
            }
            case 0:
              {
              int v125 = 0;
              int v126 = v58 + v125;
              v122 = v126;
            }
            case 1:
              {
              v122 = v58;
            }
            case 2:
              {
              v122 = v58;
              break;
            }
          }
          v117 = v122;
          break;
        }
        case 0:
          {
          int v127 = 0;
          int v128 = 0;
          int v129;
          int v130;
          v129 = v127;
          v130 = v128;
          while (true) {
            int v131 = 4;
            int v132 = v130 * v131;
            int v133 = v132 + v58;
            int v134 = 56;
            int v135 = v134 + v133;
            int v136 = v57[v135];
            int v137 = 0;
            bool v138 = v136 != v137;
            v129 = v129;
            v130 = v130;
            if (!v138) break;
            int v139 = v129 + v130;
            int v140 = 1;
            int v141 = v130 + v140;
            bool v142 = true;
            v129 = v139;
            v130 = v141;
          }
          v117 = v129;
          break;
        }
      }
      bool v143 = true;
      v76 = v117;
      break;
    }
    default:
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
        int v150 = v149 + v58;
        int v151 = 76;
        int v152 = v151 + v150;
        int v153 = v57[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        v146 = v146;
        v147 = v147;
        if (!v155) break;
        int v156 = v146 + v147;
        int v157 = 1;
        int v158 = v147 + v157;
        bool v159 = true;
        v146 = v156;
        v147 = v158;
      }
      v76 = v146;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 3; ++idx) {
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
