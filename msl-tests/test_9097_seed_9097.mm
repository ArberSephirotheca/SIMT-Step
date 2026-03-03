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
  int v4 = 0;
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    uint v13 = simt_subgroup_id(__simt_tid);
    int v14 = (int)(v13);
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 4;
  int v22 = v3 % v21;
  uint v23 = simt_subgroup_id(__simt_tid);
  int v24 = (int)(v23);
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 0;
      int v27 = 0;
      int v28;
      int v29;
      v28 = v26;
      v29 = v27;
      while (true) {
        int v30 = 4;
        int v31 = v3 % v30;
        int v32 = 1;
        int v33 = v31 + v32;
        bool v34 = v29 < v33;
        v28 = v28;
        v29 = v29;
        if (!v34) break;
        int v35 = 2;
        int v36 = v3 % v35;
        int v37;
        v37 = v0;
        switch (v36) {
          default:
            {
            int v38 = 3;
            int v39 = v0 + v38;
            v37 = v39;
            break;
          }
          case 0:
            {
            v37 = v0;
          }
          case 1:
            {
            int v40 = 3;
            v37 = v40;
            break;
          }
        }
        int v41 = 0;
        int v42 = v0 + v41;
        int v43 = 1;
        int v44 = v29 + v43;
        v28 = v37;
        v29 = v44;
      }
      int v45 = 2;
      int v46 = v0 + v45;
      v25 = v28;
      break;
    }
    default:
      {
      int v47 = 0;
      bool v48 = v2 != v47;
      int v49;
      if (v48) {
        int v50 = 0;
        int v51 = 0;
        int v52;
        int v53;
        v52 = v50;
        v53 = v51;
        while (true) {
          int v54 = 4;
          int v55 = v3 % v54;
          int v56 = 1;
          int v57 = v55 + v56;
          bool v58 = v53 < v57;
          v52 = v52;
          v53 = v53;
          if (!v58) break;
          int v59 = 0;
          int v60 = 1;
          int v61 = v53 + v60;
          v52 = v59;
          v53 = v61;
        }
        v49 = v52;
      } else {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 4;
        int v65;
        v65 = v64;
        switch (v63) {
          default:
            {
            v65 = v0;
          }
          case 0:
            {
            v65 = v0;
            break;
          }
          case 1:
            {
            v65 = v0;
            break;
          }
          case 2:
            {
            int v66 = 2;
            int v67 = v0 + v66;
            v65 = v67;
            break;
          }
        }
        v49 = v65;
      }
      int v68 = 2;
      int v69 = v0 + v68;
      v25 = v49;
    }
    case 1:
      {
      int v70 = 0;
      bool v71 = v2 != v70;
      int v72;
      if (v71) {
        int v73 = 1;
        v72 = v73;
      } else {
        int v74 = 2;
        int v75 = v3 % v74;
        int v76;
        v76 = v0;
        switch (v75) {
          default:
            {
            int v77 = 2;
            int v78 = v0 + v77;
            v76 = v78;
            break;
          }
          case 0:
            {
            int v79 = 4;
            v76 = v79;
            break;
          }
          case 1:
            {
            int v80 = 2;
            int v81 = v0 + v80;
            v76 = v81;
            break;
          }
        }
        int v82 = 3;
        v72 = v76;
      }
      int v83 = 4;
      v25 = v72;
    }
    case 2:
      {
      int v84 = 0;
      bool v85 = v2 != v84;
      int v86;
      if (v85) {
        int v87 = 3;
        int v88 = v3 % v87;
        int v89;
        v89 = v0;
        switch (v88) {
          default:
            {
            int v90 = 1;
            v89 = v90;
            break;
          }
          case 0:
            {
            int v91 = 0;
            v89 = v91;
            break;
          }
          case 1:
            {
            int v92 = 1;
            v89 = v92;
            break;
          }
        }
        int v93 = 3;
        int v94 = v0 + v93;
        v86 = v89;
      } else {
        int v95 = 4;
        int v96 = v0 + v95;
        int v97;
        v97 = v96;
        switch (v3) {
          default:
            {
            int v98 = 3;
            int v99 = v0 + v98;
            v97 = v99;
            break;
          }
          case 0:
            {
            int v100 = 0;
            int v101 = v0 + v100;
            v97 = v101;
            break;
          }
        }
        int v102 = 3;
        int v103 = v0 + v102;
        v86 = v97;
      }
      v25 = v86;
      break;
    }
  }
  bool v104 = true;
  int v105 = simt_wave_count_bits(v104);
  int v106 = 16;
  int v107 = v106 + v0;
  v1[v107] = v105;
  int v108 = 0;
  bool v109 = v2 != v108;
  int v110 = v109 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v111 [[buffer(0)]], device int* v112 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v113 = static_cast<int>(__simt_tid3.x);
  int v114 = 0;
  int v115 = v114 + v113;
  int v116 = v112[v115];
  int v117 = 4;
  int v118 = v117 + v113;
  int v119 = v112[v118];
  helper0(v113, v111, v116, v119, static_cast<int>(__simt_tid3.x));
  int v120 = 8;
  int v121 = v120 + v113;
  int v122 = v112[v121];
  int v123;
  v123 = v113;
  switch (v122) {
    default:
      {
      int v124 = 12;
      int v125 = v124 + v113;
      int v126 = v112[v125];
      int v127;
      v127 = v113;
      switch (v126) {
        case 0:
          {
          int v128 = 16;
          int v129 = v128 + v113;
          int v130 = v112[v129];
          int v131 = 0;
          bool v132 = v130 != v131;
          int v133;
          if (v132) {
            v133 = v113;
          } else {
            v133 = v113;
          }
          v127 = v133;
          break;
        }
        default:
          {
          int v134 = 20;
          int v135 = v134 + v113;
          int v136 = v112[v135];
          int v137 = 1;
          int v138 = v113 + v137;
          int v139;
          v139 = v138;
          switch (v136) {
            default:
              {
              v139 = v113;
              break;
            }
            case 0:
              {
              int v140 = 4;
              int v141 = v113 + v140;
              v139 = v141;
              break;
            }
            case 1:
              {
              v139 = v113;
              break;
            }
          }
          bool v142 = true;
          v127 = v139;
          break;
        }
      }
      bool v143 = true;
      v123 = v127;
      break;
    }
    case 0:
      {
      int v144 = 24;
      int v145 = v144 + v113;
      int v146 = v112[v145];
      int v147;
      v147 = v113;
      switch (v146) {
        default:
          {
          int v148 = 28;
          int v149 = v148 + v113;
          int v150 = v112[v149];
          int v151;
          v151 = v113;
          switch (v150) {
            case 0:
              {
              v151 = v113;
              break;
            }
            case 1:
              {
              int v152 = 0;
              v151 = v152;
            }
            case 2:
              {
              int v153 = 1;
              v151 = v153;
            }
            default:
              {
              v151 = v113;
              break;
            }
          }
          bool v154 = true;
          v147 = v151;
          break;
        }
        case 0:
          {
          int v155 = 1;
          v147 = v155;
          break;
        }
        case 1:
          {
          v147 = v113;
          break;
        }
      }
      bool v156 = true;
      v123 = v147;
      break;
    }
  }
  bool v157 = true;
  int v158 = 32;
  int v159 = v158 + v113;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v111[v159] = v161;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
