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
  int v5 = 0;
  int v6 = 0;
  int v7;
  int v8;
  v7 = v5;
  v8 = v6;
  while (true) {
    int v9 = 4;
    int v10 = v3 % v9;
    int v11 = 1;
    int v12 = v10 + v11;
    bool v13 = v8 < v12;
    v7 = v7;
    v8 = v8;
    if (!v13) break;
    uint v14 = simt_lane_id(__simt_tid);
    int v15 = (int)(v14);
    int v16;
    v16 = v15;
    switch (v3) {
      case 0:
        {
        v16 = v0;
        break;
      }
      default:
        {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          v19 = v0;
        } else {
          v19 = v0;
        }
        v16 = v19;
        break;
      }
    }
    uint v20 = simt_lane_id(__simt_tid);
    int v21 = (int)(v20);
    int v22 = 1;
    int v23 = v8 + v22;
    v7 = v16;
    v8 = v23;
  }
  bool v24 = true;
  int v25 = simt_wave_count_bits(v24);
  int v26 = 0;
  int v27 = v26 + v0;
  v1[v27] = v25;
  int v28 = 0;
  bool v29 = v2 != v28;
  int v30 = v29 ? v4 : v7;
  return;
}

kernel void kernel_main(device int* v31 [[buffer(0)]], device int* v32 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v33 = static_cast<int>(__simt_tid3.x);
  int v34 = 0;
  int v35 = v34 + v33;
  int v36 = v32[v35];
  int v37 = 4;
  int v38 = v37 + v33;
  int v39 = v32[v38];
  helper0(v33, v31, v36, v39, static_cast<int>(__simt_tid3.x));
  int v40 = 8;
  int v41 = v40 + v33;
  int v42 = v32[v41];
  int v43 = 0;
  bool v44 = v42 != v43;
  int v45;
  if (v44) {
    int v46 = 0;
    int v47 = 0;
    int v48;
    int v49;
    v48 = v46;
    v49 = v47;
    while (true) {
      int v50 = 4;
      int v51 = v49 * v50;
      int v52 = v51 + v33;
      int v53 = 12;
      int v54 = v53 + v52;
      int v55 = v32[v54];
      int v56 = 0;
      bool v57 = v55 != v56;
      v48 = v48;
      v49 = v49;
      if (!v57) break;
      int v58 = 0;
      int v59 = v33 + v58;
      int v60 = v48 + v59;
      int v61 = 1;
      int v62 = v49 + v61;
      v48 = v60;
      v49 = v62;
      break;
      ;
    }
    bool v63 = true;
    v45 = v48;
  } else {
    int v64 = 32;
    int v65 = v64 + v33;
    int v66 = v32[v65];
    int v67 = 0;
    bool v68 = v66 != v67;
    int v69;
    if (v68) {
      int v70 = 36;
      int v71 = v70 + v33;
      int v72 = v32[v71];
      int v73;
      v73 = v33;
      switch (v72) {
        default:
          {
          int v74 = 0;
          v73 = v74;
          break;
        }
        case 0:
          {
          int v75 = 3;
          int v76 = v33 + v75;
          v73 = v76;
          break;
        }
      }
      bool v77 = true;
      v69 = v73;
    } else {
      int v78 = 40;
      int v79 = v78 + v33;
      int v80 = v32[v79];
      int v81 = 0;
      bool v82 = v80 != v81;
      int v83;
      if (v82) {
        int v84 = 3;
        v83 = v84;
      } else {
        uint v85 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v86 = (int)(v85);
        v83 = v86;
      }
      v69 = v83;
    }
    v45 = v69;
  }
  int v87 = 16;
  int v88 = v87 + v33;
  bool v89 = true;
  int v90 = simt_wave_count_bits(v89);
  v31[v88] = v90;
  int v91 = 44;
  int v92 = v91 + v33;
  int v93 = v32[v92];
  uint v94 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v95 = (int)(v94);
  int v96;
  v96 = v95;
  switch (v93) {
    case 0:
      {
      int v97 = 48;
      int v98 = v97 + v33;
      int v99 = v32[v98];
      int v100 = 3;
      int v101 = v33 + v100;
      int v102;
      v102 = v101;
      switch (v99) {
        case 0:
          {
          int v103 = 0;
          int v104 = 0;
          int v105;
          int v106;
          v105 = v103;
          v106 = v104;
          while (true) {
            int v107 = 4;
            int v108 = v106 * v107;
            int v109 = v108 + v33;
            int v110 = 52;
            int v111 = v110 + v109;
            int v112 = v32[v111];
            int v113 = 0;
            bool v114 = v112 != v113;
            v105 = v105;
            v106 = v106;
            if (!v114) break;
            int v115 = v105 + v106;
            int v116 = 1;
            int v117 = v106 + v116;
            v105 = v115;
            v106 = v117;
          }
          bool v118 = true;
          v102 = v105;
          break;
        }
        case 1:
          {
          v102 = v33;
          break;
        }
        case 2:
          {
          int v119 = 72;
          int v120 = v119 + v33;
          int v121 = v32[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          int v124;
          if (v123) {
            v124 = v33;
          } else {
            int v125 = 1;
            int v126 = v33 + v125;
            v124 = v126;
          }
          v102 = v124;
          break;
        }
        default:
          {
          int v127 = 76;
          int v128 = v127 + v33;
          int v129 = v32[v128];
          int v130 = 1;
          int v131;
          v131 = v130;
          switch (v129) {
            case 0:
              {
              v131 = v33;
              break;
            }
            default:
              {
              v131 = v33;
            }
            case 1:
              {
              int v132 = 4;
              v131 = v132;
            }
            case 2:
              {
              int v133 = 2;
              int v134 = v33 + v133;
              v131 = v134;
              break;
            }
          }
          bool v135 = true;
          v102 = v131;
          break;
        }
      }
      bool v136 = true;
      v96 = v102;
      break;
    }
    default:
      {
      int v137 = 80;
      int v138 = v137 + v33;
      int v139 = v32[v138];
      int v140 = 0;
      bool v141 = v139 != v140;
      int v142;
      if (v141) {
        int v143 = 0;
        int v144 = 0;
        int v145;
        int v146;
        v145 = v143;
        v146 = v144;
        while (true) {
          int v147 = 4;
          int v148 = v146 * v147;
          int v149 = v148 + v33;
          int v150 = 84;
          int v151 = v150 + v149;
          int v152 = v32[v151];
          int v153 = 0;
          bool v154 = v152 != v153;
          v145 = v145;
          v146 = v146;
          if (!v154) break;
          int v155 = v145 + v146;
          int v156 = 1;
          int v157 = v146 + v156;
          v145 = v155;
          v146 = v157;
        }
        bool v158 = true;
        v142 = v145;
      } else {
        int v159 = 104;
        int v160 = v159 + v33;
        int v161 = v32[v160];
        int v162 = 2;
        int v163;
        v163 = v162;
        switch (v161) {
          case 0:
            {
            int v164 = 4;
            int v165 = v33 + v164;
            v163 = v165;
            break;
          }
          case 1:
            {
            int v166 = 0;
            v163 = v166;
          }
          case 2:
            {
            int v167 = 1;
            v163 = v167;
          }
          default:
            {
            int v168 = 2;
            v163 = v168;
            break;
          }
        }
        bool v169 = true;
        v142 = v163;
      }
      v96 = v142;
      break;
    }
  }
  bool v170 = true;
  int v171 = 32;
  int v172 = v171 + v33;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v31[v172] = v174;
  int v175 = 4;
  int v176 = v33 + v175;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
