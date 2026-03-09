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
  int v4 = 4;
  int v5 = v3 % v4;
  int v6 = 1;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 3;
      int v12 = v0 + v11;
      int v13;
      v13 = v12;
      switch (v10) {
        case 0:
          {
          int v14 = 0;
          bool v15 = v2 != v14;
          int v16;
          if (v15) {
            int v17 = 3;
            int v18 = v0 + v17;
            v16 = v18;
          } else {
            v16 = v0;
          }
          int v19 = 4;
          int v20 = v0 + v19;
          v13 = v16;
          break;
        }
        case 1:
          {
          int v21 = 0;
          int v22 = 0;
          int v23;
          int v24;
          v23 = v21;
          v24 = v22;
          while (true) {
            int v25 = 4;
            int v26 = v3 % v25;
            int v27 = 1;
            int v28 = v26 + v27;
            bool v29 = v24 < v28;
            v23 = v23;
            v24 = v24;
            if (!v29) break;
            int v30 = 1;
            int v31 = v24 + v30;
            v23 = v0;
            v24 = v31;
          }
          v13 = v23;
          break;
        }
        default:
          {
          int v32 = 3;
          int v33 = v3 % v32;
          int v34;
          v34 = v0;
          switch (v33) {
            case 0:
              {
              v34 = v0;
              break;
            }
            default:
              {
              int v35 = 2;
              v34 = v35;
              break;
            }
            case 1:
              {
              int v36 = 1;
              v34 = v36;
              break;
            }
          }
          int v37 = 2;
          v13 = v34;
        }
        case 2:
          {
          int v38 = 0;
          int v39 = 0;
          int v40;
          int v41;
          v40 = v38;
          v41 = v39;
          while (true) {
            int v42 = 4;
            int v43 = v3 % v42;
            int v44 = 1;
            int v45 = v43 + v44;
            bool v46 = v41 < v45;
            v40 = v40;
            v41 = v41;
            if (!v46) break;
            int v47 = 3;
            int v48 = 1;
            int v49 = v41 + v48;
            v40 = v47;
            v41 = v49;
          }
          v13 = v40;
          break;
        }
      }
      int v50 = 4;
      v8 = v13;
    }
    default:
      {
      int v51 = 0;
      bool v52 = v2 != v51;
      int v53;
      if (v52) {
        int v54 = 0;
        bool v55 = v2 != v54;
        int v56;
        if (v55) {
          v56 = v0;
        } else {
          int v57 = 0;
          v56 = v57;
        }
        v53 = v56;
      } else {
        int v58 = 2;
        int v59 = v3 % v58;
        int v60 = 2;
        int v61;
        v61 = v60;
        switch (v59) {
          case 0:
            {
            int v62 = 4;
            v61 = v62;
          }
          default:
            {
            int v63 = 4;
            int v64 = v0 + v63;
            v61 = v64;
            break;
          }
          case 1:
            {
            int v65 = 0;
            v61 = v65;
            break;
          }
        }
        int v66 = 1;
        int v67 = v0 + v66;
        v53 = v61;
      }
      v8 = v53;
    }
    case 1:
      {
      int v68 = 0;
      bool v69 = v2 != v68;
      int v70;
      if (v69) {
        int v71 = 3;
        int v72 = v3 % v71;
        int v73;
        v73 = v0;
        switch (v72) {
          default:
            {
            v73 = v0;
          }
          case 0:
            {
            v73 = v0;
          }
          case 1:
            {
            int v74 = 0;
            int v75 = v0 + v74;
            v73 = v75;
            break;
          }
          case 2:
            {
            int v76 = 1;
            int v77 = v0 + v76;
            v73 = v77;
            break;
          }
        }
        int v78 = 4;
        int v79 = v0 + v78;
        v70 = v73;
      } else {
        int v80 = 2;
        int v81 = v3 % v80;
        int v82 = 0;
        int v83;
        v83 = v82;
        switch (v81) {
          default:
            {
            v83 = v0;
            break;
          }
          case 0:
            {
            v83 = v0;
            break;
          }
        }
        v70 = v83;
      }
      v8 = v70;
    }
    case 2:
      {
      int v84 = 0;
      bool v85 = v2 != v84;
      int v86;
      if (v85) {
        v86 = v0;
      } else {
        int v87 = 0;
        bool v88 = v2 != v87;
        int v89;
        if (v88) {
          v89 = v0;
        } else {
          v89 = v0;
        }
        int v90 = 1;
        v86 = v89;
      }
      v8 = v86;
      break;
    }
  }
  bool v91 = true;
  int v92 = simt_wave_count_bits(v91);
  int v93 = 0;
  int v94 = v93 + v0;
  v1[v94] = v92;
  return;
}

kernel void kernel_main(device int* v95 [[buffer(0)]], device int* v96 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v97 = static_cast<int>(__simt_tid3.x);
  int v98 = 0;
  int v99 = v98 + v97;
  int v100 = v96[v99];
  int v101 = 4;
  int v102 = v101 + v97;
  int v103 = v96[v102];
  helper0(v97, v95, v100, v103, static_cast<int>(__simt_tid3.x));
  int v104 = 8;
  int v105 = v104 + v97;
  int v106 = v96[v105];
  int v107 = 1;
  int v108 = v97 + v107;
  int v109;
  v109 = v108;
  switch (v106) {
    case 0:
      {
      int v110 = 12;
      int v111 = v110 + v97;
      int v112 = v96[v111];
      int v113 = 3;
      int v114 = v97 + v113;
      int v115;
      v115 = v114;
      switch (v112) {
        case 0:
          {
          int v116 = 16;
          int v117 = v116 + v97;
          int v118 = v96[v117];
          int v119 = 4;
          int v120 = v97 + v119;
          int v121;
          v121 = v120;
          switch (v118) {
            case 0:
              {
              int v122 = 1;
              int v123 = v97 + v122;
              v121 = v123;
              break;
            }
            case 1:
              {
              int v124 = 1;
              int v125 = v97 + v124;
              v121 = v125;
              break;
            }
            case 2:
              {
              int v126 = 0;
              int v127 = v97 + v126;
              v121 = v127;
              break;
            }
            default:
              {
              int v128 = 4;
              int v129 = v97 + v128;
              v121 = v129;
              break;
            }
          }
          bool v130 = true;
          v115 = v121;
          break;
        }
        default:
          {
          v115 = v97;
          break;
        }
      }
      bool v131 = true;
      v109 = v115;
      break;
    }
    default:
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
        int v138 = v137 + v97;
        int v139 = 20;
        int v140 = v139 + v138;
        int v141 = v96[v140];
        int v142 = 0;
        bool v143 = v141 != v142;
        v134 = v134;
        v135 = v135;
        if (!v143) break;
        int v144 = 40;
        int v145 = v144 + v97;
        int v146 = v96[v145];
        int v147;
        v147 = v97;
        switch (v146) {
          case 0:
            {
            int v148 = 2;
            int v149 = v97 + v148;
            v147 = v149;
            break;
          }
          default:
            {
            int v150 = 1;
            v147 = v150;
            break;
          }
        }
        bool v151 = true;
        int v152 = v134 + v147;
        int v153 = 1;
        int v154 = v135 + v153;
        v134 = v152;
        v135 = v154;
      }
      bool v155 = true;
      v109 = v134;
    }
    case 1:
      {
      int v156 = 44;
      int v157 = v156 + v97;
      int v158 = v96[v157];
      int v159 = 0;
      bool v160 = v158 != v159;
      int v161;
      if (v160) {
        int v162 = 1;
        v161 = v162;
      } else {
        int v163 = 48;
        int v164 = v163 + v97;
        int v165 = v96[v164];
        int v166 = 0;
        bool v167 = v165 != v166;
        int v168;
        if (v167) {
          int v169 = 2;
          int v170 = v97 + v169;
          v168 = v170;
        } else {
          int v171 = 4;
          v168 = v171;
        }
        v161 = v168;
      }
      v109 = v161;
      break;
    }
  }
  bool v172 = true;
  int v173 = 16;
  int v174 = v173 + v97;
  bool v175 = true;
  int v176 = simt_wave_count_bits(v175);
  v95[v174] = v176;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
