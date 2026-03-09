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
  int v4 = 2;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 3;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    case 0:
      {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13;
      v13 = v0;
      switch (v12) {
        default:
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
            int v23 = 4;
            int v24 = 1;
            int v25 = v17 + v24;
            v16 = v23;
            v17 = v25;
            break;
            ;
          }
          v13 = v16;
          break;
        }
        case 0:
          {
          int v26 = 2;
          int v27 = v3 % v26;
          int v28 = 3;
          int v29 = v0 + v28;
          int v30;
          v30 = v29;
          switch (v27) {
            default:
              {
              v30 = v0;
              break;
            }
            case 0:
              {
              int v31 = 2;
              v30 = v31;
              break;
            }
          }
          v13 = v30;
          break;
        }
        case 1:
          {
          int v32 = 4;
          v13 = v32;
          break;
        }
        case 2:
          {
          int v33 = 0;
          bool v34 = v2 != v33;
          int v35;
          if (v34) {
            int v36 = 3;
            int v37 = v0 + v36;
            v35 = v37;
          } else {
            int v38 = 3;
            v35 = v38;
          }
          v13 = v35;
          break;
        }
      }
      v8 = v13;
    }
    case 1:
      {
      int v39 = 2;
      int v40 = v0 + v39;
      v8 = v40;
      break;
    }
  }
  bool v41 = true;
  int v42 = simt_wave_count_bits(v41);
  int v43 = 0;
  int v44 = v43 + v0;
  v1[v44] = v42;
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
  helper0(v47, v45, v50, v53, static_cast<int>(__simt_tid3.x));
  int v54 = 8;
  int v55 = v54 + v47;
  int v56 = v46[v55];
  int v57 = 0;
  bool v58 = v56 != v57;
  int v59;
  if (v58) {
    uint v60 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v61 = (int)(v60);
    v59 = v61;
  } else {
    int v62 = 12;
    int v63 = v62 + v47;
    int v64 = v46[v63];
    uint v65 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v66 = (int)(v65);
    int v67;
    v67 = v66;
    switch (v64) {
      default:
        {
        int v68 = 16;
        int v69 = v68 + v47;
        int v70 = v46[v69];
        int v71 = 1;
        int v72 = v47 + v71;
        int v73;
        v73 = v72;
        switch (v70) {
          case 0:
            {
            int v74 = 4;
            int v75 = v47 + v74;
            v73 = v75;
            break;
          }
          case 1:
            {
            v73 = v47;
            break;
          }
          default:
            {
            int v76 = 3;
            int v77 = v47 + v76;
            v73 = v77;
            break;
          }
        }
        v67 = v73;
        break;
      }
      case 0:
        {
        int v78 = 20;
        int v79 = v78 + v47;
        int v80 = v46[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        int v83;
        if (v82) {
          int v84 = 4;
          v83 = v84;
        } else {
          v83 = v47;
        }
        v67 = v83;
        break;
      }
    }
    v59 = v67;
  }
  int v85 = 16;
  int v86 = v85 + v47;
  bool v87 = true;
  int v88 = simt_wave_count_bits(v87);
  v45[v86] = v88;
  int v89 = 24;
  int v90 = v89 + v47;
  int v91 = v46[v90];
  int v92 = 3;
  int v93;
  v93 = v92;
  switch (v91) {
    case 0:
      {
      int v94 = 2;
      int v95 = v47 + v94;
      v93 = v95;
    }
    case 1:
      {
      int v96 = 28;
      int v97 = v96 + v47;
      int v98 = v46[v97];
      int v99;
      v99 = v47;
      switch (v98) {
        case 0:
          {
          int v100 = 32;
          int v101 = v100 + v47;
          int v102 = v46[v101];
          int v103 = 4;
          int v104;
          v104 = v103;
          switch (v102) {
            case 0:
              {
              int v105 = 4;
              int v106 = v47 + v105;
              v104 = v106;
              break;
            }
            case 1:
              {
              int v107 = 3;
              int v108 = v47 + v107;
              v104 = v108;
              break;
            }
            default:
              {
              int v109 = 4;
              v104 = v109;
              break;
            }
          }
          v99 = v104;
        }
        default:
          {
          int v110 = 0;
          int v111 = 0;
          int v112;
          int v113;
          v112 = v110;
          v113 = v111;
          while (true) {
            int v114 = 4;
            int v115 = v113 * v114;
            int v116 = v115 + v47;
            int v117 = 36;
            int v118 = v117 + v116;
            int v119 = v46[v118];
            int v120 = 0;
            bool v121 = v119 != v120;
            v112 = v112;
            v113 = v113;
            if (!v121) break;
            int v122 = v112 + v113;
            int v123 = 1;
            int v124 = v113 + v123;
            bool v125 = true;
            v112 = v122;
            v113 = v124;
          }
          v99 = v112;
          break;
        }
        case 1:
          {
          int v126 = 56;
          int v127 = v126 + v47;
          int v128 = v46[v127];
          int v129;
          v129 = v47;
          switch (v128) {
            default:
              {
              int v130 = 0;
              v129 = v130;
            }
            case 0:
              {
              int v131 = 4;
              int v132 = v47 + v131;
              v129 = v132;
              break;
            }
          }
          bool v133 = true;
          v99 = v129;
          break;
        }
      }
      bool v134 = true;
      v93 = v99;
    }
    default:
      {
      int v135 = 60;
      int v136 = v135 + v47;
      int v137 = v46[v136];
      int v138 = 4;
      int v139;
      v139 = v138;
      switch (v137) {
        case 0:
          {
          int v140 = 64;
          int v141 = v140 + v47;
          int v142 = v46[v141];
          int v143 = 0;
          bool v144 = v142 != v143;
          int v145;
          if (v144) {
            int v146 = 4;
            int v147 = v47 + v146;
            v145 = v147;
          } else {
            int v148 = 2;
            v145 = v148;
          }
          v139 = v145;
          break;
        }
        case 1:
          {
          int v149 = 1;
          int v150 = v47 + v149;
          v139 = v150;
          break;
        }
        default:
          {
          int v151 = 68;
          int v152 = v151 + v47;
          int v153 = v46[v152];
          int v154 = 0;
          bool v155 = v153 != v154;
          int v156;
          if (v155) {
            v156 = v47;
          } else {
            int v157 = 0;
            int v158 = v47 + v157;
            v156 = v158;
          }
          v139 = v156;
          break;
        }
      }
      v93 = v139;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
