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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 2;
    int v8 = v3 % v7;
    uint v9 = simt_subgroup_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 2;
        int v13 = v3 % v12;
        int v14 = 4;
        int v15 = v0 + v14;
        int v16;
        v16 = v15;
        switch (v13) {
          default:
            {
            int v17 = 4;
            v16 = v17;
            break;
          }
          case 0:
            {
            int v18 = 0;
            v16 = v18;
            break;
          }
        }
        v11 = v16;
        break;
      }
      default:
        {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 4;
          int v23 = v0 + v22;
          v21 = v23;
        } else {
          v21 = v0;
        }
        v11 = v21;
        break;
      }
    }
    v6 = v11;
  } else {
    int v24 = 3;
    int v25 = v3 % v24;
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    int v28;
    v28 = v27;
    switch (v25) {
      case 0:
        {
        int v29 = 0;
        bool v30 = v2 != v29;
        int v31;
        if (v30) {
          int v32 = 0;
          int v33 = v0 + v32;
          v31 = v33;
        } else {
          int v34 = 2;
          int v35 = v0 + v34;
          v31 = v35;
        }
        v28 = v31;
        break;
      }
      default:
        {
        int v36 = 0;
        v28 = v36;
        break;
      }
      case 1:
        {
        int v37 = 3;
        int v38 = v3 % v37;
        int v39 = 2;
        int v40 = v0 + v39;
        int v41;
        v41 = v40;
        switch (v38) {
          case 0:
            {
            int v42 = 4;
            v41 = v42;
            break;
          }
          default:
            {
            v41 = v0;
            break;
          }
          case 1:
            {
            v41 = v0;
          }
          case 2:
            {
            int v43 = 3;
            v41 = v43;
            break;
          }
        }
        v28 = v41;
        break;
      }
      case 2:
        {
        int v44 = 0;
        bool v45 = v2 != v44;
        int v46;
        if (v45) {
          int v47 = 4;
          v46 = v47;
        } else {
          int v48 = 4;
          int v49 = v0 + v48;
          v46 = v49;
        }
        v28 = v46;
        break;
      }
    }
    v6 = v28;
  }
  bool v50 = true;
  int v51 = simt_wave_count_bits(v50);
  int v52 = 0;
  int v53 = v52 + v0;
  v1[v53] = v51;
  return;
}

kernel void kernel_main(device int* v54 [[buffer(0)]], device int* v55 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v56 = static_cast<int>(__simt_tid3.x);
  int v57 = 0;
  int v58 = v57 + v56;
  int v59 = v55[v58];
  int v60 = 4;
  int v61 = v60 + v56;
  int v62 = v55[v61];
  int v63 = 0;
  bool v64 = v59 != v63;
  if (v64) {
    int v65 = 8;
    int v66 = v65 + v56;
    int v67 = v55[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    if (v69) {
      helper0(v56, v54, v59, v62, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v70 = 12;
  int v71 = v70 + v56;
  int v72 = v55[v71];
  int v73;
  v73 = v56;
  switch (v72) {
    case 0:
      {
      int v74 = 16;
      int v75 = v74 + v56;
      int v76 = v55[v75];
      int v77 = 0;
      bool v78 = v76 != v77;
      int v79;
      if (v78) {
        int v80 = 0;
        int v81 = 0;
        int v82;
        int v83;
        v82 = v80;
        v83 = v81;
        while (true) {
          int v84 = 4;
          int v85 = v83 * v84;
          int v86 = v85 + v56;
          int v87 = 20;
          int v88 = v87 + v86;
          int v89 = v55[v88];
          int v90 = 0;
          bool v91 = v89 != v90;
          v82 = v82;
          v83 = v83;
          if (!v91) break;
          int v92 = v82 + v83;
          int v93 = 1;
          int v94 = v83 + v93;
          bool v95 = true;
          v82 = v92;
          v83 = v94;
        }
        v79 = v82;
      } else {
        int v96 = 40;
        int v97 = v96 + v56;
        int v98 = v55[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        int v101;
        if (v100) {
          v101 = v56;
        } else {
          v101 = v56;
        }
        v79 = v101;
      }
      v73 = v79;
      break;
    }
    case 1:
      {
      int v102 = 44;
      int v103 = v102 + v56;
      int v104 = v55[v103];
      int v105 = 2;
      int v106;
      v106 = v105;
      switch (v104) {
        default:
          {
          int v107 = 48;
          int v108 = v107 + v56;
          int v109 = v55[v108];
          int v110 = 0;
          int v111;
          v111 = v110;
          switch (v109) {
            case 0:
              {
              int v112 = 2;
              v111 = v112;
            }
            default:
              {
              int v113 = 0;
              v111 = v113;
              break;
            }
            case 1:
              {
              v111 = v56;
              break;
            }
          }
          bool v114 = true;
          v106 = v111;
          break;
        }
        case 0:
          {
          int v115 = 1;
          v106 = v115;
          break;
        }
      }
      v73 = v106;
      break;
    }
    case 2:
      {
      int v116 = 52;
      int v117 = v116 + v56;
      int v118 = v55[v117];
      int v119 = 0;
      int v120;
      v120 = v119;
      switch (v118) {
        case 0:
          {
          int v121 = 56;
          int v122 = v121 + v56;
          int v123 = v55[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            v126 = v56;
          } else {
            v126 = v56;
          }
          v120 = v126;
        }
        default:
          {
          int v127 = 60;
          int v128 = v127 + v56;
          int v129 = v55[v128];
          int v130;
          v130 = v56;
          switch (v129) {
            case 0:
              {
              int v131 = 3;
              int v132 = v56 + v131;
              v130 = v132;
              break;
            }
            default:
              {
              int v133 = 0;
              int v134 = v56 + v133;
              v130 = v134;
              break;
            }
          }
          bool v135 = true;
          v120 = v130;
          break;
        }
      }
      bool v136 = true;
      v73 = v120;
      break;
    }
    default:
      {
      int v137 = 0;
      int v138 = 0;
      int v139;
      int v140;
      v139 = v137;
      v140 = v138;
      while (true) {
        int v141 = 4;
        int v142 = v140 * v141;
        int v143 = v142 + v56;
        int v144 = 64;
        int v145 = v144 + v143;
        int v146 = v55[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        v139 = v139;
        v140 = v140;
        if (!v148) break;
        int v149 = 84;
        int v150 = v149 + v56;
        int v151 = v55[v150];
        int v152 = 2;
        int v153 = v56 + v152;
        int v154;
        v154 = v153;
        switch (v151) {
          default:
            {
            int v155 = 3;
            int v156 = v56 + v155;
            v154 = v156;
            break;
          }
          case 0:
            {
            v154 = v56;
          }
          case 1:
            {
            int v157 = 2;
            v154 = v157;
            break;
          }
          case 2:
            {
            int v158 = 3;
            int v159 = v56 + v158;
            v154 = v159;
            break;
          }
        }
        int v160 = v139 + v154;
        int v161 = 1;
        int v162 = v140 + v161;
        bool v163 = true;
        v139 = v160;
        v140 = v162;
      }
      v73 = v139;
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
    static int32_t expected0[] = {static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 1; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
