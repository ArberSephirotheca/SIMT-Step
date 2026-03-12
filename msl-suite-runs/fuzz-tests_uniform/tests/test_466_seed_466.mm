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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 3;
      int v17 = v3 % v16;
      uint v18 = simt_lane_id(__simt_tid);
      int v19 = (int)(v18);
      int v20;
      v20 = v19;
      switch (v17) {
        case 0:
          {
          int v21 = 2;
          int v22 = v0 + v21;
          v20 = v22;
          break;
        }
        default:
          {
          v20 = v0;
          break;
        }
        case 1:
          {
          v20 = v0;
          break;
        }
      }
      int v23 = 3;
      int v24 = 1;
      int v25 = v10 + v24;
      v9 = v20;
      v10 = v25;
      break;
      ;
    }
    uint v26 = simt_lane_id(__simt_tid);
    int v27 = (int)(v26);
    v6 = v9;
  } else {
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
      int v38 = 1;
      int v39 = v31 + v38;
      v30 = v37;
      v31 = v39;
    }
    uint v40 = simt_lane_id(__simt_tid);
    int v41 = (int)(v40);
    v6 = v30;
  }
  bool v42 = true;
  int v43 = simt_wave_count_bits(v42);
  int v44 = 0;
  int v45 = v44 + v0;
  v1[v45] = v43;
  return;
}

kernel void kernel_main(device int* v46 [[buffer(0)]], device int* v47 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v48 = static_cast<int>(__simt_tid3.x);
  int v49 = 0;
  int v50 = v49 + v48;
  int v51 = v47[v50];
  int v52 = 4;
  int v53 = v52 + v48;
  int v54 = v47[v53];
  helper0(v48, v46, v51, v54, static_cast<int>(__simt_tid3.x));
  int v55 = 8;
  int v56 = v55 + v48;
  int v57 = v47[v56];
  int v58 = 1;
  int v59 = v48 + v58;
  int v60;
  v60 = v59;
  switch (v57) {
    case 0:
      {
      int v61 = 12;
      int v62 = v61 + v48;
      int v63 = v47[v62];
      int v64 = 2;
      int v65;
      v65 = v64;
      switch (v63) {
        case 0:
          {
          int v66 = 16;
          int v67 = v66 + v48;
          int v68 = v47[v67];
          int v69 = 0;
          int v70 = v48 + v69;
          int v71;
          v71 = v70;
          switch (v68) {
            default:
              {
              int v72 = 1;
              int v73 = v48 + v72;
              v71 = v73;
              break;
            }
            case 0:
              {
              int v74 = 4;
              v71 = v74;
              break;
            }
            case 1:
              {
              int v75 = 4;
              int v76 = v48 + v75;
              v71 = v76;
              break;
            }
          }
          bool v77 = true;
          v65 = v71;
          break;
        }
        default:
          {
          int v78 = 20;
          int v79 = v78 + v48;
          int v80 = v47[v79];
          int v81;
          v81 = v48;
          switch (v80) {
            case 0:
              {
              int v82 = 1;
              int v83 = v48 + v82;
              v81 = v83;
              break;
            }
            default:
              {
              int v84 = 3;
              v81 = v84;
              break;
            }
          }
          bool v85 = true;
          v65 = v81;
          break;
        }
        case 1:
          {
          int v86 = 0;
          int v87 = 0;
          int v88;
          int v89;
          v88 = v86;
          v89 = v87;
          while (true) {
            int v90 = 4;
            int v91 = v89 * v90;
            int v92 = v91 + v48;
            int v93 = 24;
            int v94 = v93 + v92;
            int v95 = v47[v94];
            int v96 = 0;
            bool v97 = v95 != v96;
            v88 = v88;
            v89 = v89;
            if (!v97) break;
            int v98 = v88 + v89;
            int v99 = 1;
            int v100 = v89 + v99;
            v88 = v98;
            v89 = v100;
          }
          bool v101 = true;
          v65 = v88;
          break;
        }
        case 2:
          {
          int v102 = 44;
          int v103 = v102 + v48;
          int v104 = v47[v103];
          int v105 = 2;
          int v106 = v48 + v105;
          int v107;
          v107 = v106;
          switch (v104) {
            case 0:
              {
              v107 = v48;
            }
            case 1:
              {
              int v108 = 4;
              int v109 = v48 + v108;
              v107 = v109;
            }
            default:
              {
              int v110 = 3;
              int v111 = v48 + v110;
              v107 = v111;
            }
            case 2:
              {
              v107 = v48;
              break;
            }
          }
          bool v112 = true;
          v65 = v107;
          break;
        }
      }
      bool v113 = true;
      v60 = v65;
      break;
    }
    case 1:
      {
      int v114 = 48;
      int v115 = v114 + v48;
      int v116 = v47[v115];
      int v117 = 0;
      int v118;
      v118 = v117;
      switch (v116) {
        case 0:
          {
          int v119 = 52;
          int v120 = v119 + v48;
          int v121 = v47[v120];
          int v122 = 0;
          bool v123 = v121 != v122;
          int v124;
          if (v123) {
            int v125 = 2;
            int v126 = v48 + v125;
            v124 = v126;
          } else {
            int v127 = 2;
            int v128 = v48 + v127;
            v124 = v128;
          }
          v118 = v124;
        }
        default:
          {
          int v129 = 56;
          int v130 = v129 + v48;
          int v131 = v47[v130];
          int v132 = 4;
          int v133;
          v133 = v132;
          switch (v131) {
            case 0:
              {
              int v134 = 3;
              v133 = v134;
              break;
            }
            case 1:
              {
              int v135 = 3;
              int v136 = v48 + v135;
              v133 = v136;
              break;
            }
            case 2:
              {
              int v137 = 3;
              v133 = v137;
              break;
            }
            default:
              {
              v133 = v48;
              break;
            }
          }
          bool v138 = true;
          v118 = v133;
        }
        case 1:
          {
          int v139 = 60;
          int v140 = v139 + v48;
          int v141 = v47[v140];
          int v142;
          v142 = v48;
          switch (v141) {
            default:
              {
              int v143 = 0;
              int v144 = v48 + v143;
              v142 = v144;
              break;
            }
            case 0:
              {
              int v145 = 0;
              v142 = v145;
              break;
            }
            case 1:
              {
              int v146 = 3;
              int v147 = v48 + v146;
              v142 = v147;
              break;
            }
            case 2:
              {
              v142 = v48;
              break;
            }
          }
          bool v148 = true;
          v118 = v142;
          break;
        }
      }
      bool v149 = true;
      v60 = v118;
      break;
    }
    case 2:
      {
      int v150 = 64;
      int v151 = v150 + v48;
      int v152 = v47[v151];
      int v153 = 0;
      bool v154 = v152 != v153;
      int v155;
      if (v154) {
        int v156 = 4;
        v155 = v156;
      } else {
        int v157 = 3;
        v155 = v157;
      }
      v60 = v155;
      break;
    }
    default:
      {
      v60 = v48;
      break;
    }
  }
  bool v158 = true;
  int v159 = 16;
  int v160 = v159 + v48;
  bool v161 = true;
  int v162 = simt_wave_count_bits(v161);
  v46[v160] = v162;
  int v163 = 68;
  int v164 = v163 + v48;
  int v165 = v47[v164];
  int v166;
  v166 = v48;
  switch (v165) {
    case 0:
      {
      int v167 = 72;
      int v168 = v167 + v48;
      int v169 = v47[v168];
      int v170 = 0;
      bool v171 = v169 != v170;
      int v172;
      if (v171) {
        v172 = v48;
      } else {
        int v173 = 76;
        int v174 = v173 + v48;
        int v175 = v47[v174];
        int v176 = 3;
        int v177;
        v177 = v176;
        switch (v175) {
          case 0:
            {
            int v178 = 4;
            v177 = v178;
            break;
          }
          case 1:
            {
            v177 = v48;
            break;
          }
          default:
            {
            int v179 = 0;
            int v180 = v48 + v179;
            v177 = v180;
          }
          case 2:
            {
            int v181 = 1;
            v177 = v181;
            break;
          }
        }
        bool v182 = true;
        v172 = v177;
      }
      v166 = v172;
      break;
    }
    default:
      {
      int v183 = 1;
      int v184 = v48 + v183;
      v166 = v184;
      break;
    }
  }
  bool v185 = true;
  int v186 = 32;
  int v187 = v186 + v48;
  bool v188 = true;
  int v189 = simt_wave_count_bits(v188);
  v46[v187] = v189;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
