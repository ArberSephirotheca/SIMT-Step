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
  int v5 = 0;
  bool v6 = v2 != v5;
  int v7;
  if (v6) {
    int v8 = 0;
    bool v9 = v2 != v8;
    int v10;
    if (v9) {
      int v11 = 3;
      v10 = v11;
    } else {
      int v12 = 0;
      int v13 = 0;
      int v14;
      int v15;
      v14 = v12;
      v15 = v13;
      while (true) {
        int v16 = 4;
        int v17 = v3 % v16;
        int v18 = 1;
        int v19 = v17 + v18;
        bool v20 = v15 < v19;
        v14 = v14;
        v15 = v15;
        if (!v20) break;
        uint v21 = simt_subgroup_id(__simt_tid);
        int v22 = (int)(v21);
        int v23 = 1;
        int v24 = v15 + v23;
        v14 = v22;
        v15 = v24;
      }
      int v25 = 3;
      v10 = v14;
    }
    int v26 = 1;
    v7 = v10;
  } else {
    int v27 = 0;
    int v28 = 0;
    int v29;
    int v30;
    v29 = v27;
    v30 = v28;
    while (true) {
      int v31 = 4;
      int v32 = v3 % v31;
      int v33 = 1;
      int v34 = v32 + v33;
      bool v35 = v30 < v34;
      v29 = v29;
      v30 = v30;
      if (!v35) break;
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
        uint v45 = simt_lane_id(__simt_tid);
        int v46 = (int)(v45);
        int v47 = 1;
        int v48 = v39 + v47;
        v38 = v46;
        v39 = v48;
      }
      uint v49 = simt_subgroup_id(__simt_tid);
      int v50 = (int)(v49);
      int v51 = 1;
      int v52 = v30 + v51;
      v29 = v38;
      v30 = v52;
      break;
      ;
    }
    int v53 = 4;
    v7 = v29;
  }
  bool v54 = true;
  int v55 = simt_wave_count_bits(v54);
  int v56 = 0;
  int v57 = v56 + v0;
  v1[v57] = v55;
  int v58 = 0;
  bool v59 = v2 != v58;
  int v60 = v59 ? v4 : v7;
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
  uint v70 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v71 = (int)(v70);
  int v72 = 8;
  int v73 = v72 + v63;
  int v74 = v62[v73];
  uint v75 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v76 = (int)(v75);
  int v77;
  v77 = v76;
  switch (v74) {
    case 0:
      {
      int v78 = 0;
      int v79 = 0;
      int v80;
      int v81;
      v80 = v78;
      v81 = v79;
      while (true) {
        int v82 = 4;
        int v83 = v81 * v82;
        int v84 = v83 + v63;
        int v85 = 12;
        int v86 = v85 + v84;
        int v87 = v62[v86];
        int v88 = 0;
        bool v89 = v87 != v88;
        v80 = v80;
        v81 = v81;
        if (!v89) break;
        int v90 = v80 + v81;
        int v91 = 1;
        int v92 = v81 + v91;
        v80 = v90;
        v81 = v92;
        break;
        ;
      }
      bool v93 = true;
      v77 = v80;
      break;
    }
    default:
      {
      int v94 = 32;
      int v95 = v94 + v63;
      int v96 = v62[v95];
      int v97;
      v97 = v63;
      switch (v96) {
        default:
          {
          int v98 = 36;
          int v99 = v98 + v63;
          int v100 = v62[v99];
          int v101;
          v101 = v63;
          switch (v100) {
            default:
              {
              v101 = v63;
              break;
            }
            case 0:
              {
              int v102 = 1;
              int v103 = v63 + v102;
              v101 = v103;
              break;
            }
          }
          bool v104 = true;
          v97 = v101;
          break;
        }
        case 0:
          {
          int v105 = 40;
          int v106 = v105 + v63;
          int v107 = v62[v106];
          int v108 = 0;
          bool v109 = v107 != v108;
          int v110;
          if (v109) {
            v110 = v63;
          } else {
            v110 = v63;
          }
          v97 = v110;
          break;
        }
        case 1:
          {
          int v111 = 44;
          int v112 = v111 + v63;
          int v113 = v62[v112];
          int v114;
          v114 = v63;
          switch (v113) {
            default:
              {
              int v115 = 1;
              v114 = v115;
              break;
            }
            case 0:
              {
              int v116 = 4;
              int v117 = v63 + v116;
              v114 = v117;
              break;
            }
          }
          bool v118 = true;
          v97 = v114;
          break;
        }
        case 2:
          {
          int v119 = 0;
          int v120 = 0;
          int v121;
          int v122;
          v121 = v119;
          v122 = v120;
          while (true) {
            int v123 = 4;
            int v124 = v122 * v123;
            int v125 = v124 + v63;
            int v126 = 48;
            int v127 = v126 + v125;
            int v128 = v62[v127];
            int v129 = 0;
            bool v130 = v128 != v129;
            v121 = v121;
            v122 = v122;
            if (!v130) break;
            int v131 = v121 + v122;
            int v132 = 1;
            int v133 = v122 + v132;
            v121 = v131;
            v122 = v133;
          }
          bool v134 = true;
          v97 = v121;
          break;
        }
      }
      bool v135 = true;
      v77 = v97;
      break;
    }
  }
  bool v136 = true;
  int v137 = 16;
  int v138 = v137 + v63;
  bool v139 = true;
  int v140 = simt_wave_count_bits(v139);
  v61[v138] = v140;
  int v141 = 68;
  int v142 = v141 + v63;
  int v143 = v62[v142];
  int v144 = 0;
  int v145 = v63 + v144;
  int v146;
  v146 = v145;
  switch (v143) {
    case 0:
      {
      int v147 = 72;
      int v148 = v147 + v63;
      int v149 = v62[v148];
      int v150;
      v150 = v63;
      switch (v149) {
        default:
          {
          int v151 = 76;
          int v152 = v151 + v63;
          int v153 = v62[v152];
          int v154 = 4;
          int v155;
          v155 = v154;
          switch (v153) {
            case 0:
              {
              int v156 = 3;
              int v157 = v63 + v156;
              v155 = v157;
            }
            default:
              {
              int v158 = 0;
              int v159 = v63 + v158;
              v155 = v159;
              break;
            }
          }
          bool v160 = true;
          v150 = v155;
          break;
        }
        case 0:
          {
          int v161 = 80;
          int v162 = v161 + v63;
          int v163 = v62[v162];
          int v164 = 3;
          int v165;
          v165 = v164;
          switch (v163) {
            case 0:
              {
              int v166 = 4;
              int v167 = v63 + v166;
              v165 = v167;
              break;
            }
            default:
              {
              v165 = v63;
              break;
            }
            case 1:
              {
              int v168 = 1;
              int v169 = v63 + v168;
              v165 = v169;
              break;
            }
            case 2:
              {
              int v170 = 4;
              v165 = v170;
              break;
            }
          }
          bool v171 = true;
          v150 = v165;
          break;
        }
      }
      bool v172 = true;
      v146 = v150;
      break;
    }
    case 1:
      {
      v146 = v63;
      break;
    }
    default:
      {
      int v173 = 84;
      int v174 = v173 + v63;
      int v175 = v62[v174];
      int v176 = 0;
      bool v177 = v175 != v176;
      int v178;
      if (v177) {
        int v179 = 88;
        int v180 = v179 + v63;
        int v181 = v62[v180];
        int v182 = 0;
        bool v183 = v181 != v182;
        int v184;
        if (v183) {
          v184 = v63;
        } else {
          v184 = v63;
        }
        v178 = v184;
      } else {
        int v185 = 92;
        int v186 = v185 + v63;
        int v187 = v62[v186];
        int v188 = 1;
        int v189;
        v189 = v188;
        switch (v187) {
          case 0:
            {
            int v190 = 0;
            v189 = v190;
            break;
          }
          default:
            {
            int v191 = 4;
            v189 = v191;
            break;
          }
        }
        bool v192 = true;
        v178 = v189;
      }
      v146 = v178;
      break;
    }
  }
  bool v193 = true;
  int v194 = 32;
  int v195 = v194 + v63;
  bool v196 = true;
  int v197 = simt_wave_count_bits(v196);
  v61[v195] = v197;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
