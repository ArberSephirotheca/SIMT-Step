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
  int v8 = 2;
  int v9 = v3 % v8;
  int v10;
  v10 = v0;
  switch (v9) {
    case 0:
      {
      int v11 = 1;
      v10 = v11;
      break;
    }
    case 1:
      {
      int v12 = 0;
      bool v13 = v2 != v12;
      int v14;
      if (v13) {
        int v15 = 0;
        bool v16 = v2 != v15;
        int v17;
        if (v16) {
          v17 = v0;
        } else {
          v17 = v0;
        }
        v14 = v17;
      } else {
        int v18;
        v18 = v0;
        switch (v3) {
          default:
            {
            int v19 = 1;
            v18 = v19;
            break;
          }
          case 0:
            {
            int v20 = 0;
            int v21 = v0 + v20;
            v18 = v21;
            break;
          }
        }
        v14 = v18;
      }
      v10 = v14;
    }
    default:
      {
      int v22 = 0;
      bool v23 = v2 != v22;
      int v24;
      if (v23) {
        int v25 = 2;
        int v26 = v3 % v25;
        int v27 = 3;
        int v28;
        v28 = v27;
        switch (v26) {
          case 0:
            {
            int v29 = 2;
            int v30 = v0 + v29;
            v28 = v30;
            break;
          }
          default:
            {
            v28 = v0;
            break;
          }
        }
        v24 = v28;
      } else {
        int v31 = 2;
        int v32 = v3 % v31;
        int v33 = 3;
        int v34;
        v34 = v33;
        switch (v32) {
          case 0:
            {
            int v35 = 0;
            v34 = v35;
          }
          default:
            {
            int v36 = 2;
            int v37 = v0 + v36;
            v34 = v37;
            break;
          }
        }
        v24 = v34;
      }
      v10 = v24;
      break;
    }
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 16;
  int v41 = v40 + v0;
  v1[v41] = v39;
  int v42 = 0;
  bool v43 = v2 != v42;
  int v44 = v43 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v45 [[buffer(0)]], device int* v46 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v47 = static_cast<int>(__simt_tid3.x);
  int v48 = 0;
  int v49 = v48 + v47;
  int v50 = v46[v49];
  int v51 = 4;
  int v52 = v51 + v47;
  int v53 = v46[v52];
  int v54 = 0;
  bool v55 = v50 != v54;
  if (v55) {
    int v56 = 8;
    int v57 = v56 + v47;
    int v58 = v46[v57];
    int v59 = 0;
    bool v60 = v58 != v59;
    if (v60) {
    } else {
      int v61 = 3;
      int v62 = v47 % v61;
      uint v63 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v64 = (int)(v63);
      int v65;
      v65 = v64;
      switch (v62) {
        case 0:
          {
          int v66 = 4;
          int v67 = v65 + v66;
          v65 = v67;
          break;
        }
        case 1:
          {
          int v68 = 1;
          int v69 = v65 + v68;
          v65 = v69;
          break;
        }
        default:
          {
          int v70 = 0;
          int v71 = v65 + v70;
          v65 = v71;
          break;
        }
        case 2:
          {
          int v72 = 0;
          int v73 = v65 + v72;
          v65 = v73;
          break;
        }
      }
      helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v74 = 12;
  int v75 = v74 + v47;
  int v76 = v46[v75];
  uint v77 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v78 = (int)(v77);
  int v79;
  v79 = v78;
  switch (v76) {
    default:
      {
      int v80 = 0;
      int v81 = 0;
      int v82;
      int v83;
      v82 = v80;
      v83 = v81;
      while (true) {
        int v84 = 4;
        int v85 = v83 * v84;
        int v86 = v85 + v47;
        int v87 = 16;
        int v88 = v87 + v86;
        int v89 = v46[v88];
        int v90 = 0;
        bool v91 = v89 != v90;
        v82 = v82;
        v83 = v83;
        if (!v91) break;
        int v92 = 36;
        int v93 = v92 + v47;
        int v94 = v46[v93];
        int v95 = 0;
        bool v96 = v94 != v95;
        int v97;
        if (v96) {
          v97 = v47;
        } else {
          v97 = v47;
        }
        int v98 = v82 + v97;
        int v99 = 1;
        int v100 = v83 + v99;
        bool v101 = true;
        v82 = v98;
        v83 = v100;
      }
      v79 = v82;
      break;
    }
    case 0:
      {
      int v102 = 40;
      int v103 = v102 + v47;
      int v104 = v46[v103];
      int v105;
      v105 = v47;
      switch (v104) {
        case 0:
          {
          int v106 = 1;
          v105 = v106;
        }
        default:
          {
          int v107 = 44;
          int v108 = v107 + v47;
          int v109 = v46[v108];
          int v110 = 0;
          int v111 = v47 + v110;
          int v112;
          v112 = v111;
          switch (v109) {
            case 0:
              {
              int v113 = 1;
              int v114 = v47 + v113;
              v112 = v114;
              break;
            }
            default:
              {
              int v115 = 1;
              int v116 = v47 + v115;
              v112 = v116;
              break;
            }
            case 1:
              {
              int v117 = 3;
              v112 = v117;
              break;
            }
          }
          bool v118 = true;
          v105 = v112;
          break;
        }
      }
      v79 = v105;
      break;
    }
    case 1:
      {
      int v119 = 48;
      int v120 = v119 + v47;
      int v121 = v46[v120];
      int v122 = 0;
      int v123 = v47 + v122;
      int v124;
      v124 = v123;
      switch (v121) {
        case 0:
          {
          int v125 = 52;
          int v126 = v125 + v47;
          int v127 = v46[v126];
          int v128 = 1;
          int v129 = v47 + v128;
          int v130;
          v130 = v129;
          switch (v127) {
            default:
              {
              v130 = v47;
              break;
            }
            case 0:
              {
              int v131 = 1;
              int v132 = v47 + v131;
              v130 = v132;
            }
            case 1:
              {
              int v133 = 2;
              v130 = v133;
              break;
            }
          }
          v124 = v130;
          break;
        }
        default:
          {
          int v134 = 0;
          int v135 = 0;
          int v136;
          int v137;
          v136 = v134;
          v137 = v135;
          while (true) {
            int v138 = 4;
            int v139 = v137 * v138;
            int v140 = v139 + v47;
            int v141 = 56;
            int v142 = v141 + v140;
            int v143 = v46[v142];
            int v144 = 0;
            bool v145 = v143 != v144;
            v136 = v136;
            v137 = v137;
            if (!v145) break;
            int v146 = v136 + v137;
            int v147 = 1;
            int v148 = v137 + v147;
            bool v149 = true;
            v136 = v146;
            v137 = v148;
          }
          v124 = v136;
          break;
        }
      }
      v79 = v124;
      break;
    }
  }
  bool v150 = true;
  int v151 = 32;
  int v152 = v151 + v47;
  bool v153 = true;
  int v154 = simt_wave_count_bits(v153);
  v45[v152] = v154;
  uint v155 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v156 = (int)(v155);
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
