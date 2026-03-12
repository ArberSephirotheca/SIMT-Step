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
    int v7 = 4;
    int v8 = v3 % v7;
    int v9 = 0;
    int v10 = v0 + v9;
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 3;
        int v13 = v3 % v12;
        int v14 = 1;
        int v15 = v0 + v14;
        int v16;
        v16 = v15;
        switch (v13) {
          case 0:
            {
            v16 = v0;
            break;
          }
          case 1:
            {
            int v17 = 0;
            v16 = v17;
            break;
          }
          default:
            {
            v16 = v0;
            break;
          }
        }
        int v18 = 2;
        v11 = v16;
      }
      case 1:
        {
        int v19 = 0;
        bool v20 = v2 != v19;
        int v21;
        if (v20) {
          int v22 = 3;
          v21 = v22;
        } else {
          int v23 = 3;
          v21 = v23;
        }
        v11 = v21;
        break;
      }
      case 2:
        {
        v11 = v0;
        break;
      }
      default:
        {
        int v24 = 0;
        bool v25 = v2 != v24;
        int v26;
        if (v25) {
          int v27 = 1;
          v26 = v27;
        } else {
          int v28 = 3;
          v26 = v28;
        }
        v11 = v26;
        break;
      }
    }
    int v29 = 4;
    int v30 = v0 + v29;
    v6 = v11;
  } else {
    int v31 = 0;
    bool v32 = v2 != v31;
    int v33;
    if (v32) {
      int v34 = 3;
      int v35 = v3 % v34;
      int v36 = 0;
      int v37 = v0 + v36;
      int v38;
      v38 = v37;
      switch (v35) {
        default:
          {
          int v39 = 3;
          int v40 = v0 + v39;
          v38 = v40;
          break;
        }
        case 0:
          {
          int v41 = 0;
          v38 = v41;
        }
        case 1:
          {
          int v42 = 2;
          v38 = v42;
          break;
        }
        case 2:
          {
          int v43 = 0;
          int v44 = v0 + v43;
          v38 = v44;
          break;
        }
      }
      v33 = v38;
    } else {
      int v45 = 3;
      int v46 = v3 % v45;
      uint v47 = simt_subgroup_id(__simt_tid);
      int v48 = (int)(v47);
      int v49;
      v49 = v48;
      switch (v46) {
        case 0:
          {
          int v50 = 1;
          v49 = v50;
          break;
        }
        case 1:
          {
          int v51 = 3;
          int v52 = v0 + v51;
          v49 = v52;
          break;
        }
        default:
          {
          int v53 = 0;
          int v54 = v0 + v53;
          v49 = v54;
          break;
        }
      }
      int v55 = 1;
      int v56 = v0 + v55;
      v33 = v49;
    }
    uint v57 = simt_lane_id(__simt_tid);
    int v58 = (int)(v57);
    v6 = v33;
  }
  bool v59 = true;
  int v60 = simt_wave_count_bits(v59);
  int v61 = 0;
  int v62 = v61 + v0;
  v1[v62] = v60;
  return;
}

kernel void kernel_main(device int* v63 [[buffer(0)]], device int* v64 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v65 = static_cast<int>(__simt_tid3.x);
  int v66 = 0;
  int v67 = v66 + v65;
  int v68 = v64[v67];
  int v69 = 4;
  int v70 = v69 + v65;
  int v71 = v64[v70];
  helper0(v65, v63, v68, v71, static_cast<int>(__simt_tid3.x));
  int v72 = 8;
  int v73 = v72 + v65;
  int v74 = v64[v73];
  uint v75 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v76 = (int)(v75);
  int v77;
  v77 = v76;
  switch (v74) {
    case 0:
      {
      int v78 = 12;
      int v79 = v78 + v65;
      int v80 = v64[v79];
      int v81 = 0;
      bool v82 = v80 != v81;
      int v83;
      if (v82) {
        int v84 = 16;
        int v85 = v84 + v65;
        int v86 = v64[v85];
        int v87 = 0;
        bool v88 = v86 != v87;
        int v89;
        if (v88) {
          v89 = v65;
        } else {
          int v90 = 0;
          int v91 = v65 + v90;
          v89 = v91;
        }
        v83 = v89;
      } else {
        int v92 = 1;
        v83 = v92;
      }
      v77 = v83;
      break;
    }
    default:
      {
      int v93 = 20;
      int v94 = v93 + v65;
      int v95 = v64[v94];
      int v96;
      v96 = v65;
      switch (v95) {
        case 0:
          {
          int v97 = 24;
          int v98 = v97 + v65;
          int v99 = v64[v98];
          int v100 = 0;
          int v101;
          v101 = v100;
          switch (v99) {
            case 0:
              {
              v101 = v65;
              break;
            }
            default:
              {
              v101 = v65;
              break;
            }
            case 1:
              {
              int v102 = 2;
              v101 = v102;
              break;
            }
            case 2:
              {
              int v103 = 0;
              v101 = v103;
              break;
            }
          }
          bool v104 = true;
          v96 = v101;
          break;
        }
        default:
          {
          int v105 = 28;
          int v106 = v105 + v65;
          int v107 = v64[v106];
          int v108 = 2;
          int v109;
          v109 = v108;
          switch (v107) {
            case 0:
              {
              int v110 = 4;
              v109 = v110;
              break;
            }
            default:
              {
              int v111 = 0;
              v109 = v111;
              break;
            }
          }
          bool v112 = true;
          v96 = v109;
        }
        case 1:
          {
          int v113 = 32;
          int v114 = v113 + v65;
          int v115 = v64[v114];
          int v116;
          v116 = v65;
          switch (v115) {
            case 0:
              {
              int v117 = 4;
              v116 = v117;
            }
            case 1:
              {
              int v118 = 0;
              v116 = v118;
              break;
            }
            case 2:
              {
              v116 = v65;
              break;
            }
            default:
              {
              int v119 = 3;
              v116 = v119;
              break;
            }
          }
          bool v120 = true;
          v96 = v116;
          break;
        }
      }
      bool v121 = true;
      v77 = v96;
      break;
    }
    case 1:
      {
      int v122 = 0;
      v77 = v122;
      break;
    }
  }
  bool v123 = true;
  int v124 = 16;
  int v125 = v124 + v65;
  bool v126 = true;
  int v127 = simt_wave_count_bits(v126);
  v63[v125] = v127;
  int v128 = 0;
  int v129 = 0;
  int v130;
  int v131;
  v130 = v128;
  v131 = v129;
  while (true) {
    int v132 = 4;
    int v133 = v131 * v132;
    int v134 = v133 + v65;
    int v135 = 36;
    int v136 = v135 + v134;
    int v137 = v64[v136];
    int v138 = 0;
    bool v139 = v137 != v138;
    v130 = v130;
    v131 = v131;
    if (!v139) break;
    int v140 = v130 + v131;
    int v141 = 1;
    int v142 = v131 + v141;
    v130 = v140;
    v131 = v142;
    continue;
    ;
  }
  bool v143 = true;
  int v144 = 32;
  int v145 = v144 + v65;
  bool v146 = true;
  int v147 = simt_wave_count_bits(v146);
  v63[v145] = v147;
  int v148 = 56;
  int v149 = v148 + v65;
  int v150 = v64[v149];
  int v151 = 0;
  bool v152 = v150 != v151;
  int v153;
  if (v152) {
    uint v154 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v155 = (int)(v154);
    v153 = v155;
  } else {
    int v156 = 60;
    int v157 = v156 + v65;
    int v158 = v64[v157];
    int v159 = 0;
    bool v160 = v158 != v159;
    int v161;
    if (v160) {
      int v162 = 64;
      int v163 = v162 + v65;
      int v164 = v64[v163];
      uint v165 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v166 = (int)(v165);
      int v167;
      v167 = v166;
      switch (v164) {
        default:
          {
          int v168 = 4;
          v167 = v168;
          break;
        }
        case 0:
          {
          v167 = v65;
          break;
        }
      }
      bool v169 = true;
      v161 = v167;
    } else {
      int v170 = 68;
      int v171 = v170 + v65;
      int v172 = v64[v171];
      int v173 = 3;
      int v174 = v65 + v173;
      int v175;
      v175 = v174;
      switch (v172) {
        case 0:
          {
          int v176 = 4;
          v175 = v176;
        }
        case 1:
          {
          int v177 = 1;
          v175 = v177;
        }
        case 2:
          {
          int v178 = 1;
          v175 = v178;
          break;
        }
        default:
          {
          int v179 = 3;
          int v180 = v65 + v179;
          v175 = v180;
          break;
        }
      }
      bool v181 = true;
      v161 = v175;
    }
    v153 = v161;
  }
  int v182 = 48;
  int v183 = v182 + v65;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v63[v183] = v185;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
