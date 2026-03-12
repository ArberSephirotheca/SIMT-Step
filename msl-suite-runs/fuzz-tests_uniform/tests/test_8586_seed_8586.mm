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
  int v4 = 3;
  int v5 = v3 % v4;
  uint v6 = simt_subgroup_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 4;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              int v15 = 2;
              int v16 = v0 + v15;
              v14 = v16;
              break;
            }
            case 1:
              {
              int v17 = 4;
              v14 = v17;
            }
            default:
              {
              v14 = v0;
            }
            case 2:
              {
              int v18 = 4;
              v14 = v18;
              break;
            }
          }
          int v19 = 2;
          v11 = v14;
        }
        case 1:
          {
          int v20 = 3;
          int v21 = v3 % v20;
          int v22 = 1;
          int v23;
          v23 = v22;
          switch (v21) {
            case 0:
              {
              int v24 = 4;
              int v25 = v0 + v24;
              v23 = v25;
              break;
            }
            default:
              {
              int v26 = 1;
              int v27 = v0 + v26;
              v23 = v27;
              break;
            }
            case 1:
              {
              int v28 = 2;
              v23 = v28;
              break;
            }
          }
          int v29 = 1;
          int v30 = v0 + v29;
          v11 = v23;
          break;
        }
        case 2:
          {
          int v31 = 0;
          int v32 = 0;
          int v33;
          int v34;
          v33 = v31;
          v34 = v32;
          while (true) {
            int v35 = 4;
            int v36 = v3 % v35;
            int v37 = 1;
            int v38 = v36 + v37;
            bool v39 = v34 < v38;
            v33 = v33;
            v34 = v34;
            if (!v39) break;
            int v40 = 2;
            int v41 = 1;
            int v42 = v34 + v41;
            v33 = v40;
            v34 = v42;
          }
          v11 = v33;
        }
        default:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 2;
            int v53 = 1;
            int v54 = v46 + v53;
            v45 = v52;
            v46 = v54;
            break;
            ;
          }
          v11 = v45;
          break;
        }
      }
      int v55 = 0;
      int v56 = v0 + v55;
      v8 = v11;
      break;
    }
    case 1:
      {
      int v57 = 2;
      int v58 = v3 % v57;
      int v59;
      v59 = v0;
      switch (v58) {
        case 0:
          {
          int v60 = 0;
          int v61 = 0;
          int v62;
          int v63;
          v62 = v60;
          v63 = v61;
          while (true) {
            int v64 = 4;
            int v65 = v3 % v64;
            int v66 = 1;
            int v67 = v65 + v66;
            bool v68 = v63 < v67;
            v62 = v62;
            v63 = v63;
            if (!v68) break;
            int v69 = 2;
            int v70 = v0 + v69;
            int v71 = 1;
            int v72 = v63 + v71;
            v62 = v70;
            v63 = v72;
          }
          v59 = v62;
          break;
        }
        default:
          {
          int v73 = 0;
          bool v74 = v2 != v73;
          int v75;
          if (v74) {
            v75 = v0;
          } else {
            int v76 = 3;
            v75 = v76;
          }
          v59 = v75;
          break;
        }
        case 1:
          {
          int v77 = 0;
          bool v78 = v2 != v77;
          int v79;
          if (v78) {
            int v80 = 1;
            int v81 = v0 + v80;
            v79 = v81;
          } else {
            int v82 = 4;
            int v83 = v0 + v82;
            v79 = v83;
          }
          int v84 = 3;
          int v85 = v0 + v84;
          v59 = v79;
          break;
        }
      }
      v8 = v59;
      break;
    }
    case 2:
      {
      v8 = v0;
      break;
    }
    default:
      {
      v8 = v0;
      break;
    }
  }
  bool v86 = true;
  int v87 = simt_wave_count_bits(v86);
  int v88 = 0;
  int v89 = v88 + v0;
  v1[v89] = v87;
  return;
}

kernel void kernel_main(device int* v90 [[buffer(0)]], device int* v91 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v92 = static_cast<int>(__simt_tid3.x);
  int v93 = 0;
  int v94 = v93 + v92;
  int v95 = v91[v94];
  int v96 = 4;
  int v97 = v96 + v92;
  int v98 = v91[v97];
  helper0(v92, v90, v95, v98, static_cast<int>(__simt_tid3.x));
  int v99 = 8;
  int v100 = v99 + v92;
  int v101 = v91[v100];
  int v102 = 2;
  int v103 = v92 + v102;
  int v104;
  v104 = v103;
  switch (v101) {
    case 0:
      {
      int v105 = 12;
      int v106 = v105 + v92;
      int v107 = v91[v106];
      int v108;
      v108 = v92;
      switch (v107) {
        default:
          {
          int v109 = 0;
          int v110 = 0;
          int v111;
          int v112;
          v111 = v109;
          v112 = v110;
          while (true) {
            int v113 = 4;
            int v114 = v112 * v113;
            int v115 = v114 + v92;
            int v116 = 16;
            int v117 = v116 + v115;
            int v118 = v91[v117];
            int v119 = 0;
            bool v120 = v118 != v119;
            v111 = v111;
            v112 = v112;
            if (!v120) break;
            int v121 = v111 + v112;
            int v122 = 1;
            int v123 = v112 + v122;
            v111 = v121;
            v112 = v123;
          }
          bool v124 = true;
          v108 = v111;
          break;
        }
        case 0:
          {
          int v125 = 36;
          int v126 = v125 + v92;
          int v127 = v91[v126];
          int v128 = 1;
          int v129 = v92 + v128;
          int v130;
          v130 = v129;
          switch (v127) {
            case 0:
              {
              int v131 = 3;
              v130 = v131;
              break;
            }
            case 1:
              {
              v130 = v92;
              break;
            }
            default:
              {
              v130 = v92;
              break;
            }
          }
          bool v132 = true;
          v108 = v130;
          break;
        }
        case 1:
          {
          int v133 = 2;
          int v134 = v92 + v133;
          v108 = v134;
          break;
        }
        case 2:
          {
          int v135 = 40;
          int v136 = v135 + v92;
          int v137 = v91[v136];
          int v138;
          v138 = v92;
          switch (v137) {
            default:
              {
              int v139 = 4;
              int v140 = v92 + v139;
              v138 = v140;
              break;
            }
            case 0:
              {
              int v141 = 3;
              v138 = v141;
              break;
            }
          }
          bool v142 = true;
          v108 = v138;
          break;
        }
      }
      bool v143 = true;
      v104 = v108;
    }
    default:
      {
      int v144 = 44;
      int v145 = v144 + v92;
      int v146 = v91[v145];
      int v147 = 0;
      bool v148 = v146 != v147;
      int v149;
      if (v148) {
        int v150 = 0;
        int v151 = 0;
        int v152;
        int v153;
        v152 = v150;
        v153 = v151;
        while (true) {
          int v154 = 4;
          int v155 = v153 * v154;
          int v156 = v155 + v92;
          int v157 = 48;
          int v158 = v157 + v156;
          int v159 = v91[v158];
          int v160 = 0;
          bool v161 = v159 != v160;
          v152 = v152;
          v153 = v153;
          if (!v161) break;
          int v162 = v152 + v153;
          int v163 = 1;
          int v164 = v153 + v163;
          v152 = v162;
          v153 = v164;
          continue;
          ;
        }
        bool v165 = true;
        v149 = v152;
      } else {
        int v166 = 0;
        int v167 = 0;
        int v168;
        int v169;
        v168 = v166;
        v169 = v167;
        while (true) {
          int v170 = 4;
          int v171 = v169 * v170;
          int v172 = v171 + v92;
          int v173 = 68;
          int v174 = v173 + v172;
          int v175 = v91[v174];
          int v176 = 0;
          bool v177 = v175 != v176;
          v168 = v168;
          v169 = v169;
          if (!v177) break;
          int v178 = v168 + v169;
          int v179 = 1;
          int v180 = v169 + v179;
          v168 = v178;
          v169 = v180;
          continue;
          ;
        }
        bool v181 = true;
        v149 = v168;
      }
      v104 = v149;
      break;
    }
  }
  bool v182 = true;
  int v183 = 16;
  int v184 = v183 + v92;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v90[v184] = v186;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
