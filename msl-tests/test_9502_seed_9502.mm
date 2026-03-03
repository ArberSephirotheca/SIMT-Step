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
      int v9 = 2;
      int v10 = v3 % v9;
      int v11 = 1;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        default:
          {
          v13 = v0;
          break;
        }
        case 0:
          {
          v13 = v0;
          break;
        }
      }
      int v14 = 2;
      v8 = v13;
      break;
    }
    case 0:
      {
      int v15 = 2;
      int v16 = v3 % v15;
      int v17;
      v17 = v0;
      switch (v16) {
        case 0:
          {
          int v18 = 0;
          int v19 = 0;
          int v20;
          int v21;
          v20 = v18;
          v21 = v19;
          while (true) {
            int v22 = 4;
            int v23 = v3 % v22;
            int v24 = 1;
            int v25 = v23 + v24;
            bool v26 = v21 < v25;
            v20 = v20;
            v21 = v21;
            if (!v26) break;
            int v27 = 1;
            int v28 = 1;
            int v29 = v21 + v28;
            v20 = v27;
            v21 = v29;
          }
          int v30 = 1;
          int v31 = v0 + v30;
          v17 = v20;
          break;
        }
        default:
          {
          int v32 = 3;
          int v33 = v3 % v32;
          int v34 = 4;
          int v35;
          v35 = v34;
          switch (v33) {
            case 0:
              {
              int v36 = 3;
              int v37 = v0 + v36;
              v35 = v37;
              break;
            }
            case 1:
              {
              int v38 = 1;
              v35 = v38;
            }
            default:
              {
              int v39 = 4;
              v35 = v39;
              break;
            }
          }
          int v40 = 3;
          int v41 = v0 + v40;
          v17 = v35;
          break;
        }
        case 1:
          {
          int v42 = 0;
          int v43 = 0;
          int v44;
          int v45;
          v44 = v42;
          v45 = v43;
          while (true) {
            int v46 = 4;
            int v47 = v3 % v46;
            int v48 = 1;
            int v49 = v47 + v48;
            bool v50 = v45 < v49;
            v44 = v44;
            v45 = v45;
            if (!v50) break;
            int v51 = 3;
            int v52 = v0 + v51;
            int v53 = 1;
            int v54 = v45 + v53;
            v44 = v52;
            v45 = v54;
          }
          int v55 = 1;
          v17 = v44;
          break;
        }
      }
      int v56 = 1;
      v8 = v17;
      break;
    }
    case 1:
      {
      v8 = v0;
      break;
    }
  }
  bool v57 = true;
  int v58 = simt_wave_count_bits(v57);
  int v59 = 0;
  int v60 = v59 + v0;
  v1[v60] = v58;
  return;
}

kernel void kernel_main(device int* v61 [[buffer(0)]], device int* v62 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v63 = static_cast<int>(__simt_tid3.x);
  int v64 = 0;
  int v65 = v64 + v63;
  int v66 = v62[v65];
  int v67 = 4;
  int v68 = v67 + v63;
  int v69 = v62[v68];
  helper0(v63, v61, v66, v69, static_cast<int>(__simt_tid3.x));
  uint v70 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v71 = (int)(v70);
  int v72 = 0;
  int v73 = 0;
  int v74;
  int v75;
  v74 = v72;
  v75 = v73;
  while (true) {
    int v76 = 4;
    int v77 = v75 * v76;
    int v78 = v77 + v63;
    int v79 = 8;
    int v80 = v79 + v78;
    int v81 = v62[v80];
    int v82 = 0;
    bool v83 = v81 != v82;
    v74 = v74;
    v75 = v75;
    if (!v83) break;
    int v84 = 28;
    int v85 = v84 + v63;
    int v86 = v62[v85];
    int v87 = 0;
    bool v88 = v86 != v87;
    int v89;
    if (v88) {
      int v90 = 1;
      int v91 = v63 + v90;
      v89 = v91;
    } else {
      uint v92 = simt_lane_id(static_cast<int>(__simt_tid3.x));
      int v93 = (int)(v92);
      v89 = v93;
    }
    int v94 = v74 + v89;
    int v95 = 1;
    int v96 = v75 + v95;
    v74 = v94;
    v75 = v96;
    break;
    ;
  }
  bool v97 = true;
  int v98 = 16;
  int v99 = v98 + v63;
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  v61[v99] = v101;
  int v102 = 32;
  int v103 = v102 + v63;
  int v104 = v62[v103];
  int v105 = 0;
  bool v106 = v104 != v105;
  int v107;
  if (v106) {
    int v108 = 36;
    int v109 = v108 + v63;
    int v110 = v62[v109];
    int v111 = 0;
    bool v112 = v110 != v111;
    int v113;
    if (v112) {
      int v114 = 0;
      int v115 = 0;
      int v116;
      int v117;
      v116 = v114;
      v117 = v115;
      while (true) {
        int v118 = 4;
        int v119 = v117 * v118;
        int v120 = v119 + v63;
        int v121 = 40;
        int v122 = v121 + v120;
        int v123 = v62[v122];
        int v124 = 0;
        bool v125 = v123 != v124;
        v116 = v116;
        v117 = v117;
        if (!v125) break;
        int v126 = v116 + v117;
        int v127 = 1;
        int v128 = v117 + v127;
        v116 = v126;
        v117 = v128;
      }
      bool v129 = true;
      v113 = v116;
    } else {
      int v130 = 60;
      int v131 = v130 + v63;
      int v132 = v62[v131];
      int v133 = 0;
      bool v134 = v132 != v133;
      int v135;
      if (v134) {
        uint v136 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v137 = (int)(v136);
        v135 = v137;
      } else {
        int v138 = 2;
        v135 = v138;
      }
      v113 = v135;
    }
    v107 = v113;
  } else {
    int v139 = 64;
    int v140 = v139 + v63;
    int v141 = v62[v140];
    int v142 = 0;
    bool v143 = v141 != v142;
    int v144;
    if (v143) {
      int v145 = 0;
      int v146 = 0;
      int v147;
      int v148;
      v147 = v145;
      v148 = v146;
      while (true) {
        int v149 = 4;
        int v150 = v148 * v149;
        int v151 = v150 + v63;
        int v152 = 68;
        int v153 = v152 + v151;
        int v154 = v62[v153];
        int v155 = 0;
        bool v156 = v154 != v155;
        v147 = v147;
        v148 = v148;
        if (!v156) break;
        int v157 = v147 + v148;
        int v158 = 1;
        int v159 = v148 + v158;
        v147 = v157;
        v148 = v159;
      }
      bool v160 = true;
      v144 = v147;
    } else {
      int v161 = 0;
      int v162 = 0;
      int v163;
      int v164;
      v163 = v161;
      v164 = v162;
      while (true) {
        int v165 = 4;
        int v166 = v164 * v165;
        int v167 = v166 + v63;
        int v168 = 88;
        int v169 = v168 + v167;
        int v170 = v62[v169];
        int v171 = 0;
        bool v172 = v170 != v171;
        v163 = v163;
        v164 = v164;
        if (!v172) break;
        int v173 = v163 + v164;
        int v174 = 1;
        int v175 = v164 + v174;
        v163 = v173;
        v164 = v175;
      }
      bool v176 = true;
      v144 = v163;
    }
    v107 = v144;
  }
  int v177 = 32;
  int v178 = v177 + v63;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v61[v178] = v180;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 108; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
