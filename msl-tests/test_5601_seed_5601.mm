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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 3;
      int v10 = v3 % v9;
      int v11 = 4;
      int v12;
      v12 = v11;
      switch (v10) {
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
            int v22 = 3;
            int v23 = v0 + v22;
            int v24 = 1;
            int v25 = v16 + v24;
            v15 = v23;
            v16 = v25;
          }
          int v26 = 0;
          int v27 = v0 + v26;
          v12 = v15;
          break;
        }
        case 1:
          {
          int v28 = 0;
          bool v29 = v2 != v28;
          int v30;
          if (v29) {
            v30 = v0;
          } else {
            int v31 = 0;
            int v32 = v0 + v31;
            v30 = v32;
          }
          v12 = v30;
          break;
        }
        default:
          {
          int v33 = 0;
          int v34 = 0;
          int v35;
          int v36;
          v35 = v33;
          v36 = v34;
          while (true) {
            int v37 = 4;
            int v38 = v3 % v37;
            int v39 = 1;
            int v40 = v38 + v39;
            bool v41 = v36 < v40;
            v35 = v35;
            v36 = v36;
            if (!v41) break;
            int v42 = 3;
            int v43 = v0 + v42;
            int v44 = 1;
            int v45 = v36 + v44;
            v35 = v43;
            v36 = v45;
          }
          int v46 = 0;
          int v47 = v0 + v46;
          v12 = v35;
          break;
        }
        case 2:
          {
          v12 = v0;
          break;
        }
      }
      v8 = v12;
      break;
    }
    default:
      {
      int v48 = 0;
      int v49 = 0;
      int v50;
      int v51;
      v50 = v48;
      v51 = v49;
      while (true) {
        int v52 = 4;
        int v53 = v3 % v52;
        int v54 = 1;
        int v55 = v53 + v54;
        bool v56 = v51 < v55;
        v50 = v50;
        v51 = v51;
        if (!v56) break;
        int v57 = 2;
        int v58 = 1;
        int v59 = v51 + v58;
        v50 = v57;
        v51 = v59;
      }
      int v60 = 2;
      int v61 = v0 + v60;
      v8 = v50;
      break;
    }
    case 1:
      {
      int v62 = 0;
      bool v63 = v2 != v62;
      int v64;
      if (v63) {
        int v65 = 0;
        bool v66 = v2 != v65;
        int v67;
        if (v66) {
          int v68 = 2;
          int v69 = v0 + v68;
          v67 = v69;
        } else {
          int v70 = 2;
          v67 = v70;
        }
        v64 = v67;
      } else {
        int v71 = 0;
        bool v72 = v2 != v71;
        int v73;
        if (v72) {
          int v74 = 2;
          int v75 = v0 + v74;
          v73 = v75;
        } else {
          int v76 = 2;
          int v77 = v0 + v76;
          v73 = v77;
        }
        int v78 = 1;
        int v79 = v0 + v78;
        v64 = v73;
      }
      int v80 = 3;
      v8 = v64;
      break;
    }
    case 2:
      {
      int v81 = 4;
      int v82 = v3 % v81;
      int v83;
      v83 = v0;
      switch (v82) {
        case 0:
          {
          int v84 = 3;
          int v85 = v3 % v84;
          int v86 = 0;
          int v87 = v0 + v86;
          int v88;
          v88 = v87;
          switch (v85) {
            case 0:
              {
              v88 = v0;
            }
            default:
              {
              int v89 = 2;
              v88 = v89;
              break;
            }
            case 1:
              {
              int v90 = 3;
              v88 = v90;
            }
            case 2:
              {
              v88 = v0;
              break;
            }
          }
          int v91 = 4;
          int v92 = v0 + v91;
          v83 = v88;
        }
        default:
          {
          int v93 = 0;
          bool v94 = v2 != v93;
          int v95;
          if (v94) {
            v95 = v0;
          } else {
            int v96 = 0;
            int v97 = v0 + v96;
            v95 = v97;
          }
          v83 = v95;
        }
        case 1:
          {
          int v98 = 0;
          int v99 = 0;
          int v100;
          int v101;
          v100 = v98;
          v101 = v99;
          while (true) {
            int v102 = 4;
            int v103 = v3 % v102;
            int v104 = 1;
            int v105 = v103 + v104;
            bool v106 = v101 < v105;
            v100 = v100;
            v101 = v101;
            if (!v106) break;
            int v107 = 4;
            int v108 = v0 + v107;
            int v109 = 1;
            int v110 = v101 + v109;
            v100 = v108;
            v101 = v110;
          }
          v83 = v100;
        }
        case 2:
          {
          int v111 = 4;
          int v112 = v3 % v111;
          int v113 = 1;
          int v114 = v0 + v113;
          int v115;
          v115 = v114;
          switch (v112) {
            default:
              {
              v115 = v0;
            }
            case 0:
              {
              int v116 = 4;
              v115 = v116;
            }
            case 1:
              {
              v115 = v0;
            }
            case 2:
              {
              int v117 = 4;
              int v118 = v0 + v117;
              v115 = v118;
              break;
            }
          }
          int v119 = 1;
          int v120 = v0 + v119;
          v83 = v115;
          break;
        }
      }
      int v121 = 1;
      int v122 = v0 + v121;
      v8 = v83;
      break;
    }
  }
  bool v123 = true;
  int v124 = simt_wave_count_bits(v123);
  int v125 = 0;
  int v126 = v125 + v0;
  v1[v126] = v124;
  int v127 = 0;
  bool v128 = v2 != v127;
  int v129 = v128 ? v0 : v8;
  return;
}

kernel void kernel_main(device int* v130 [[buffer(0)]], device int* v131 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v132 = static_cast<int>(__simt_tid3.x);
  int v133 = 0;
  int v134 = v133 + v132;
  int v135 = v131[v134];
  int v136 = 4;
  int v137 = v136 + v132;
  int v138 = v131[v137];
  helper0(v132, v130, v135, v138, static_cast<int>(__simt_tid3.x));
  int v139 = 8;
  int v140 = v139 + v132;
  int v141 = v131[v140];
  uint v142 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v143 = (int)(v142);
  int v144;
  v144 = v143;
  switch (v141) {
    case 0:
      {
      int v145 = 12;
      int v146 = v145 + v132;
      int v147 = v131[v146];
      int v148;
      v148 = v132;
      switch (v147) {
        default:
          {
          int v149 = 16;
          int v150 = v149 + v132;
          int v151 = v131[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          int v154;
          if (v153) {
            int v155 = 1;
            int v156 = v132 + v155;
            v154 = v156;
          } else {
            int v157 = 1;
            v154 = v157;
          }
          v148 = v154;
          break;
        }
        case 0:
          {
          int v158 = 20;
          int v159 = v158 + v132;
          int v160 = v131[v159];
          int v161 = 2;
          int v162 = v132 + v161;
          int v163;
          v163 = v162;
          switch (v160) {
            default:
              {
              v163 = v132;
            }
            case 0:
              {
              int v164 = 4;
              v163 = v164;
            }
            case 1:
              {
              int v165 = 1;
              int v166 = v132 + v165;
              v163 = v166;
              break;
            }
          }
          bool v167 = true;
          v148 = v163;
          break;
        }
        case 1:
          {
          int v168 = 1;
          int v169 = v132 + v168;
          v148 = v169;
          break;
        }
      }
      bool v170 = true;
      v144 = v148;
      break;
    }
    default:
      {
      int v171 = 24;
      int v172 = v171 + v132;
      int v173 = v131[v172];
      int v174 = 0;
      bool v175 = v173 != v174;
      int v176;
      if (v175) {
        v176 = v132;
      } else {
        int v177 = 28;
        int v178 = v177 + v132;
        int v179 = v131[v178];
        int v180 = 0;
        bool v181 = v179 != v180;
        int v182;
        if (v181) {
          v182 = v132;
        } else {
          v182 = v132;
        }
        v176 = v182;
      }
      v144 = v176;
      break;
    }
  }
  bool v183 = true;
  int v184 = 16;
  int v185 = v184 + v132;
  bool v186 = true;
  int v187 = simt_wave_count_bits(v186);
  v130[v185] = v187;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
