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
  int v5 = v0 + v4;
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    int v9 = 4;
    int v10 = v3 % v9;
    uint v11 = simt_subgroup_id(__simt_tid);
    int v12 = (int)(v11);
    int v13;
    v13 = v12;
    switch (v10) {
      default:
        {
        int v14 = 2;
        int v15 = v3 % v14;
        int v16;
        v16 = v0;
        switch (v15) {
          default:
            {
            int v17 = 3;
            int v18 = v0 + v17;
            v16 = v18;
            break;
          }
          case 0:
            {
            v16 = v0;
            break;
          }
          case 1:
            {
            int v19 = 4;
            int v20 = v0 + v19;
            v16 = v20;
            break;
          }
        }
        int v21 = 4;
        v13 = v16;
        break;
      }
      case 0:
        {
        int v22 = 0;
        int v23 = 0;
        int v24;
        int v25;
        v24 = v22;
        v25 = v23;
        while (true) {
          int v26 = 4;
          int v27 = v3 % v26;
          int v28 = 1;
          int v29 = v27 + v28;
          bool v30 = v25 < v29;
          v24 = v24;
          v25 = v25;
          if (!v30) break;
          int v31 = 1;
          int v32 = 1;
          int v33 = v25 + v32;
          v24 = v31;
          v25 = v33;
          continue;
          ;
        }
        v13 = v24;
        break;
      }
      case 1:
        {
        int v34 = 0;
        int v35 = 0;
        int v36;
        int v37;
        v36 = v34;
        v37 = v35;
        while (true) {
          int v38 = 4;
          int v39 = v3 % v38;
          int v40 = 1;
          int v41 = v39 + v40;
          bool v42 = v37 < v41;
          v36 = v36;
          v37 = v37;
          if (!v42) break;
          int v43 = 2;
          int v44 = 1;
          int v45 = v37 + v44;
          v36 = v43;
          v37 = v45;
        }
        int v46 = 2;
        v13 = v36;
        break;
      }
      case 2:
        {
        int v47 = 2;
        int v48 = v3 % v47;
        int v49;
        v49 = v0;
        switch (v48) {
          default:
            {
            int v50 = 2;
            v49 = v50;
            break;
          }
          case 0:
            {
            int v51 = 1;
            v49 = v51;
            break;
          }
        }
        int v52 = 0;
        v13 = v49;
        break;
      }
    }
    int v53 = 2;
    v8 = v13;
  } else {
    int v54 = 3;
    int v55 = v3 % v54;
    int v56 = 1;
    int v57 = v0 + v56;
    int v58;
    v58 = v57;
    switch (v55) {
      case 0:
        {
        int v59 = 3;
        int v60 = v3 % v59;
        int v61 = 2;
        int v62;
        v62 = v61;
        switch (v60) {
          case 0:
            {
            int v63 = 4;
            int v64 = v0 + v63;
            v62 = v64;
          }
          case 1:
            {
            v62 = v0;
          }
          case 2:
            {
            v62 = v0;
          }
          default:
            {
            v62 = v0;
            break;
          }
        }
        v58 = v62;
      }
      case 1:
        {
        int v65 = 0;
        int v66 = v0 + v65;
        v58 = v66;
        break;
      }
      case 2:
        {
        int v67 = 0;
        bool v68 = v2 != v67;
        int v69;
        if (v68) {
          int v70 = 1;
          int v71 = v0 + v70;
          v69 = v71;
        } else {
          int v72 = 4;
          v69 = v72;
        }
        v58 = v69;
        break;
      }
      default:
        {
        int v73 = 0;
        bool v74 = v2 != v73;
        int v75;
        if (v74) {
          v75 = v0;
        } else {
          int v76 = 2;
          v75 = v76;
        }
        int v77 = 2;
        v58 = v75;
        break;
      }
    }
    uint v78 = simt_subgroup_id(__simt_tid);
    int v79 = (int)(v78);
    v8 = v58;
  }
  bool v80 = true;
  int v81 = simt_wave_count_bits(v80);
  int v82 = 0;
  int v83 = v82 + v0;
  v1[v83] = v81;
  int v84 = 0;
  bool v85 = v2 != v84;
  int v86 = v85 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v87 [[buffer(0)]], device int* v88 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v89 = static_cast<int>(__simt_tid3.x);
  int v90 = 0;
  int v91 = v90 + v89;
  int v92 = v88[v91];
  int v93 = 4;
  int v94 = v93 + v89;
  int v95 = v88[v94];
  helper0(v89, v87, v92, v95, static_cast<int>(__simt_tid3.x));
  uint v96 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v97 = (int)(v96);
  int v98 = 8;
  int v99 = v98 + v89;
  int v100 = v88[v99];
  uint v101 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v102 = (int)(v101);
  int v103;
  v103 = v102;
  switch (v100) {
    default:
      {
      int v104 = 12;
      int v105 = v104 + v89;
      int v106 = v88[v105];
      int v107 = 0;
      bool v108 = v106 != v107;
      int v109;
      if (v108) {
        v109 = v89;
      } else {
        int v110 = 3;
        v109 = v110;
      }
      v103 = v109;
      break;
    }
    case 0:
      {
      int v111 = 16;
      int v112 = v111 + v89;
      int v113 = v88[v112];
      int v114 = 1;
      int v115 = v89 + v114;
      int v116;
      v116 = v115;
      switch (v113) {
        case 0:
          {
          int v117 = 20;
          int v118 = v117 + v89;
          int v119 = v88[v118];
          int v120 = 3;
          int v121;
          v121 = v120;
          switch (v119) {
            case 0:
              {
              v121 = v89;
              break;
            }
            default:
              {
              v121 = v89;
            }
            case 1:
              {
              int v122 = 2;
              int v123 = v89 + v122;
              v121 = v123;
              break;
            }
          }
          bool v124 = true;
          v116 = v121;
        }
        case 1:
          {
          int v125 = 3;
          v116 = v125;
        }
        case 2:
          {
          int v126 = 24;
          int v127 = v126 + v89;
          int v128 = v88[v127];
          int v129;
          v129 = v89;
          switch (v128) {
            case 0:
              {
              int v130 = 1;
              int v131 = v89 + v130;
              v129 = v131;
              break;
            }
            case 1:
              {
              v129 = v89;
              break;
            }
            default:
              {
              int v132 = 0;
              int v133 = v89 + v132;
              v129 = v133;
              break;
            }
          }
          bool v134 = true;
          v116 = v129;
          break;
        }
        default:
          {
          v116 = v89;
          break;
        }
      }
      bool v135 = true;
      v103 = v116;
      break;
    }
    case 1:
      {
      int v136 = 28;
      int v137 = v136 + v89;
      int v138 = v88[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        v141 = v89;
      } else {
        int v142 = 32;
        int v143 = v142 + v89;
        int v144 = v88[v143];
        int v145 = 2;
        int v146;
        v146 = v145;
        switch (v144) {
          default:
            {
            v146 = v89;
            break;
          }
          case 0:
            {
            v146 = v89;
            break;
          }
        }
        bool v147 = true;
        v141 = v146;
      }
      v103 = v141;
      break;
    }
  }
  bool v148 = true;
  int v149 = 16;
  int v150 = v149 + v89;
  bool v151 = true;
  int v152 = simt_wave_count_bits(v151);
  v87[v150] = v152;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 36; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
