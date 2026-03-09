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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
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
      uint v22 = simt_subgroup_id(__simt_tid);
      int v23 = (int)(v22);
      int v24 = 1;
      int v25 = v16 + v24;
      v15 = v23;
      v16 = v25;
    }
    int v26 = 1;
    int v27 = 1;
    int v28 = v7 + v27;
    v6 = v15;
    v7 = v28;
    break;
    ;
  }
  bool v29 = true;
  int v30 = simt_wave_count_bits(v29);
  int v31 = 0;
  int v32 = v31 + v0;
  v1[v32] = v30;
  int v33 = 0;
  bool v34 = v2 != v33;
  int v35;
  if (v34) {
    int v36 = 0;
    int v37 = 0;
    int v38;
    int v39;
    v38 = v36;
    v39 = v37;
    while (true) {
      int v40 = 4;
      int v41 = v3 % v40;
      int v42 = 1;
      int v43 = v41 + v42;
      bool v44 = v39 < v43;
      v38 = v38;
      v39 = v39;
      if (!v44) break;
      int v45 = 0;
      bool v46 = v2 != v45;
      int v47;
      if (v46) {
        uint v48 = simt_subgroup_id(__simt_tid);
        int v49 = (int)(v48);
        v47 = v49;
      } else {
        uint v50 = simt_lane_id(__simt_tid);
        int v51 = (int)(v50);
        v47 = v51;
      }
      int v52 = 0;
      int v53 = 1;
      int v54 = v39 + v53;
      v38 = v47;
      v39 = v54;
    }
    uint v55 = simt_subgroup_id(__simt_tid);
    int v56 = (int)(v55);
    v35 = v38;
  } else {
    int v57 = 3;
    int v58 = v3 % v57;
    int v59;
    v59 = v0;
    switch (v58) {
      case 0:
        {
        int v60 = 2;
        int v61 = v0 + v60;
        v59 = v61;
      }
      default:
        {
        int v62 = 1;
        int v63 = v0 + v62;
        v59 = v63;
        break;
      }
      case 1:
        {
        v59 = v0;
        break;
      }
    }
    uint v64 = simt_lane_id(__simt_tid);
    int v65 = (int)(v64);
    v35 = v59;
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 16;
  int v69 = v68 + v0;
  v1[v69] = v67;
  int v70 = 0;
  bool v71 = v2 != v70;
  int v72 = v71 ? v6 : v35;
  return;
}

kernel void kernel_main(device int* v73 [[buffer(0)]], device int* v74 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v75 = static_cast<int>(__simt_tid3.x);
  int v76 = 0;
  int v77 = v76 + v75;
  int v78 = v74[v77];
  int v79 = 4;
  int v80 = v79 + v75;
  int v81 = v74[v80];
  helper0(v75, v73, v78, v81, static_cast<int>(__simt_tid3.x));
  int v82 = 8;
  int v83 = v82 + v75;
  int v84 = v74[v83];
  int v85 = 2;
  int v86;
  v86 = v85;
  switch (v84) {
    case 0:
      {
      int v87 = 12;
      int v88 = v87 + v75;
      int v89 = v74[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 0;
        int v94 = 0;
        int v95;
        int v96;
        v95 = v93;
        v96 = v94;
        while (true) {
          int v97 = 4;
          int v98 = v96 * v97;
          int v99 = v98 + v75;
          int v100 = 16;
          int v101 = v100 + v99;
          int v102 = v74[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          v95 = v95;
          v96 = v96;
          if (!v104) break;
          int v105 = v95 + v96;
          int v106 = 1;
          int v107 = v96 + v106;
          v95 = v105;
          v96 = v107;
        }
        bool v108 = true;
        v92 = v95;
      } else {
        int v109 = 36;
        int v110 = v109 + v75;
        int v111 = v74[v110];
        int v112 = 1;
        int v113;
        v113 = v112;
        switch (v111) {
          case 0:
            {
            int v114 = 1;
            int v115 = v75 + v114;
            v113 = v115;
          }
          default:
            {
            v113 = v75;
            break;
          }
          case 1:
            {
            int v116 = 2;
            int v117 = v75 + v116;
            v113 = v117;
            break;
          }
        }
        bool v118 = true;
        v92 = v113;
      }
      v86 = v92;
      break;
    }
    default:
      {
      int v119 = 40;
      int v120 = v119 + v75;
      int v121 = v74[v120];
      int v122 = 1;
      int v123;
      v123 = v122;
      switch (v121) {
        case 0:
          {
          v123 = v75;
          break;
        }
        case 1:
          {
          int v124 = 44;
          int v125 = v124 + v75;
          int v126 = v74[v125];
          int v127 = 0;
          int v128 = v75 + v127;
          int v129;
          v129 = v128;
          switch (v126) {
            case 0:
              {
              v129 = v75;
              break;
            }
            default:
              {
              int v130 = 2;
              int v131 = v75 + v130;
              v129 = v131;
              break;
            }
            case 1:
              {
              v129 = v75;
              break;
            }
          }
          bool v132 = true;
          v123 = v129;
          break;
        }
        case 2:
          {
          int v133 = 3;
          int v134 = v75 + v133;
          v123 = v134;
          break;
        }
        default:
          {
          v123 = v75;
          break;
        }
      }
      bool v135 = true;
      v86 = v123;
      break;
    }
    case 1:
      {
      int v136 = 48;
      int v137 = v136 + v75;
      int v138 = v74[v137];
      int v139 = 2;
      int v140;
      v140 = v139;
      switch (v138) {
        case 0:
          {
          int v141 = 52;
          int v142 = v141 + v75;
          int v143 = v74[v142];
          int v144 = 0;
          bool v145 = v143 != v144;
          int v146;
          if (v145) {
            int v147 = 1;
            v146 = v147;
          } else {
            v146 = v75;
          }
          v140 = v146;
          break;
        }
        default:
          {
          int v148 = 56;
          int v149 = v148 + v75;
          int v150 = v74[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            int v154 = 3;
            int v155 = v75 + v154;
            v153 = v155;
          } else {
            v153 = v75;
          }
          v140 = v153;
          break;
        }
        case 1:
          {
          int v156 = 60;
          int v157 = v156 + v75;
          int v158 = v74[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            v161 = v75;
          } else {
            v161 = v75;
          }
          v140 = v161;
          break;
        }
        case 2:
          {
          int v162 = 0;
          int v163 = 0;
          int v164;
          int v165;
          v164 = v162;
          v165 = v163;
          while (true) {
            int v166 = 4;
            int v167 = v165 * v166;
            int v168 = v167 + v75;
            int v169 = 64;
            int v170 = v169 + v168;
            int v171 = v74[v170];
            int v172 = 0;
            bool v173 = v171 != v172;
            v164 = v164;
            v165 = v165;
            if (!v173) break;
            int v174 = v164 + v165;
            int v175 = 1;
            int v176 = v165 + v175;
            v164 = v174;
            v165 = v176;
          }
          bool v177 = true;
          v140 = v164;
          break;
        }
      }
      bool v178 = true;
      v86 = v140;
      break;
    }
  }
  bool v179 = true;
  int v180 = 32;
  int v181 = v180 + v75;
  bool v182 = true;
  int v183 = simt_wave_count_bits(v182);
  v73[v181] = v183;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
