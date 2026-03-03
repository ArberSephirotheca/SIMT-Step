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
      int v11 = 2;
      int v12 = v0 + v11;
      v10 = v12;
      break;
    }
    case 1:
      {
      int v13 = 3;
      int v14;
      v14 = v13;
      switch (v3) {
        default:
          {
          int v15 = 3;
          int v16;
          v16 = v15;
          switch (v3) {
            case 0:
              {
              v16 = v0;
            }
            default:
              {
              int v17 = 2;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
          }
          v14 = v16;
          break;
        }
        case 0:
          {
          int v19 = 3;
          int v20 = v3 % v19;
          int v21;
          v21 = v0;
          switch (v20) {
            default:
              {
              int v22 = 3;
              v21 = v22;
              break;
            }
            case 0:
              {
              int v23 = 0;
              v21 = v23;
              break;
            }
            case 1:
              {
              int v24 = 3;
              int v25 = v0 + v24;
              v21 = v25;
              break;
            }
          }
          int v26 = 4;
          v14 = v21;
          break;
        }
      }
      int v27 = 4;
      v10 = v14;
      break;
    }
    default:
      {
      int v28 = 0;
      int v29 = 0;
      int v30;
      int v31;
      v30 = v28;
      v31 = v29;
      while (true) {
        int v32 = 4;
        int v33 = v3 % v32;
        int v34 = 1;
        int v35 = v33 + v34;
        bool v36 = v31 < v35;
        v30 = v30;
        v31 = v31;
        if (!v36) break;
        int v37 = 1;
        int v38 = v31 + v37;
        v30 = v0;
        v31 = v38;
      }
      v10 = v30;
      break;
    }
  }
  int v39 = 0;
  bool v40 = v2 != v39;
  int v41 = v40 ? v5 : v10;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
  int v51 = 8;
  int v52 = v51 + v44;
  int v53 = v43[v52];
  uint v54 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v55 = (int)(v54);
  int v56;
  v56 = v55;
  switch (v53) {
    case 0:
      {
      int v57 = 12;
      int v58 = v57 + v44;
      int v59 = v43[v58];
      int v60;
      v60 = v44;
      switch (v59) {
        case 0:
          {
          int v61 = 16;
          int v62 = v61 + v44;
          int v63 = v43[v62];
          int v64 = 0;
          bool v65 = v63 != v64;
          int v66;
          if (v65) {
            int v67 = 3;
            int v68 = v44 + v67;
            v66 = v68;
          } else {
            int v69 = 4;
            v66 = v69;
          }
          v60 = v66;
          break;
        }
        default:
          {
          int v70 = 3;
          v60 = v70;
          break;
        }
        case 1:
          {
          int v71 = 20;
          int v72 = v71 + v44;
          int v73 = v43[v72];
          int v74 = 2;
          int v75 = v44 + v74;
          int v76;
          v76 = v75;
          switch (v73) {
            case 0:
              {
              int v77 = 3;
              v76 = v77;
              break;
            }
            case 1:
              {
              int v78 = 0;
              v76 = v78;
              break;
            }
            case 2:
              {
              v76 = v44;
              break;
            }
            default:
              {
              int v79 = 1;
              int v80 = v44 + v79;
              v76 = v80;
              break;
            }
          }
          v60 = v76;
          break;
        }
      }
      bool v81 = true;
      v56 = v60;
    }
    case 1:
      {
      int v82 = 24;
      int v83 = v82 + v44;
      int v84 = v43[v83];
      int v85 = 0;
      bool v86 = v84 != v85;
      int v87;
      if (v86) {
        v87 = v44;
      } else {
        int v88 = 28;
        int v89 = v88 + v44;
        int v90 = v43[v89];
        int v91;
        v91 = v44;
        switch (v90) {
          default:
            {
            v91 = v44;
            break;
          }
          case 0:
            {
            int v92 = 4;
            v91 = v92;
            break;
          }
          case 1:
            {
            v91 = v44;
            break;
          }
          case 2:
            {
            int v93 = 4;
            int v94 = v44 + v93;
            v91 = v94;
            break;
          }
        }
        v87 = v91;
      }
      v56 = v87;
    }
    case 2:
      {
      int v95 = 32;
      int v96 = v95 + v44;
      int v97 = v43[v96];
      int v98 = 0;
      bool v99 = v97 != v98;
      int v100;
      if (v99) {
        int v101 = 36;
        int v102 = v101 + v44;
        int v103 = v43[v102];
        int v104 = 2;
        int v105;
        v105 = v104;
        switch (v103) {
          case 0:
            {
            int v106 = 2;
            v105 = v106;
            break;
          }
          case 1:
            {
            int v107 = 3;
            int v108 = v44 + v107;
            v105 = v108;
            break;
          }
          default:
            {
            int v109 = 2;
            v105 = v109;
            break;
          }
        }
        v100 = v105;
      } else {
        int v110 = 40;
        int v111 = v110 + v44;
        int v112 = v43[v111];
        int v113;
        v113 = v44;
        switch (v112) {
          case 0:
            {
            v113 = v44;
            break;
          }
          case 1:
            {
            int v114 = 4;
            v113 = v114;
            break;
          }
          default:
            {
            int v115 = 2;
            v113 = v115;
            break;
          }
        }
        bool v116 = true;
        v100 = v113;
      }
      v56 = v100;
      break;
    }
    default:
      {
      int v117 = 44;
      int v118 = v117 + v44;
      int v119 = v43[v118];
      int v120 = 0;
      bool v121 = v119 != v120;
      int v122;
      if (v121) {
        int v123 = 48;
        int v124 = v123 + v44;
        int v125 = v43[v124];
        int v126 = 2;
        int v127;
        v127 = v126;
        switch (v125) {
          case 0:
            {
            int v128 = 0;
            v127 = v128;
            break;
          }
          default:
            {
            int v129 = 1;
            int v130 = v44 + v129;
            v127 = v130;
            break;
          }
          case 1:
            {
            int v131 = 4;
            v127 = v131;
            break;
          }
          case 2:
            {
            v127 = v44;
            break;
          }
        }
        v122 = v127;
      } else {
        int v132 = 52;
        int v133 = v132 + v44;
        int v134 = v43[v133];
        int v135 = 4;
        int v136;
        v136 = v135;
        switch (v134) {
          case 0:
            {
            int v137 = 3;
            int v138 = v44 + v137;
            v136 = v138;
            break;
          }
          default:
            {
            int v139 = 3;
            int v140 = v44 + v139;
            v136 = v140;
            break;
          }
        }
        v122 = v136;
      }
      v56 = v122;
      break;
    }
  }
  uint v141 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v142 = (int)(v141);
  int v143 = 0;
  int v144 = 0;
  int v145;
  int v146;
  v145 = v143;
  v146 = v144;
  while (true) {
    int v147 = 4;
    int v148 = v146 * v147;
    int v149 = v148 + v44;
    int v150 = 56;
    int v151 = v150 + v149;
    int v152 = v43[v151];
    int v153 = 0;
    bool v154 = v152 != v153;
    v145 = v145;
    v146 = v146;
    if (!v154) break;
    int v155 = v145 + v146;
    int v156 = 1;
    int v157 = v146 + v156;
    bool v158 = true;
    int v159 = 16;
    int v160 = 4;
    int v161 = v146 * v160;
    int v162 = v159 + v161;
    int v163 = v162 + v44;
    bool v164 = true;
    int v165 = simt_wave_count_bits(v164);
    v42[v163] = v165;
    v145 = v155;
    v146 = v157;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 27; ++idx) {
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
