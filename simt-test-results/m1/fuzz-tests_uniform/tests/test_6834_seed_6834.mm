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
  int v6 = 2;
  int v7 = v3 % v6;
  int v8 = 0;
  int v9;
  v9 = v8;
  switch (v7) {
    case 0:
      {
      int v10 = 4;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        case 0:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 4;
            int v17 = v0 + v16;
            v15 = v17;
          } else {
            int v18 = 0;
            v15 = v18;
          }
          int v19 = 3;
          v12 = v15;
          break;
        }
        default:
          {
          int v20 = 0;
          bool v21 = v2 != v20;
          int v22;
          if (v21) {
            int v23 = 1;
            int v24 = v0 + v23;
            v22 = v24;
          } else {
            int v25 = 3;
            int v26 = v0 + v25;
            v22 = v26;
          }
          int v27 = 3;
          int v28 = v0 + v27;
          v12 = v22;
          break;
        }
        case 1:
          {
          int v29 = 3;
          int v30 = v3 % v29;
          int v31;
          v31 = v0;
          switch (v30) {
            default:
              {
              int v32 = 1;
              int v33 = v0 + v32;
              v31 = v33;
              break;
            }
            case 0:
              {
              int v34 = 2;
              v31 = v34;
            }
            case 1:
              {
              int v35 = 2;
              v31 = v35;
              break;
            }
          }
          int v36 = 3;
          v12 = v31;
          break;
        }
        case 2:
          {
          int v37 = 0;
          int v38 = 0;
          int v39;
          int v40;
          v39 = v37;
          v40 = v38;
          while (true) {
            int v41 = 4;
            int v42 = v3 % v41;
            int v43 = 1;
            int v44 = v42 + v43;
            bool v45 = v40 < v44;
            v39 = v39;
            v40 = v40;
            if (!v45) break;
            int v46 = 1;
            int v47 = v40 + v46;
            v39 = v0;
            v40 = v47;
          }
          int v48 = 1;
          v12 = v39;
          break;
        }
      }
      v9 = v12;
      break;
    }
    case 1:
      {
      int v49 = 4;
      v9 = v49;
      break;
    }
    default:
      {
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
        int v59 = 3;
        int v60 = 1;
        int v61 = v53 + v60;
        v52 = v59;
        v53 = v61;
        continue;
        ;
      }
      v9 = v52;
      break;
    }
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  int v66 = 0;
  bool v67 = v2 != v66;
  int v68 = v67 ? v5 : v9;
  return;
}

kernel void kernel_main(device int* v69 [[buffer(0)]], device int* v70 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v71 = static_cast<int>(__simt_tid3.x);
  int v72 = 0;
  int v73 = v72 + v71;
  int v74 = v70[v73];
  int v75 = 4;
  int v76 = v75 + v71;
  int v77 = v70[v76];
  helper0(v71, v69, v74, v77, static_cast<int>(__simt_tid3.x));
  int v78 = 8;
  int v79 = v78 + v71;
  int v80 = v70[v79];
  uint v81 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83;
  v83 = v82;
  switch (v80) {
    case 0:
      {
      int v84 = 0;
      int v85 = 0;
      int v86;
      int v87;
      v86 = v84;
      v87 = v85;
      while (true) {
        int v88 = 4;
        int v89 = v87 * v88;
        int v90 = v89 + v71;
        int v91 = 12;
        int v92 = v91 + v90;
        int v93 = v70[v92];
        int v94 = 0;
        bool v95 = v93 != v94;
        v86 = v86;
        v87 = v87;
        if (!v95) break;
        int v96 = 0;
        int v97 = 0;
        int v98;
        int v99;
        v98 = v96;
        v99 = v97;
        while (true) {
          int v100 = 4;
          int v101 = v99 * v100;
          int v102 = v101 + v71;
          int v103 = 32;
          int v104 = v103 + v102;
          int v105 = v70[v104];
          int v106 = 0;
          bool v107 = v105 != v106;
          v98 = v98;
          v99 = v99;
          if (!v107) break;
          int v108 = v98 + v99;
          int v109 = 1;
          int v110 = v99 + v109;
          v98 = v108;
          v99 = v110;
        }
        bool v111 = true;
        int v112 = v86 + v98;
        int v113 = 1;
        int v114 = v87 + v113;
        v86 = v112;
        v87 = v114;
      }
      bool v115 = true;
      v83 = v86;
      break;
    }
    case 1:
      {
      v83 = v71;
      break;
    }
    default:
      {
      int v116 = 0;
      v83 = v116;
      break;
    }
  }
  bool v117 = true;
  int v118 = 16;
  int v119 = v118 + v71;
  bool v120 = true;
  int v121 = simt_wave_count_bits(v120);
  v69[v119] = v121;
  int v122 = 0;
  int v123 = 0;
  int v124;
  int v125;
  v124 = v122;
  v125 = v123;
  while (true) {
    int v126 = 4;
    int v127 = v125 * v126;
    int v128 = v127 + v71;
    int v129 = 52;
    int v130 = v129 + v128;
    int v131 = v70[v130];
    int v132 = 0;
    bool v133 = v131 != v132;
    v124 = v124;
    v125 = v125;
    if (!v133) break;
    int v134 = 72;
    int v135 = v134 + v71;
    int v136 = v70[v135];
    int v137 = 0;
    bool v138 = v136 != v137;
    int v139;
    if (v138) {
      int v140 = 76;
      int v141 = v140 + v71;
      int v142 = v70[v141];
      int v143;
      v143 = v71;
      switch (v142) {
        case 0:
          {
          int v144 = 4;
          v143 = v144;
        }
        default:
          {
          int v145 = 3;
          int v146 = v71 + v145;
          v143 = v146;
          break;
        }
      }
      bool v147 = true;
      v139 = v143;
    } else {
      int v148 = 80;
      int v149 = v148 + v71;
      int v150 = v70[v149];
      int v151;
      v151 = v71;
      switch (v150) {
        default:
          {
          int v152 = 0;
          int v153 = v71 + v152;
          v151 = v153;
        }
        case 0:
          {
          int v154 = 3;
          int v155 = v71 + v154;
          v151 = v155;
          break;
        }
      }
      bool v156 = true;
      v139 = v151;
    }
    int v157 = v124 + v139;
    int v158 = 1;
    int v159 = v125 + v158;
    v124 = v157;
    v125 = v159;
  }
  bool v160 = true;
  int v161 = 32;
  int v162 = v161 + v71;
  bool v163 = true;
  int v164 = simt_wave_count_bits(v163);
  v69[v162] = v164;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
