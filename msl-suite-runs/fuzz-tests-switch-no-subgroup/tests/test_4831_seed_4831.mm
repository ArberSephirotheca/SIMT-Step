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
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      v8 = v0;
      break;
    }
    case 0:
      {
      int v9 = 0;
      bool v10 = v2 != v9;
      int v11;
      if (v10) {
        int v12 = 4;
        int v13 = v3 % v12;
        int v14 = 2;
        int v15 = v0 + v14;
        int v16;
        v16 = v15;
        switch (v13) {
          case 0:
            {
            int v17 = 4;
            int v18 = v0 + v17;
            v16 = v18;
            break;
          }
          case 1:
            {
            int v19 = 3;
            int v20 = v0 + v19;
            v16 = v20;
            break;
          }
          case 2:
            {
            v16 = v0;
            break;
          }
          default:
            {
            int v21 = 0;
            v16 = v21;
            break;
          }
        }
        v11 = v16;
      } else {
        int v22 = 3;
        int v23 = v3 % v22;
        int v24;
        v24 = v0;
        switch (v23) {
          case 0:
            {
            int v25 = 4;
            int v26 = v0 + v25;
            v24 = v26;
            break;
          }
          default:
            {
            v24 = v0;
            break;
          }
          case 1:
            {
            int v27 = 3;
            v24 = v27;
            break;
          }
        }
        int v28 = 3;
        v11 = v24;
      }
      v8 = v11;
      break;
    }
    case 1:
      {
      int v29 = 0;
      int v30 = 0;
      int v31;
      int v32;
      v31 = v29;
      v32 = v30;
      while (true) {
        int v33 = 4;
        int v34 = v3 % v33;
        int v35 = 1;
        int v36 = v34 + v35;
        bool v37 = v32 < v36;
        v31 = v31;
        v32 = v32;
        if (!v37) break;
        int v38 = 0;
        bool v39 = v2 != v38;
        int v40;
        if (v39) {
          int v41 = 3;
          v40 = v41;
        } else {
          int v42 = 2;
          v40 = v42;
        }
        int v43 = 1;
        int v44 = v32 + v43;
        v31 = v40;
        v32 = v44;
        continue;
        ;
      }
      v8 = v31;
      break;
    }
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
  int v58 = 2;
  int v59 = 8;
  int v60 = v59 + v51;
  int v61 = v50[v60];
  uint v62 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v63 = (int)(v62);
  int v64;
  v64 = v63;
  switch (v61) {
    default:
      {
      int v65 = 12;
      int v66 = v65 + v51;
      int v67 = v50[v66];
      int v68 = 0;
      bool v69 = v67 != v68;
      int v70;
      if (v69) {
        int v71 = 0;
        int v72 = 0;
        int v73;
        int v74;
        v73 = v71;
        v74 = v72;
        while (true) {
          int v75 = 4;
          int v76 = v74 * v75;
          int v77 = v76 + v51;
          int v78 = 16;
          int v79 = v78 + v77;
          int v80 = v50[v79];
          int v81 = 0;
          bool v82 = v80 != v81;
          v73 = v73;
          v74 = v74;
          if (!v82) break;
          int v83 = v73 + v74;
          int v84 = 1;
          int v85 = v74 + v84;
          bool v86 = true;
          v73 = v83;
          v74 = v85;
        }
        v70 = v73;
      } else {
        int v87 = 36;
        int v88 = v87 + v51;
        int v89 = v50[v88];
        int v90;
        v90 = v51;
        switch (v89) {
          case 0:
            {
            int v91 = 4;
            int v92 = v51 + v91;
            v90 = v92;
            break;
          }
          default:
            {
            int v93 = 3;
            int v94 = v51 + v93;
            v90 = v94;
            break;
          }
          case 1:
            {
            int v95 = 1;
            int v96 = v51 + v95;
            v90 = v96;
            break;
          }
          case 2:
            {
            int v97 = 3;
            int v98 = v51 + v97;
            v90 = v98;
            break;
          }
        }
        v70 = v90;
      }
      v64 = v70;
      break;
    }
    case 0:
      {
      int v99 = 0;
      int v100 = 0;
      int v101;
      int v102;
      v101 = v99;
      v102 = v100;
      while (true) {
        int v103 = 4;
        int v104 = v102 * v103;
        int v105 = v104 + v51;
        int v106 = 40;
        int v107 = v106 + v105;
        int v108 = v50[v107];
        int v109 = 0;
        bool v110 = v108 != v109;
        v101 = v101;
        v102 = v102;
        if (!v110) break;
        int v111 = 60;
        int v112 = v111 + v51;
        int v113 = v50[v112];
        int v114 = 0;
        bool v115 = v113 != v114;
        int v116;
        if (v115) {
          int v117 = 1;
          v116 = v117;
        } else {
          int v118 = 1;
          int v119 = v51 + v118;
          v116 = v119;
        }
        int v120 = v101 + v116;
        int v121 = 1;
        int v122 = v102 + v121;
        bool v123 = true;
        v101 = v120;
        v102 = v122;
        break;
        ;
      }
      v64 = v101;
    }
    case 1:
      {
      int v124 = 64;
      int v125 = v124 + v51;
      int v126 = v50[v125];
      int v127 = 0;
      bool v128 = v126 != v127;
      int v129;
      if (v128) {
        int v130 = 68;
        int v131 = v130 + v51;
        int v132 = v50[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        int v135;
        if (v134) {
          v135 = v51;
        } else {
          int v136 = 2;
          int v137 = v51 + v136;
          v135 = v137;
        }
        v129 = v135;
      } else {
        int v138 = 72;
        int v139 = v138 + v51;
        int v140 = v50[v139];
        int v141 = 3;
        int v142 = v51 + v141;
        int v143;
        v143 = v142;
        switch (v140) {
          case 0:
            {
            int v144 = 3;
            int v145 = v51 + v144;
            v143 = v145;
            break;
          }
          case 1:
            {
            int v146 = 0;
            int v147 = v51 + v146;
            v143 = v147;
            break;
          }
          case 2:
            {
            int v148 = 0;
            v143 = v148;
            break;
          }
          default:
            {
            int v149 = 4;
            v143 = v149;
            break;
          }
        }
        v129 = v143;
      }
      v64 = v129;
      break;
    }
    case 2:
      {
      int v150 = 76;
      int v151 = v150 + v51;
      int v152 = v50[v151];
      int v153 = 0;
      bool v154 = v152 != v153;
      int v155;
      if (v154) {
        int v156 = 0;
        int v157 = v51 + v156;
        v155 = v157;
      } else {
        int v158 = 80;
        int v159 = v158 + v51;
        int v160 = v50[v159];
        int v161 = 0;
        int v162 = v51 + v161;
        int v163;
        v163 = v162;
        switch (v160) {
          case 0:
            {
            int v164 = 0;
            int v165 = v51 + v164;
            v163 = v165;
          }
          default:
            {
            v163 = v51;
            break;
          }
          case 1:
            {
            int v166 = 4;
            int v167 = v51 + v166;
            v163 = v167;
            break;
          }
          case 2:
            {
            int v168 = 1;
            v163 = v168;
            break;
          }
        }
        bool v169 = true;
        v155 = v163;
      }
      v64 = v155;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
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
