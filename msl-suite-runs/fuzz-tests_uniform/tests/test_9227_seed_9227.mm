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
  int v4 = 3;
  int v5 = v3 % v4;
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 0;
      int v9 = v0 + v8;
      v7 = v9;
      break;
    }
    case 0:
      {
      int v10 = 4;
      v7 = v10;
      break;
    }
    case 1:
      {
      int v11 = 2;
      v7 = v11;
      break;
    }
    case 2:
      {
      int v12 = 2;
      int v13 = v3 % v12;
      int v14;
      v14 = v0;
      switch (v13) {
        default:
          {
          int v15 = 0;
          int v16 = 0;
          int v17;
          int v18;
          v17 = v15;
          v18 = v16;
          while (true) {
            int v19 = 4;
            int v20 = v3 % v19;
            int v21 = 1;
            int v22 = v20 + v21;
            bool v23 = v18 < v22;
            v17 = v17;
            v18 = v18;
            if (!v23) break;
            int v24 = 4;
            int v25 = 1;
            int v26 = v18 + v25;
            v17 = v24;
            v18 = v26;
          }
          int v27 = 3;
          v14 = v17;
          break;
        }
        case 0:
          {
          int v28 = 0;
          bool v29 = v2 != v28;
          int v30;
          if (v29) {
            v30 = v0;
          } else {
            v30 = v0;
          }
          int v31 = 1;
          v14 = v30;
          break;
        }
        case 1:
          {
          int v32 = 4;
          v14 = v32;
          break;
        }
      }
      v7 = v14;
      break;
    }
  }
  bool v33 = true;
  int v34 = simt_wave_count_bits(v33);
  int v35 = 0;
  int v36 = v35 + v0;
  v1[v36] = v34;
  int v37 = 0;
  bool v38 = v2 != v37;
  int v39 = v38 ? v0 : v7;
  return;
}

kernel void kernel_main(device int* v40 [[buffer(0)]], device int* v41 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v42 = static_cast<int>(__simt_tid3.x);
  int v43 = 0;
  int v44 = v43 + v42;
  int v45 = v41[v44];
  int v46 = 4;
  int v47 = v46 + v42;
  int v48 = v41[v47];
  helper0(v42, v40, v45, v48, static_cast<int>(__simt_tid3.x));
  uint v49 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v50 = (int)(v49);
  int v51 = 0;
  int v52 = 0;
  int v53;
  int v54;
  v53 = v51;
  v54 = v52;
  while (true) {
    int v55 = 4;
    int v56 = v54 * v55;
    int v57 = v56 + v42;
    int v58 = 8;
    int v59 = v58 + v57;
    int v60 = v41[v59];
    int v61 = 0;
    bool v62 = v60 != v61;
    v53 = v53;
    v54 = v54;
    if (!v62) break;
    int v63 = v53 + v54;
    int v64 = 1;
    int v65 = v54 + v64;
    v53 = v63;
    v54 = v65;
  }
  bool v66 = true;
  int v67 = 16;
  int v68 = v67 + v42;
  bool v69 = true;
  int v70 = simt_wave_count_bits(v69);
  v40[v68] = v70;
  int v71 = 28;
  int v72 = v71 + v42;
  int v73 = v41[v72];
  uint v74 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v75 = (int)(v74);
  int v76;
  v76 = v75;
  switch (v73) {
    case 0:
      {
      int v77 = 32;
      int v78 = v77 + v42;
      int v79 = v41[v78];
      int v80 = 0;
      int v81;
      v81 = v80;
      switch (v79) {
        case 0:
          {
          int v82 = 36;
          int v83 = v82 + v42;
          int v84 = v41[v83];
          int v85;
          v85 = v42;
          switch (v84) {
            case 0:
              {
              int v86 = 0;
              v85 = v86;
            }
            case 1:
              {
              int v87 = 2;
              v85 = v87;
              break;
            }
            case 2:
              {
              int v88 = 4;
              v85 = v88;
            }
            default:
              {
              int v89 = 0;
              v85 = v89;
              break;
            }
          }
          bool v90 = true;
          v81 = v85;
          break;
        }
        case 1:
          {
          int v91 = 40;
          int v92 = v91 + v42;
          int v93 = v41[v92];
          int v94 = 0;
          bool v95 = v93 != v94;
          int v96;
          if (v95) {
            int v97 = 3;
            v96 = v97;
          } else {
            int v98 = 4;
            v96 = v98;
          }
          v81 = v96;
          break;
        }
        case 2:
          {
          int v99 = 44;
          int v100 = v99 + v42;
          int v101 = v41[v100];
          int v102 = 3;
          int v103;
          v103 = v102;
          switch (v101) {
            case 0:
              {
              v103 = v42;
              break;
            }
            default:
              {
              int v104 = 0;
              v103 = v104;
              break;
            }
            case 1:
              {
              v103 = v42;
            }
            case 2:
              {
              int v105 = 1;
              int v106 = v42 + v105;
              v103 = v106;
              break;
            }
          }
          bool v107 = true;
          v81 = v103;
          break;
        }
        default:
          {
          int v108 = 48;
          int v109 = v108 + v42;
          int v110 = v41[v109];
          int v111 = 0;
          bool v112 = v110 != v111;
          int v113;
          if (v112) {
            int v114 = 3;
            int v115 = v42 + v114;
            v113 = v115;
          } else {
            int v116 = 0;
            int v117 = v42 + v116;
            v113 = v117;
          }
          v81 = v113;
          break;
        }
      }
      bool v118 = true;
      v76 = v81;
      break;
    }
    case 1:
      {
      int v119 = 52;
      int v120 = v119 + v42;
      int v121 = v41[v120];
      int v122 = 0;
      bool v123 = v121 != v122;
      int v124;
      if (v123) {
        int v125 = 56;
        int v126 = v125 + v42;
        int v127 = v41[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        int v130;
        if (v129) {
          v130 = v42;
        } else {
          int v131 = 0;
          int v132 = v42 + v131;
          v130 = v132;
        }
        v124 = v130;
      } else {
        int v133 = 60;
        int v134 = v133 + v42;
        int v135 = v41[v134];
        int v136;
        v136 = v42;
        switch (v135) {
          case 0:
            {
            int v137 = 2;
            v136 = v137;
            break;
          }
          default:
            {
            int v138 = 3;
            int v139 = v42 + v138;
            v136 = v139;
            break;
          }
          case 1:
            {
            int v140 = 0;
            v136 = v140;
            break;
          }
        }
        bool v141 = true;
        v124 = v136;
      }
      v76 = v124;
      break;
    }
    default:
      {
      int v142 = 0;
      int v143 = 0;
      int v144;
      int v145;
      v144 = v142;
      v145 = v143;
      while (true) {
        int v146 = 4;
        int v147 = v145 * v146;
        int v148 = v147 + v42;
        int v149 = 64;
        int v150 = v149 + v148;
        int v151 = v41[v150];
        int v152 = 0;
        bool v153 = v151 != v152;
        v144 = v144;
        v145 = v145;
        if (!v153) break;
        int v154 = v144 + v145;
        int v155 = 1;
        int v156 = v145 + v155;
        v144 = v154;
        v145 = v156;
      }
      bool v157 = true;
      v76 = v144;
      break;
    }
  }
  bool v158 = true;
  int v159 = 32;
  int v160 = v159 + v42;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v40[v160] = v162;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
