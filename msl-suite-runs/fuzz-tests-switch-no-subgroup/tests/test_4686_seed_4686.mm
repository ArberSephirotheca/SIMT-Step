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
  int v8 = 4;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 2;
      int v14 = v3 % v13;
      int v15 = 2;
      int v16;
      v16 = v15;
      switch (v14) {
        case 0:
          {
          int v17 = 1;
          v16 = v17;
          break;
        }
        case 1:
          {
          int v18 = 4;
          int v19 = v0 + v18;
          v16 = v19;
          break;
        }
        default:
          {
          v16 = v0;
          break;
        }
      }
      v12 = v16;
    }
    case 1:
      {
      int v20 = 3;
      int v21 = v0 + v20;
      v12 = v21;
      break;
    }
    default:
      {
      int v22 = 2;
      int v23 = v3 % v22;
      int v24;
      v24 = v0;
      switch (v23) {
        case 0:
          {
          v24 = v0;
        }
        case 1:
          {
          int v25 = 4;
          int v26 = v3 % v25;
          int v27;
          v27 = v0;
          switch (v26) {
            default:
              {
              v27 = v0;
              break;
            }
            case 0:
              {
              int v28 = 3;
              int v29 = v0 + v28;
              v27 = v29;
              break;
            }
            case 1:
              {
              int v30 = 2;
              int v31 = v0 + v30;
              v27 = v31;
              break;
            }
            case 2:
              {
              int v32 = 4;
              int v33 = v0 + v32;
              v27 = v33;
              break;
            }
          }
          v24 = v27;
          break;
        }
        default:
          {
          int v34 = 4;
          int v35 = v3 % v34;
          int v36 = 1;
          int v37 = v0 + v36;
          int v38;
          v38 = v37;
          switch (v35) {
            default:
              {
              int v39 = 4;
              int v40 = v0 + v39;
              v38 = v40;
              break;
            }
            case 0:
              {
              int v41 = 1;
              v38 = v41;
              break;
            }
            case 1:
              {
              int v42 = 3;
              int v43 = v0 + v42;
              v38 = v43;
              break;
            }
            case 2:
              {
              v38 = v0;
              break;
            }
          }
          int v44 = 0;
          v24 = v38;
          break;
        }
      }
      int v45 = 2;
      v12 = v24;
    }
    case 2:
      {
      int v46 = 1;
      v12 = v46;
      break;
    }
  }
  int v47 = 0;
  bool v48 = v2 != v47;
  int v49 = v48 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v50 [[buffer(0)]], device int* v51 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v52 = static_cast<int>(__simt_tid3.x);
  int v53 = 0;
  int v54 = v53 + v52;
  int v55 = v51[v54];
  int v56 = 4;
  int v57 = v56 + v52;
  int v58 = v51[v57];
  int v59 = 0;
  bool v60 = v55 != v59;
  if (v60) {
  } else {
    int v61 = 0;
    int v62 = 0;
    int v63;
    int v64;
    v63 = v61;
    v64 = v62;
    while (true) {
      int v65 = 2;
      bool v66 = v64 < v65;
      v63 = v63;
      v64 = v64;
      if (!v66) break;
      helper0(v52, v50, v55, v58, static_cast<int>(__simt_tid3.x));
      int v67 = 1;
      int v68 = v64 + v67;
      v63 = v63;
      v64 = v68;
    }
  }
  int v69 = 8;
  int v70 = v69 + v52;
  int v71 = v51[v70];
  int v72 = 0;
  bool v73 = v71 != v72;
  int v74;
  if (v73) {
    int v75 = 12;
    int v76 = v75 + v52;
    int v77 = v51[v76];
    int v78 = 3;
    int v79 = v52 + v78;
    int v80;
    v80 = v79;
    switch (v77) {
      default:
        {
        int v81 = 16;
        int v82 = v81 + v52;
        int v83 = v51[v82];
        int v84 = 0;
        bool v85 = v83 != v84;
        int v86;
        if (v85) {
          v86 = v52;
        } else {
          int v87 = 4;
          int v88 = v52 + v87;
          v86 = v88;
        }
        v80 = v86;
        break;
      }
      case 0:
        {
        int v89 = 0;
        int v90 = 0;
        int v91;
        int v92;
        v91 = v89;
        v92 = v90;
        while (true) {
          int v93 = 4;
          int v94 = v92 * v93;
          int v95 = v94 + v52;
          int v96 = 20;
          int v97 = v96 + v95;
          int v98 = v51[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          v91 = v91;
          v92 = v92;
          if (!v100) break;
          int v101 = v91 + v92;
          int v102 = 1;
          int v103 = v92 + v102;
          bool v104 = true;
          v91 = v101;
          v92 = v103;
          break;
          ;
        }
        v80 = v91;
        break;
      }
      case 1:
        {
        int v105 = 40;
        int v106 = v105 + v52;
        int v107 = v51[v106];
        int v108 = 0;
        bool v109 = v107 != v108;
        int v110;
        if (v109) {
          v110 = v52;
        } else {
          int v111 = 4;
          int v112 = v52 + v111;
          v110 = v112;
        }
        v80 = v110;
        break;
      }
      case 2:
        {
        int v113 = 44;
        int v114 = v113 + v52;
        int v115 = v51[v114];
        int v116 = 3;
        int v117;
        v117 = v116;
        switch (v115) {
          case 0:
            {
            v117 = v52;
            break;
          }
          default:
            {
            v117 = v52;
            break;
          }
          case 1:
            {
            int v118 = 2;
            v117 = v118;
            break;
          }
        }
        v80 = v117;
        break;
      }
    }
    v74 = v80;
  } else {
    int v119 = 48;
    int v120 = v119 + v52;
    int v121 = v51[v120];
    int v122 = 4;
    int v123;
    v123 = v122;
    switch (v121) {
      case 0:
        {
        int v124 = 0;
        int v125 = 0;
        int v126;
        int v127;
        v126 = v124;
        v127 = v125;
        while (true) {
          int v128 = 4;
          int v129 = v127 * v128;
          int v130 = v129 + v52;
          int v131 = 52;
          int v132 = v131 + v130;
          int v133 = v51[v132];
          int v134 = 0;
          bool v135 = v133 != v134;
          v126 = v126;
          v127 = v127;
          if (!v135) break;
          int v136 = v126 + v127;
          int v137 = 1;
          int v138 = v127 + v137;
          bool v139 = true;
          v126 = v136;
          v127 = v138;
          break;
          ;
        }
        v123 = v126;
        break;
      }
      case 1:
        {
        int v140 = 3;
        int v141 = v52 + v140;
        v123 = v141;
        break;
      }
      default:
        {
        int v142 = 72;
        int v143 = v142 + v52;
        int v144 = v51[v143];
        int v145;
        v145 = v52;
        switch (v144) {
          case 0:
            {
            int v146 = 1;
            int v147 = v52 + v146;
            v145 = v147;
            break;
          }
          case 1:
            {
            int v148 = 0;
            v145 = v148;
            break;
          }
          default:
            {
            int v149 = 3;
            int v150 = v52 + v149;
            v145 = v150;
            break;
          }
        }
        bool v151 = true;
        v123 = v145;
        break;
      }
      case 2:
        {
        int v152 = 76;
        int v153 = v152 + v52;
        int v154 = v51[v153];
        int v155 = 0;
        int v156 = v52 + v155;
        int v157;
        v157 = v156;
        switch (v154) {
          case 0:
            {
            v157 = v52;
          }
          default:
            {
            v157 = v52;
            break;
          }
          case 1:
            {
            v157 = v52;
            break;
          }
        }
        bool v158 = true;
        v123 = v157;
        break;
      }
    }
    v74 = v123;
  }
  int v159 = 16;
  int v160 = v159 + v52;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v50[v160] = v162;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
