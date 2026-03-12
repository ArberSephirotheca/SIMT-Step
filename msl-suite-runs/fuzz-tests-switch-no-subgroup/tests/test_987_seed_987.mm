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
  int v8 = 3;
  int v9 = v3 % v8;
  uint v10 = simt_lane_id(__simt_tid);
  int v11 = (int)(v10);
  int v12;
  v12 = v11;
  switch (v9) {
    case 0:
      {
      int v13 = 0;
      int v14 = 0;
      int v15;
      int v16;
      v15 = v13;
      v16 = v14;
      while (true) {
        int v17 = 4;
        int v18 = v3 % v17;
        int v19 = 1;
        int v20 = v18 + v19;
        bool v21 = v16 < v20;
        v15 = v15;
        v16 = v16;
        if (!v21) break;
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
          int v32 = v0 + v31;
          int v33 = 1;
          int v34 = v25 + v33;
          v24 = v32;
          v25 = v34;
        }
        int v35 = 1;
        int v36 = v16 + v35;
        v15 = v24;
        v16 = v36;
      }
      v12 = v15;
      break;
    }
    default:
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
        int v46 = 0;
        bool v47 = v2 != v46;
        int v48;
        if (v47) {
          int v49 = 2;
          int v50 = v0 + v49;
          v48 = v50;
        } else {
          v48 = v0;
        }
        int v51 = 1;
        int v52 = v40 + v51;
        v39 = v48;
        v40 = v52;
        continue;
        ;
      }
      v12 = v39;
      break;
    }
    case 1:
      {
      int v53 = 3;
      int v54 = v3 % v53;
      int v55 = 1;
      int v56 = v0 + v55;
      int v57;
      v57 = v56;
      switch (v54) {
        case 0:
          {
          v57 = v0;
          break;
        }
        case 1:
          {
          int v58 = 2;
          v57 = v58;
        }
        default:
          {
          int v59 = 0;
          bool v60 = v2 != v59;
          int v61;
          if (v60) {
            int v62 = 1;
            int v63 = v0 + v62;
            v61 = v63;
          } else {
            int v64 = 1;
            v61 = v64;
          }
          v57 = v61;
          break;
        }
      }
      v12 = v57;
      break;
    }
  }
  bool v65 = true;
  int v66 = simt_wave_count_bits(v65);
  int v67 = 16;
  int v68 = v67 + v0;
  v1[v68] = v66;
  int v69 = 0;
  bool v70 = v2 != v69;
  int v71 = v70 ? v5 : v12;
  return;
}

kernel void kernel_main(device int* v72 [[buffer(0)]], device int* v73 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v74 = static_cast<int>(__simt_tid3.x);
  int v75 = 0;
  int v76 = v75 + v74;
  int v77 = v73[v76];
  int v78 = 4;
  int v79 = v78 + v74;
  int v80 = v73[v79];
  helper0(v74, v72, v77, v80, static_cast<int>(__simt_tid3.x));
  uint v81 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v82 = (int)(v81);
  int v83 = 8;
  int v84 = v83 + v74;
  int v85 = v73[v84];
  uint v86 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v87 = (int)(v86);
  int v88;
  v88 = v87;
  switch (v85) {
    case 0:
      {
      int v89 = 12;
      int v90 = v89 + v74;
      int v91 = v73[v90];
      int v92 = 1;
      int v93 = v74 + v92;
      int v94;
      v94 = v93;
      switch (v91) {
        default:
          {
          int v95 = 16;
          int v96 = v95 + v74;
          int v97 = v73[v96];
          int v98 = 4;
          int v99 = v74 + v98;
          int v100;
          v100 = v99;
          switch (v97) {
            default:
              {
              int v101 = 3;
              int v102 = v74 + v101;
              v100 = v102;
              break;
            }
            case 0:
              {
              v100 = v74;
              break;
            }
          }
          bool v103 = true;
          v94 = v100;
        }
        case 0:
          {
          int v104 = 0;
          int v105 = 0;
          int v106;
          int v107;
          v106 = v104;
          v107 = v105;
          while (true) {
            int v108 = 4;
            int v109 = v107 * v108;
            int v110 = v109 + v74;
            int v111 = 20;
            int v112 = v111 + v110;
            int v113 = v73[v112];
            int v114 = 0;
            bool v115 = v113 != v114;
            v106 = v106;
            v107 = v107;
            if (!v115) break;
            int v116 = v106 + v107;
            int v117 = 1;
            int v118 = v107 + v117;
            bool v119 = true;
            v106 = v116;
            v107 = v118;
          }
          v94 = v106;
          break;
        }
      }
      bool v120 = true;
      v88 = v94;
      break;
    }
    case 1:
      {
      int v121 = 40;
      int v122 = v121 + v74;
      int v123 = v73[v122];
      int v124 = 4;
      int v125;
      v125 = v124;
      switch (v123) {
        case 0:
          {
          v125 = v74;
          break;
        }
        default:
          {
          int v126 = 44;
          int v127 = v126 + v74;
          int v128 = v73[v127];
          int v129;
          v129 = v74;
          switch (v128) {
            case 0:
              {
              int v130 = 4;
              int v131 = v74 + v130;
              v129 = v131;
              break;
            }
            default:
              {
              v129 = v74;
            }
            case 1:
              {
              v129 = v74;
              break;
            }
          }
          v125 = v129;
          break;
        }
      }
      v88 = v125;
      break;
    }
    case 2:
      {
      int v132 = 0;
      int v133 = 0;
      int v134;
      int v135;
      v134 = v132;
      v135 = v133;
      while (true) {
        int v136 = 4;
        int v137 = v135 * v136;
        int v138 = v137 + v74;
        int v139 = 48;
        int v140 = v139 + v138;
        int v141 = v73[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        v134 = v134;
        v135 = v135;
        if (!v143) break;
        int v144 = 68;
        int v145 = v144 + v74;
        int v146 = v73[v145];
        int v147 = 0;
        bool v148 = v146 != v147;
        int v149;
        if (v148) {
          v149 = v74;
        } else {
          int v150 = 2;
          v149 = v150;
        }
        int v151 = v134 + v149;
        int v152 = 1;
        int v153 = v135 + v152;
        bool v154 = true;
        v134 = v151;
        v135 = v153;
      }
      v88 = v134;
      break;
    }
    default:
      {
      int v155 = 72;
      int v156 = v155 + v74;
      int v157 = v73[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      int v160;
      if (v159) {
        int v161 = 76;
        int v162 = v161 + v74;
        int v163 = v73[v162];
        int v164 = 0;
        bool v165 = v163 != v164;
        int v166;
        if (v165) {
          v166 = v74;
        } else {
          int v167 = 0;
          v166 = v167;
        }
        v160 = v166;
      } else {
        int v168 = 1;
        v160 = v168;
      }
      v88 = v160;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
