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
  uint v4 = simt_subgroup_id(__simt_tid);
  int v5 = (int)(v4);
  int v6 = 0;
  bool v7 = v2 != v6;
  int v8;
  if (v7) {
    v8 = v0;
  } else {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 4;
    int v12;
    v12 = v11;
    switch (v10) {
      case 0:
        {
        v12 = v0;
        break;
      }
      default:
        {
        int v13 = 0;
        v12 = v13;
        break;
      }
      case 1:
        {
        int v14 = 4;
        int v15 = v0 + v14;
        v12 = v15;
        break;
      }
      case 2:
        {
        int v16 = 0;
        int v17 = 0;
        int v18;
        int v19;
        v18 = v16;
        v19 = v17;
        while (true) {
          int v20 = 4;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23 = v21 + v22;
          bool v24 = v19 < v23;
          v18 = v18;
          v19 = v19;
          if (!v24) break;
          int v25 = 3;
          int v26 = v0 + v25;
          int v27 = 1;
          int v28 = v19 + v27;
          v18 = v26;
          v19 = v28;
        }
        v12 = v18;
        break;
      }
    }
    v8 = v12;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35 = v34 ? v5 : v8;
  return;
}

kernel void kernel_main(device int* v36 [[buffer(0)]], device int* v37 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v38 = static_cast<int>(__simt_tid3.x);
  int v39 = 0;
  int v40 = v39 + v38;
  int v41 = v37[v40];
  int v42 = 4;
  int v43 = v42 + v38;
  int v44 = v37[v43];
  helper0(v38, v36, v41, v44, static_cast<int>(__simt_tid3.x));
  int v45 = 0;
  int v46 = 0;
  int v47;
  int v48;
  v47 = v45;
  v48 = v46;
  while (true) {
    int v49 = 4;
    int v50 = v48 * v49;
    int v51 = v50 + v38;
    int v52 = 8;
    int v53 = v52 + v51;
    int v54 = v37[v53];
    int v55 = 0;
    bool v56 = v54 != v55;
    v47 = v47;
    v48 = v48;
    if (!v56) break;
    int v57 = v47 + v48;
    int v58 = 1;
    int v59 = v48 + v58;
    v47 = v57;
    v48 = v59;
  }
  bool v60 = true;
  int v61 = 16;
  int v62 = v61 + v38;
  bool v63 = true;
  int v64 = simt_wave_count_bits(v63);
  v36[v62] = v64;
  int v65 = 28;
  int v66 = v65 + v38;
  int v67 = v37[v66];
  uint v68 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v69 = (int)(v68);
  int v70;
  v70 = v69;
  switch (v67) {
    case 0:
      {
      int v71 = 0;
      int v72 = 0;
      int v73;
      int v74;
      v73 = v71;
      v74 = v72;
      while (true) {
        int v75 = 4;
        int v76 = v74 * v75;
        int v77 = v76 + v38;
        int v78 = 32;
        int v79 = v78 + v77;
        int v80 = v37[v79];
        int v81 = 0;
        bool v82 = v80 != v81;
        v73 = v73;
        v74 = v74;
        if (!v82) break;
        int v83 = 52;
        int v84 = v83 + v38;
        int v85 = v37[v84];
        int v86 = 0;
        bool v87 = v85 != v86;
        int v88;
        if (v87) {
          int v89 = 0;
          v88 = v89;
        } else {
          int v90 = 2;
          int v91 = v38 + v90;
          v88 = v91;
        }
        int v92 = v73 + v88;
        int v93 = 1;
        int v94 = v74 + v93;
        v73 = v92;
        v74 = v94;
      }
      bool v95 = true;
      v70 = v73;
      break;
    }
    case 1:
      {
      int v96 = 0;
      v70 = v96;
      break;
    }
    case 2:
      {
      int v97 = 56;
      int v98 = v97 + v38;
      int v99 = v37[v98];
      int v100 = 0;
      bool v101 = v99 != v100;
      int v102;
      if (v101) {
        int v103 = 60;
        int v104 = v103 + v38;
        int v105 = v37[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        int v108;
        if (v107) {
          int v109 = 3;
          v108 = v109;
        } else {
          int v110 = 3;
          v108 = v110;
        }
        v102 = v108;
      } else {
        int v111 = 4;
        int v112 = v38 + v111;
        v102 = v112;
      }
      v70 = v102;
      break;
    }
    default:
      {
      int v113 = 64;
      int v114 = v113 + v38;
      int v115 = v37[v114];
      int v116 = 1;
      int v117;
      v117 = v116;
      switch (v115) {
        default:
          {
          int v118 = 68;
          int v119 = v118 + v38;
          int v120 = v37[v119];
          int v121;
          v121 = v38;
          switch (v120) {
            default:
              {
              int v122 = 4;
              v121 = v122;
              break;
            }
            case 0:
              {
              int v123 = 3;
              int v124 = v38 + v123;
              v121 = v124;
              break;
            }
            case 1:
              {
              v121 = v38;
              break;
            }
            case 2:
              {
              int v125 = 4;
              v121 = v125;
              break;
            }
          }
          bool v126 = true;
          v117 = v121;
          break;
        }
        case 0:
          {
          int v127 = 72;
          int v128 = v127 + v38;
          int v129 = v37[v128];
          int v130;
          v130 = v38;
          switch (v129) {
            case 0:
              {
              int v131 = 0;
              v130 = v131;
              break;
            }
            default:
              {
              v130 = v38;
              break;
            }
          }
          bool v132 = true;
          v117 = v130;
          break;
        }
        case 1:
          {
          int v133 = 76;
          int v134 = v133 + v38;
          int v135 = v37[v134];
          int v136 = 2;
          int v137 = v38 + v136;
          int v138;
          v138 = v137;
          switch (v135) {
            case 0:
              {
              int v139 = 1;
              int v140 = v38 + v139;
              v138 = v140;
            }
            default:
              {
              int v141 = 1;
              int v142 = v38 + v141;
              v138 = v142;
              break;
            }
            case 1:
              {
              v138 = v38;
            }
            case 2:
              {
              int v143 = 0;
              v138 = v143;
              break;
            }
          }
          bool v144 = true;
          v117 = v138;
          break;
        }
        case 2:
          {
          int v145 = 80;
          int v146 = v145 + v38;
          int v147 = v37[v146];
          int v148 = 0;
          bool v149 = v147 != v148;
          int v150;
          if (v149) {
            int v151 = 3;
            v150 = v151;
          } else {
            int v152 = 0;
            v150 = v152;
          }
          v117 = v150;
          break;
        }
      }
      bool v153 = true;
      v70 = v117;
      break;
    }
  }
  bool v154 = true;
  int v155 = 32;
  int v156 = v155 + v38;
  bool v157 = true;
  int v158 = simt_wave_count_bits(v157);
  v36[v156] = v158;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
