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
    int v7 = 3;
    int v8 = v3 % v7;
    int v9 = 4;
    int v10;
    v10 = v9;
    switch (v8) {
      default:
        {
        int v11 = 2;
        int v12 = v0 + v11;
        v10 = v12;
      }
      case 0:
        {
        v10 = v0;
      }
      case 1:
        {
        int v13 = 0;
        bool v14 = v2 != v13;
        int v15;
        if (v14) {
          v15 = v0;
        } else {
          int v16 = 3;
          int v17 = v0 + v16;
          v15 = v17;
        }
        int v18 = 4;
        v10 = v15;
        break;
      }
    }
    int v19 = 0;
    v6 = v10;
  } else {
    int v20 = 2;
    int v21 = v3 % v20;
    uint v22 = simt_lane_id(__simt_tid);
    int v23 = (int)(v22);
    int v24;
    v24 = v23;
    switch (v21) {
      case 0:
        {
        int v25 = 0;
        int v26 = 0;
        int v27;
        int v28;
        v27 = v25;
        v28 = v26;
        while (true) {
          int v29 = 4;
          int v30 = v3 % v29;
          int v31 = 1;
          int v32 = v30 + v31;
          bool v33 = v28 < v32;
          v27 = v27;
          v28 = v28;
          if (!v33) break;
          int v34 = 1;
          int v35 = v28 + v34;
          v27 = v0;
          v28 = v35;
          break;
          ;
        }
        int v36 = 3;
        v24 = v27;
      }
      case 1:
        {
        int v37 = 0;
        int v38 = v0 + v37;
        v24 = v38;
      }
      default:
        {
        int v39 = 0;
        bool v40 = v2 != v39;
        int v41;
        if (v40) {
          int v42 = 2;
          int v43 = v0 + v42;
          v41 = v43;
        } else {
          v41 = v0;
        }
        int v44 = 2;
        v24 = v41;
        break;
      }
    }
    v6 = v24;
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  int v58 = 8;
  int v59 = v58 + v51;
  int v60 = v50[v59];
  uint v61 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v62 = (int)(v61);
  int v63;
  v63 = v62;
  switch (v60) {
    case 0:
      {
      int v64 = 12;
      int v65 = v64 + v51;
      int v66 = v50[v65];
      int v67 = 0;
      bool v68 = v66 != v67;
      int v69;
      if (v68) {
        int v70 = 16;
        int v71 = v70 + v51;
        int v72 = v50[v71];
        int v73 = 3;
        int v74;
        v74 = v73;
        switch (v72) {
          case 0:
            {
            int v75 = 3;
            int v76 = v51 + v75;
            v74 = v76;
            break;
          }
          case 1:
            {
            int v77 = 3;
            int v78 = v51 + v77;
            v74 = v78;
            break;
          }
          case 2:
            {
            v74 = v51;
          }
          default:
            {
            int v79 = 4;
            v74 = v79;
            break;
          }
        }
        bool v80 = true;
        v69 = v74;
      } else {
        int v81 = 20;
        int v82 = v81 + v51;
        int v83 = v50[v82];
        int v84 = 3;
        int v85;
        v85 = v84;
        switch (v83) {
          case 0:
            {
            v85 = v51;
            break;
          }
          case 1:
            {
            int v86 = 3;
            int v87 = v51 + v86;
            v85 = v87;
          }
          case 2:
            {
            int v88 = 2;
            v85 = v88;
          }
          default:
            {
            int v89 = 0;
            int v90 = v51 + v89;
            v85 = v90;
            break;
          }
        }
        bool v91 = true;
        v69 = v85;
      }
      v63 = v69;
      break;
    }
    case 1:
      {
      int v92 = 24;
      int v93 = v92 + v51;
      int v94 = v50[v93];
      int v95 = 0;
      int v96;
      v96 = v95;
      switch (v94) {
        case 0:
          {
          int v97 = 28;
          int v98 = v97 + v51;
          int v99 = v50[v98];
          int v100 = 3;
          int v101 = v51 + v100;
          int v102;
          v102 = v101;
          switch (v99) {
            case 0:
              {
              int v103 = 4;
              int v104 = v51 + v103;
              v102 = v104;
              break;
            }
            case 1:
              {
              v102 = v51;
              break;
            }
            default:
              {
              int v105 = 4;
              v102 = v105;
              break;
            }
            case 2:
              {
              v102 = v51;
              break;
            }
          }
          bool v106 = true;
          v96 = v102;
          break;
        }
        default:
          {
          int v107 = 32;
          int v108 = v107 + v51;
          int v109 = v50[v108];
          int v110 = 0;
          bool v111 = v109 != v110;
          int v112;
          if (v111) {
            int v113 = 4;
            v112 = v113;
          } else {
            int v114 = 4;
            int v115 = v51 + v114;
            v112 = v115;
          }
          v96 = v112;
          break;
        }
        case 1:
          {
          int v116 = 36;
          int v117 = v116 + v51;
          int v118 = v50[v117];
          int v119 = 0;
          bool v120 = v118 != v119;
          int v121;
          if (v120) {
            int v122 = 3;
            int v123 = v51 + v122;
            v121 = v123;
          } else {
            int v124 = 4;
            v121 = v124;
          }
          v96 = v121;
          break;
        }
      }
      bool v125 = true;
      v63 = v96;
      break;
    }
    default:
      {
      int v126 = 40;
      int v127 = v126 + v51;
      int v128 = v50[v127];
      int v129 = 0;
      bool v130 = v128 != v129;
      int v131;
      if (v130) {
        v131 = v51;
      } else {
        int v132 = 0;
        int v133 = 0;
        int v134;
        int v135;
        v134 = v132;
        v135 = v133;
        while (true) {
          int v136 = 4;
          int v137 = v135 * v136;
          int v138 = v137 + v51;
          int v139 = 44;
          int v140 = v139 + v138;
          int v141 = v50[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          v134 = v134;
          v135 = v135;
          if (!v143) break;
          int v144 = v134 + v135;
          int v145 = 1;
          int v146 = v135 + v145;
          v134 = v144;
          v135 = v146;
        }
        bool v147 = true;
        v131 = v134;
      }
      v63 = v131;
      break;
    }
    case 2:
      {
      int v148 = 64;
      int v149 = v148 + v51;
      int v150 = v50[v149];
      int v151 = 4;
      int v152 = v51 + v151;
      int v153;
      v153 = v152;
      switch (v150) {
        default:
          {
          int v154 = 68;
          int v155 = v154 + v51;
          int v156 = v50[v155];
          int v157;
          v157 = v51;
          switch (v156) {
            default:
              {
              v157 = v51;
              break;
            }
            case 0:
              {
              v157 = v51;
              break;
            }
          }
          bool v158 = true;
          v153 = v157;
        }
        case 0:
          {
          int v159 = 72;
          int v160 = v159 + v51;
          int v161 = v50[v160];
          int v162 = 0;
          bool v163 = v161 != v162;
          int v164;
          if (v163) {
            int v165 = 0;
            v164 = v165;
          } else {
            int v166 = 3;
            int v167 = v51 + v166;
            v164 = v167;
          }
          v153 = v164;
          break;
        }
      }
      bool v168 = true;
      v63 = v153;
      break;
    }
  }
  bool v169 = true;
  int v170 = 16;
  int v171 = v170 + v51;
  bool v172 = true;
  int v173 = simt_wave_count_bits(v172);
  v49[v171] = v173;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 76; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
