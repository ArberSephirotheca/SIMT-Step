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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    default:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10 = 4;
      int v11;
      v11 = v10;
      switch (v9) {
        default:
          {
          int v12 = 3;
          v11 = v12;
          break;
        }
        case 0:
          {
          v11 = v0;
          break;
        }
        case 1:
          {
          int v13 = 0;
          bool v14 = v2 != v13;
          int v15;
          if (v14) {
            int v16 = 1;
            v15 = v16;
          } else {
            v15 = v0;
          }
          v11 = v15;
          break;
        }
        case 2:
          {
          int v17 = 3;
          v11 = v17;
          break;
        }
      }
      v7 = v11;
      break;
    }
    case 0:
      {
      int v18 = 3;
      int v19 = v3 % v18;
      int v20;
      v20 = v0;
      switch (v19) {
        case 0:
          {
          int v21 = 1;
          v20 = v21;
          break;
        }
        case 1:
          {
          int v22 = 2;
          int v23 = v0 + v22;
          v20 = v23;
        }
        case 2:
          {
          v20 = v0;
          break;
        }
        default:
          {
          int v24 = 0;
          v20 = v24;
          break;
        }
      }
      v7 = v20;
      break;
    }
    case 1:
      {
      int v25 = 1;
      int v26;
      v26 = v25;
      switch (v3) {
        case 0:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            v29 = v0;
          } else {
            int v30 = 1;
            int v31 = v0 + v30;
            v29 = v31;
          }
          v26 = v29;
          break;
        }
        default:
          {
          int v32 = 0;
          int v33 = 0;
          int v34;
          int v35;
          v34 = v32;
          v35 = v33;
          while (true) {
            int v36 = 4;
            int v37 = v3 % v36;
            int v38 = 1;
            int v39 = v37 + v38;
            bool v40 = v35 < v39;
            v34 = v34;
            v35 = v35;
            if (!v40) break;
            int v41 = 1;
            int v42 = v35 + v41;
            v34 = v0;
            v35 = v42;
          }
          v26 = v34;
          break;
        }
      }
      v7 = v26;
      break;
    }
  }
  bool v43 = true;
  int v44 = simt_wave_count_bits(v43);
  int v45 = 0;
  int v46 = v45 + v0;
  v1[v46] = v44;
  return;
}

kernel void kernel_main(device int* v47 [[buffer(0)]], device int* v48 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v49 = static_cast<int>(__simt_tid3.x);
  int v50 = 0;
  int v51 = v50 + v49;
  int v52 = v48[v51];
  int v53 = 4;
  int v54 = v53 + v49;
  int v55 = v48[v54];
  int v56 = 0;
  bool v57 = v52 != v56;
  if (v57) {
  } else {
    int v58 = 8;
    int v59 = v58 + v49;
    int v60 = v48[v59];
    int v61 = 0;
    bool v62 = v60 != v61;
    if (v62) {
      helper0(v49, v47, v52, v55, static_cast<int>(__simt_tid3.x));
    } else {
    }
  }
  int v63 = 0;
  int v64 = 0;
  int v65;
  int v66;
  v65 = v63;
  v66 = v64;
  while (true) {
    int v67 = 4;
    int v68 = v66 * v67;
    int v69 = v68 + v49;
    int v70 = 12;
    int v71 = v70 + v69;
    int v72 = v48[v71];
    int v73 = 0;
    bool v74 = v72 != v73;
    v65 = v65;
    v66 = v66;
    if (!v74) break;
    int v75 = 2;
    int v76 = v65 + v75;
    int v77 = 1;
    int v78 = v66 + v77;
    bool v79 = true;
    int v80 = 16;
    int v81 = 4;
    int v82 = v66 * v81;
    int v83 = v80 + v82;
    int v84 = v83 + v49;
    bool v85 = true;
    int v86 = simt_wave_count_bits(v85);
    v47[v84] = v86;
    v65 = v76;
    v66 = v78;
  }
  int v87 = 32;
  int v88 = v87 + v49;
  int v89 = v48[v88];
  uint v90 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v91 = (int)(v90);
  int v92;
  v92 = v91;
  switch (v89) {
    case 0:
      {
      int v93 = 36;
      int v94 = v93 + v49;
      int v95 = v48[v94];
      int v96 = 0;
      bool v97 = v95 != v96;
      int v98;
      if (v97) {
        int v99 = 0;
        int v100 = 0;
        int v101;
        int v102;
        v101 = v99;
        v102 = v100;
        while (true) {
          int v103 = 4;
          int v104 = v102 * v103;
          int v105 = v104 + v49;
          int v106 = 40;
          int v107 = v106 + v105;
          int v108 = v48[v107];
          int v109 = 0;
          bool v110 = v108 != v109;
          v101 = v101;
          v102 = v102;
          if (!v110) break;
          int v111 = v101 + v102;
          int v112 = 1;
          int v113 = v102 + v112;
          bool v114 = true;
          v101 = v111;
          v102 = v113;
        }
        v98 = v101;
      } else {
        v98 = v49;
      }
      v92 = v98;
      break;
    }
    case 1:
      {
      int v115 = 60;
      int v116 = v115 + v49;
      int v117 = v48[v116];
      int v118 = 3;
      int v119;
      v119 = v118;
      switch (v117) {
        default:
          {
          int v120 = 64;
          int v121 = v120 + v49;
          int v122 = v48[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          int v125;
          if (v124) {
            int v126 = 1;
            int v127 = v49 + v126;
            v125 = v127;
          } else {
            v125 = v49;
          }
          v119 = v125;
        }
        case 0:
          {
          int v128 = 68;
          int v129 = v128 + v49;
          int v130 = v48[v129];
          int v131 = 3;
          int v132;
          v132 = v131;
          switch (v130) {
            default:
              {
              int v133 = 2;
              v132 = v133;
              break;
            }
            case 0:
              {
              int v134 = 2;
              v132 = v134;
              break;
            }
            case 1:
              {
              int v135 = 0;
              v132 = v135;
              break;
            }
          }
          bool v136 = true;
          v119 = v132;
        }
        case 1:
          {
          int v137 = 4;
          int v138 = v49 + v137;
          v119 = v138;
        }
        case 2:
          {
          int v139 = 72;
          int v140 = v139 + v49;
          int v141 = v48[v140];
          int v142 = 0;
          bool v143 = v141 != v142;
          int v144;
          if (v143) {
            int v145 = 0;
            int v146 = v49 + v145;
            v144 = v146;
          } else {
            int v147 = 2;
            v144 = v147;
          }
          v119 = v144;
          break;
        }
      }
      v92 = v119;
      break;
    }
    case 2:
      {
      int v148 = 76;
      int v149 = v148 + v49;
      int v150 = v48[v149];
      int v151 = 0;
      bool v152 = v150 != v151;
      int v153;
      if (v152) {
        int v154 = 80;
        int v155 = v154 + v49;
        int v156 = v48[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        int v159;
        if (v158) {
          int v160 = 4;
          v159 = v160;
        } else {
          int v161 = 4;
          v159 = v161;
        }
        v153 = v159;
      } else {
        int v162 = 84;
        int v163 = v162 + v49;
        int v164 = v48[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        int v167;
        if (v166) {
          int v168 = 4;
          v167 = v168;
        } else {
          int v169 = 3;
          int v170 = v49 + v169;
          v167 = v170;
        }
        v153 = v167;
      }
      v92 = v153;
      break;
    }
    default:
      {
      int v171 = 88;
      int v172 = v171 + v49;
      int v173 = v48[v172];
      int v174 = 1;
      int v175 = v49 + v174;
      int v176;
      v176 = v175;
      switch (v173) {
        case 0:
          {
          int v177 = 3;
          v176 = v177;
        }
        case 1:
          {
          int v178 = 92;
          int v179 = v178 + v49;
          int v180 = v48[v179];
          int v181;
          v181 = v49;
          switch (v180) {
            default:
              {
              int v182 = 1;
              int v183 = v49 + v182;
              v181 = v183;
            }
            case 0:
              {
              int v184 = 0;
              v181 = v184;
              break;
            }
          }
          v176 = v181;
          break;
        }
        default:
          {
          int v185 = 96;
          int v186 = v185 + v49;
          int v187 = v48[v186];
          int v188 = 0;
          bool v189 = v187 != v188;
          int v190;
          if (v189) {
            int v191 = 3;
            v190 = v191;
          } else {
            int v192 = 2;
            int v193 = v49 + v192;
            v190 = v193;
          }
          v176 = v190;
          break;
        }
      }
      bool v194 = true;
      v92 = v176;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 24; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
