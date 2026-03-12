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
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 4;
    int v16 = v3 % v15;
    uint v17 = simt_subgroup_id(__simt_tid);
    int v18 = (int)(v17);
    int v19;
    v19 = v18;
    switch (v16) {
      case 0:
        {
        int v20 = 4;
        v19 = v20;
        break;
      }
      case 1:
        {
        int v21 = 2;
        int v22 = v3 % v21;
        int v23 = 4;
        int v24 = v0 + v23;
        int v25;
        v25 = v24;
        switch (v22) {
          case 0:
            {
            int v26 = 1;
            v25 = v26;
          }
          default:
            {
            int v27 = 2;
            int v28 = v0 + v27;
            v25 = v28;
            break;
          }
        }
        int v29 = 2;
        int v30 = v0 + v29;
        v19 = v25;
        break;
      }
      case 2:
        {
        int v31 = 0;
        bool v32 = v2 != v31;
        int v33;
        if (v32) {
          int v34 = 0;
          int v35 = v0 + v34;
          v33 = v35;
        } else {
          int v36 = 4;
          v33 = v36;
        }
        v19 = v33;
        break;
      }
      default:
        {
        int v37 = 2;
        int v38 = v3 % v37;
        int v39 = 4;
        int v40 = v0 + v39;
        int v41;
        v41 = v40;
        switch (v38) {
          case 0:
            {
            int v42 = 2;
            int v43 = v0 + v42;
            v41 = v43;
            break;
          }
          default:
            {
            v41 = v0;
            break;
          }
        }
        int v44 = 3;
        v19 = v41;
        break;
      }
    }
    int v45 = 4;
    int v46 = v0 + v45;
    int v47 = 1;
    int v48 = v9 + v47;
    v8 = v19;
    v9 = v48;
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  int v53 = 0;
  bool v54 = v2 != v53;
  int v55 = v54 ? v5 : v8;
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
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 0;
  int v66 = 0;
  int v67;
  int v68;
  v67 = v65;
  v68 = v66;
  while (true) {
    int v69 = 4;
    int v70 = v68 * v69;
    int v71 = v70 + v58;
    int v72 = 8;
    int v73 = v72 + v71;
    int v74 = v57[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    v67 = v67;
    v68 = v68;
    if (!v76) break;
    int v77 = 28;
    int v78 = v77 + v58;
    int v79 = v57[v78];
    int v80 = 2;
    int v81 = v58 + v80;
    int v82;
    v82 = v81;
    switch (v79) {
      default:
        {
        int v83 = 32;
        int v84 = v83 + v58;
        int v85 = v57[v84];
        int v86 = 0;
        bool v87 = v85 != v86;
        int v88;
        if (v87) {
          v88 = v58;
        } else {
          v88 = v58;
        }
        v82 = v88;
        break;
      }
      case 0:
        {
        int v89 = 1;
        int v90 = v58 + v89;
        v82 = v90;
      }
      case 1:
        {
        int v91 = 36;
        int v92 = v91 + v58;
        int v93 = v57[v92];
        int v94 = 3;
        int v95;
        v95 = v94;
        switch (v93) {
          case 0:
            {
            int v96 = 1;
            v95 = v96;
          }
          default:
            {
            int v97 = 2;
            v95 = v97;
            break;
          }
          case 1:
            {
            int v98 = 2;
            int v99 = v58 + v98;
            v95 = v99;
            break;
          }
        }
        bool v100 = true;
        v82 = v95;
      }
      case 2:
        {
        int v101 = 40;
        int v102 = v101 + v58;
        int v103 = v57[v102];
        int v104 = 4;
        int v105;
        v105 = v104;
        switch (v103) {
          case 0:
            {
            int v106 = 1;
            v105 = v106;
          }
          case 1:
            {
            v105 = v58;
            break;
          }
          case 2:
            {
            int v107 = 4;
            int v108 = v58 + v107;
            v105 = v108;
            break;
          }
          default:
            {
            int v109 = 1;
            int v110 = v58 + v109;
            v105 = v110;
            break;
          }
        }
        bool v111 = true;
        v82 = v105;
        break;
      }
    }
    bool v112 = true;
    int v113 = v67 + v82;
    int v114 = 1;
    int v115 = v68 + v114;
    v67 = v113;
    v68 = v115;
    break;
    ;
  }
  bool v116 = true;
  int v117 = 16;
  int v118 = v117 + v58;
  bool v119 = true;
  int v120 = simt_wave_count_bits(v119);
  v56[v118] = v120;
  int v121 = 44;
  int v122 = v121 + v58;
  int v123 = v57[v122];
  int v124 = 3;
  int v125;
  v125 = v124;
  switch (v123) {
    case 0:
      {
      v125 = v58;
      break;
    }
    default:
      {
      int v126 = 4;
      int v127 = v58 + v126;
      v125 = v127;
      break;
    }
    case 1:
      {
      v125 = v58;
      break;
    }
    case 2:
      {
      int v128 = 48;
      int v129 = v128 + v58;
      int v130 = v57[v129];
      int v131 = 2;
      int v132;
      v132 = v131;
      switch (v130) {
        default:
          {
          int v133 = 52;
          int v134 = v133 + v58;
          int v135 = v57[v134];
          int v136 = 0;
          bool v137 = v135 != v136;
          int v138;
          if (v137) {
            int v139 = 3;
            int v140 = v58 + v139;
            v138 = v140;
          } else {
            int v141 = 3;
            int v142 = v58 + v141;
            v138 = v142;
          }
          v132 = v138;
          break;
        }
        case 0:
          {
          int v143 = 56;
          int v144 = v143 + v58;
          int v145 = v57[v144];
          int v146 = 2;
          int v147;
          v147 = v146;
          switch (v145) {
            case 0:
              {
              v147 = v58;
            }
            default:
              {
              v147 = v58;
              break;
            }
            case 1:
              {
              int v148 = 1;
              v147 = v148;
            }
            case 2:
              {
              int v149 = 0;
              v147 = v149;
              break;
            }
          }
          bool v150 = true;
          v132 = v147;
          break;
        }
        case 1:
          {
          int v151 = 60;
          int v152 = v151 + v58;
          int v153 = v57[v152];
          int v154 = 3;
          int v155;
          v155 = v154;
          switch (v153) {
            case 0:
              {
              v155 = v58;
              break;
            }
            case 1:
              {
              v155 = v58;
              break;
            }
            case 2:
              {
              v155 = v58;
              break;
            }
            default:
              {
              v155 = v58;
              break;
            }
          }
          bool v156 = true;
          v132 = v155;
          break;
        }
      }
      bool v157 = true;
      v125 = v132;
      break;
    }
  }
  bool v158 = true;
  int v159 = 32;
  int v160 = v159 + v58;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v56[v160] = v162;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
