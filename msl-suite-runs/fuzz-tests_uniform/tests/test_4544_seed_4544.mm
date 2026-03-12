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
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 0;
    int v10 = 0;
    int v11;
    int v12;
    v11 = v9;
    v12 = v10;
    while (true) {
      int v13 = 4;
      int v14 = v3 % v13;
      int v15 = 1;
      int v16 = v14 + v15;
      bool v17 = v12 < v16;
      v11 = v11;
      v12 = v12;
      if (!v17) break;
      int v18 = 2;
      int v19 = v3 % v18;
      int v20;
      v20 = v0;
      switch (v19) {
        default:
          {
          int v21 = 2;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        case 0:
          {
          int v23 = 4;
          v20 = v23;
          break;
        }
        case 1:
          {
          v20 = v0;
          break;
        }
      }
      uint v24 = simt_subgroup_id(__simt_tid);
      int v25 = (int)(v24);
      int v26 = 1;
      int v27 = v12 + v26;
      v11 = v20;
      v12 = v27;
    }
    int v28 = 1;
    int v29 = v0 + v28;
    v8 = v11;
  } else {
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
      bool v40 = v2 != v39;
      int v41;
      if (v40) {
        int v42 = 2;
        v41 = v42;
      } else {
        int v43 = 3;
        int v44 = v0 + v43;
        v41 = v44;
      }
      int v45 = 0;
      int v46 = v0 + v45;
      int v47 = 1;
      int v48 = v33 + v47;
      v32 = v41;
      v33 = v48;
    }
    int v49 = 3;
    v8 = v32;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  int v54 = 0;
  bool v55 = v2 != v54;
  int v56 = v55 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v57 [[buffer(0)]], device int* v58 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v59 = static_cast<int>(__simt_tid3.x);
  int v60 = 0;
  int v61 = v60 + v59;
  int v62 = v58[v61];
  int v63 = 4;
  int v64 = v63 + v59;
  int v65 = v58[v64];
  helper0(v59, v57, v62, v65, static_cast<int>(__simt_tid3.x));
  int v66 = 8;
  int v67 = v66 + v59;
  int v68 = v58[v67];
  int v69 = 0;
  bool v70 = v68 != v69;
  int v71;
  if (v70) {
    int v72 = 3;
    v71 = v72;
  } else {
    v71 = v59;
  }
  int v73 = 16;
  int v74 = v73 + v59;
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  v57[v74] = v76;
  int v77 = 12;
  int v78 = v77 + v59;
  int v79 = v58[v78];
  uint v80 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v81 = (int)(v80);
  int v82;
  v82 = v81;
  switch (v79) {
    default:
      {
      int v83 = 16;
      int v84 = v83 + v59;
      int v85 = v58[v84];
      int v86;
      v86 = v59;
      switch (v85) {
        default:
          {
          int v87 = 20;
          int v88 = v87 + v59;
          int v89 = v58[v88];
          int v90 = 0;
          int v91 = v59 + v90;
          int v92;
          v92 = v91;
          switch (v89) {
            default:
              {
              v92 = v59;
            }
            case 0:
              {
              v92 = v59;
              break;
            }
            case 1:
              {
              int v93 = 3;
              int v94 = v59 + v93;
              v92 = v94;
              break;
            }
          }
          bool v95 = true;
          v86 = v92;
          break;
        }
        case 0:
          {
          int v96 = 24;
          int v97 = v96 + v59;
          int v98 = v58[v97];
          int v99 = 0;
          bool v100 = v98 != v99;
          int v101;
          if (v100) {
            v101 = v59;
          } else {
            int v102 = 0;
            v101 = v102;
          }
          v86 = v101;
          break;
        }
        case 1:
          {
          int v103 = 28;
          int v104 = v103 + v59;
          int v105 = v58[v104];
          int v106;
          v106 = v59;
          switch (v105) {
            case 0:
              {
              int v107 = 0;
              v106 = v107;
              break;
            }
            case 1:
              {
              int v108 = 4;
              v106 = v108;
              break;
            }
            default:
              {
              int v109 = 1;
              v106 = v109;
              break;
            }
          }
          bool v110 = true;
          v86 = v106;
          break;
        }
        case 2:
          {
          int v111 = 0;
          int v112 = 0;
          int v113;
          int v114;
          v113 = v111;
          v114 = v112;
          while (true) {
            int v115 = 4;
            int v116 = v114 * v115;
            int v117 = v116 + v59;
            int v118 = 32;
            int v119 = v118 + v117;
            int v120 = v58[v119];
            int v121 = 0;
            bool v122 = v120 != v121;
            v113 = v113;
            v114 = v114;
            if (!v122) break;
            int v123 = v113 + v114;
            int v124 = 1;
            int v125 = v114 + v124;
            v113 = v123;
            v114 = v125;
          }
          bool v126 = true;
          v86 = v113;
          break;
        }
      }
      bool v127 = true;
      v82 = v86;
      break;
    }
    case 0:
      {
      int v128 = 52;
      int v129 = v128 + v59;
      int v130 = v58[v129];
      int v131 = 0;
      bool v132 = v130 != v131;
      int v133;
      if (v132) {
        int v134 = 56;
        int v135 = v134 + v59;
        int v136 = v58[v135];
        int v137 = 2;
        int v138 = v59 + v137;
        int v139;
        v139 = v138;
        switch (v136) {
          case 0:
            {
            int v140 = 2;
            int v141 = v59 + v140;
            v139 = v141;
            break;
          }
          case 1:
            {
            int v142 = 1;
            int v143 = v59 + v142;
            v139 = v143;
          }
          default:
            {
            int v144 = 0;
            v139 = v144;
            break;
          }
        }
        bool v145 = true;
        v133 = v139;
      } else {
        int v146 = 60;
        int v147 = v146 + v59;
        int v148 = v58[v147];
        int v149;
        v149 = v59;
        switch (v148) {
          case 0:
            {
            int v150 = 1;
            v149 = v150;
            break;
          }
          default:
            {
            int v151 = 3;
            int v152 = v59 + v151;
            v149 = v152;
            break;
          }
          case 1:
            {
            int v153 = 3;
            v149 = v153;
            break;
          }
          case 2:
            {
            int v154 = 2;
            v149 = v154;
            break;
          }
        }
        bool v155 = true;
        v133 = v149;
      }
      v82 = v133;
      break;
    }
  }
  bool v156 = true;
  int v157 = 32;
  int v158 = v157 + v59;
  bool v159 = true;
  int v160 = simt_wave_count_bits(v159);
  v57[v158] = v160;
  int v161 = 3;
  int v162 = v59 + v161;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 64; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
