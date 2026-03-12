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
  int v5;
  v5 = v4;
  switch (v3) {
    default:
      {
      int v6 = 4;
      int v7 = v3 % v6;
      int v8 = 1;
      int v9;
      v9 = v8;
      switch (v7) {
        default:
          {
          int v10 = 0;
          bool v11 = v2 != v10;
          int v12;
          if (v11) {
            int v13 = 4;
            v12 = v13;
          } else {
            int v14 = 2;
            v12 = v14;
          }
          int v15 = 4;
          int v16 = v0 + v15;
          v9 = v12;
          break;
        }
        case 0:
          {
          int v17 = 0;
          bool v18 = v2 != v17;
          int v19;
          if (v18) {
            int v20 = 1;
            int v21 = v0 + v20;
            v19 = v21;
          } else {
            int v22 = 4;
            int v23 = v0 + v22;
            v19 = v23;
          }
          int v24 = 2;
          int v25 = v0 + v24;
          v9 = v19;
        }
        case 1:
          {
          int v26 = 0;
          int v27 = 0;
          int v28;
          int v29;
          v28 = v26;
          v29 = v27;
          while (true) {
            int v30 = 4;
            int v31 = v3 % v30;
            int v32 = 1;
            int v33 = v31 + v32;
            bool v34 = v29 < v33;
            v28 = v28;
            v29 = v29;
            if (!v34) break;
            int v35 = 3;
            int v36 = 1;
            int v37 = v29 + v36;
            v28 = v35;
            v29 = v37;
            continue;
            ;
          }
          v9 = v28;
          break;
        }
        case 2:
          {
          v9 = v0;
          break;
        }
      }
      int v38 = 2;
      int v39 = v0 + v38;
      v5 = v9;
      break;
    }
    case 0:
      {
      int v40 = 0;
      int v41 = 0;
      int v42;
      int v43;
      v42 = v40;
      v43 = v41;
      while (true) {
        int v44 = 4;
        int v45 = v3 % v44;
        int v46 = 1;
        int v47 = v45 + v46;
        bool v48 = v43 < v47;
        v42 = v42;
        v43 = v43;
        if (!v48) break;
        int v49 = 0;
        int v50 = 0;
        int v51;
        int v52;
        v51 = v49;
        v52 = v50;
        while (true) {
          int v53 = 4;
          int v54 = v3 % v53;
          int v55 = 1;
          int v56 = v54 + v55;
          bool v57 = v52 < v56;
          v51 = v51;
          v52 = v52;
          if (!v57) break;
          int v58 = 2;
          int v59 = v0 + v58;
          int v60 = 1;
          int v61 = v52 + v60;
          v51 = v59;
          v52 = v61;
        }
        int v62 = 1;
        int v63 = v43 + v62;
        v42 = v51;
        v43 = v63;
      }
      int v64 = 3;
      int v65 = v0 + v64;
      v5 = v42;
      break;
    }
  }
  bool v66 = true;
  int v67 = simt_wave_count_bits(v66);
  int v68 = 0;
  int v69 = v68 + v0;
  v1[v69] = v67;
  return;
}

kernel void kernel_main(device int* v70 [[buffer(0)]], device int* v71 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v72 = static_cast<int>(__simt_tid3.x);
  int v73 = 0;
  int v74 = v73 + v72;
  int v75 = v71[v74];
  int v76 = 4;
  int v77 = v76 + v72;
  int v78 = v71[v77];
  helper0(v72, v70, v75, v78, static_cast<int>(__simt_tid3.x));
  int v79 = 8;
  int v80 = v79 + v72;
  int v81 = v71[v80];
  int v82 = 1;
  int v83 = v72 + v82;
  int v84;
  v84 = v83;
  switch (v81) {
    case 0:
      {
      int v85 = 12;
      int v86 = v85 + v72;
      int v87 = v71[v86];
      int v88;
      v88 = v72;
      switch (v87) {
        case 0:
          {
          int v89 = 16;
          int v90 = v89 + v72;
          int v91 = v71[v90];
          int v92 = 0;
          bool v93 = v91 != v92;
          int v94;
          if (v93) {
            int v95 = 1;
            int v96 = v72 + v95;
            v94 = v96;
          } else {
            v94 = v72;
          }
          v88 = v94;
        }
        default:
          {
          int v97 = 20;
          int v98 = v97 + v72;
          int v99 = v71[v98];
          int v100 = 0;
          bool v101 = v99 != v100;
          int v102;
          if (v101) {
            int v103 = 0;
            v102 = v103;
          } else {
            int v104 = 4;
            v102 = v104;
          }
          v88 = v102;
          break;
        }
      }
      bool v105 = true;
      v84 = v88;
      break;
    }
    default:
      {
      v84 = v72;
      break;
    }
    case 1:
      {
      int v106 = 24;
      int v107 = v106 + v72;
      int v108 = v71[v107];
      int v109 = 0;
      int v110;
      v110 = v109;
      switch (v108) {
        case 0:
          {
          int v111 = 0;
          int v112 = 0;
          int v113;
          int v114;
          v113 = v111;
          v114 = v112;
          while (true) {
            int v115 = 4;
            int v116 = v114 * v115;
            int v117 = v116 + v72;
            int v118 = 28;
            int v119 = v118 + v117;
            int v120 = v71[v119];
            int v121 = 0;
            bool v122 = v120 != v121;
            v113 = v113;
            v114 = v114;
            if (!v122) break;
            int v123 = v113 + v114;
            int v124 = 1;
            int v125 = v114 + v124;
            v113 = v123;
            v114 = v125;
          }
          bool v126 = true;
          v110 = v113;
          break;
        }
        case 1:
          {
          v110 = v72;
          break;
        }
        default:
          {
          int v127 = 2;
          int v128 = v72 + v127;
          v110 = v128;
          break;
        }
        case 2:
          {
          int v129 = 0;
          v110 = v129;
          break;
        }
      }
      bool v130 = true;
      v84 = v110;
      break;
    }
  }
  bool v131 = true;
  int v132 = 16;
  int v133 = v132 + v72;
  bool v134 = true;
  int v135 = simt_wave_count_bits(v134);
  v70[v133] = v135;
  int v136 = 48;
  int v137 = v136 + v72;
  int v138 = v71[v137];
  uint v139 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v140 = (int)(v139);
  int v141;
  v141 = v140;
  switch (v138) {
    default:
      {
      v141 = v72;
    }
    case 0:
      {
      v141 = v72;
    }
    case 1:
      {
      int v142 = 52;
      int v143 = v142 + v72;
      int v144 = v71[v143];
      int v145 = 0;
      int v146 = v72 + v145;
      int v147;
      v147 = v146;
      switch (v144) {
        case 0:
          {
          int v148 = 56;
          int v149 = v148 + v72;
          int v150 = v71[v149];
          int v151 = 0;
          bool v152 = v150 != v151;
          int v153;
          if (v152) {
            v153 = v72;
          } else {
            int v154 = 2;
            v153 = v154;
          }
          v147 = v153;
        }
        case 1:
          {
          int v155 = 60;
          int v156 = v155 + v72;
          int v157 = v71[v156];
          int v158 = 3;
          int v159;
          v159 = v158;
          switch (v157) {
            default:
              {
              v159 = v72;
            }
            case 0:
              {
              v159 = v72;
              break;
            }
            case 1:
              {
              v159 = v72;
              break;
            }
          }
          bool v160 = true;
          v147 = v159;
        }
        default:
          {
          int v161 = 64;
          int v162 = v161 + v72;
          int v163 = v71[v162];
          int v164;
          v164 = v72;
          switch (v163) {
            default:
              {
              int v165 = 4;
              int v166 = v72 + v165;
              v164 = v166;
              break;
            }
            case 0:
              {
              int v167 = 4;
              int v168 = v72 + v167;
              v164 = v168;
              break;
            }
            case 1:
              {
              int v169 = 3;
              int v170 = v72 + v169;
              v164 = v170;
              break;
            }
          }
          bool v171 = true;
          v147 = v164;
        }
        case 2:
          {
          int v172 = 68;
          int v173 = v172 + v72;
          int v174 = v71[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          int v177;
          if (v176) {
            int v178 = 3;
            int v179 = v72 + v178;
            v177 = v179;
          } else {
            int v180 = 2;
            v177 = v180;
          }
          v147 = v177;
          break;
        }
      }
      bool v181 = true;
      v141 = v147;
      break;
    }
  }
  bool v182 = true;
  int v183 = 32;
  int v184 = v183 + v72;
  bool v185 = true;
  int v186 = simt_wave_count_bits(v185);
  v70[v184] = v186;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 72; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
