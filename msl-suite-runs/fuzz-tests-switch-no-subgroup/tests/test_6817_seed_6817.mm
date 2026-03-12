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
  int v6 = 3;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v3 % v8;
      int v10 = 4;
      int v11;
      v11 = v10;
      switch (v9) {
        case 0:
          {
          int v12 = 1;
          int v13 = v0 + v12;
          int v14;
          v14 = v13;
          switch (v3) {
            case 0:
              {
              v14 = v0;
            }
            default:
              {
              int v15 = 4;
              v14 = v15;
              break;
            }
          }
          v11 = v14;
          break;
        }
        case 1:
          {
          int v16 = 0;
          bool v17 = v2 != v16;
          int v18;
          if (v17) {
            v18 = v0;
          } else {
            int v19 = 4;
            v18 = v19;
          }
          v11 = v18;
        }
        case 2:
          {
          int v20 = 2;
          int v21 = v3 % v20;
          int v22 = 0;
          int v23;
          v23 = v22;
          switch (v21) {
            default:
              {
              v23 = v0;
              break;
            }
            case 0:
              {
              v23 = v0;
              break;
            }
            case 1:
              {
              int v24 = 2;
              v23 = v24;
              break;
            }
          }
          int v25 = 0;
          int v26 = v0 + v25;
          v11 = v23;
          break;
        }
        default:
          {
          int v27 = 0;
          bool v28 = v2 != v27;
          int v29;
          if (v28) {
            v29 = v0;
          } else {
            v29 = v0;
          }
          v11 = v29;
          break;
        }
      }
      v7 = v11;
    }
    default:
      {
      int v30 = 2;
      int v31 = v0 + v30;
      v7 = v31;
    }
    case 1:
      {
      int v32 = 0;
      bool v33 = v2 != v32;
      int v34;
      if (v33) {
        int v35 = 2;
        int v36 = v3 % v35;
        int v37 = 4;
        int v38;
        v38 = v37;
        switch (v36) {
          case 0:
            {
            int v39 = 1;
            int v40 = v0 + v39;
            v38 = v40;
            break;
          }
          default:
            {
            v38 = v0;
            break;
          }
        }
        v34 = v38;
      } else {
        int v41 = 2;
        int v42 = v3 % v41;
        int v43 = 0;
        int v44;
        v44 = v43;
        switch (v42) {
          case 0:
            {
            int v45 = 2;
            v44 = v45;
            break;
          }
          default:
            {
            v44 = v0;
            break;
          }
          case 1:
            {
            int v46 = 4;
            int v47 = v0 + v46;
            v44 = v47;
            break;
          }
        }
        v34 = v44;
      }
      v7 = v34;
    }
    case 2:
      {
      int v48 = 3;
      v7 = v48;
      break;
    }
  }
  bool v49 = true;
  int v50 = simt_wave_count_bits(v49);
  int v51 = 0;
  int v52 = v51 + v0;
  v1[v52] = v50;
  return;
}

kernel void kernel_main(device int* v53 [[buffer(0)]], device int* v54 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v55 = static_cast<int>(__simt_tid3.x);
  int v56 = 0;
  int v57 = v56 + v55;
  int v58 = v54[v57];
  int v59 = 4;
  int v60 = v59 + v55;
  int v61 = v54[v60];
  int v62 = 0;
  bool v63 = v58 != v62;
  if (v63) {
    int v64 = 8;
    int v65 = v64 + v55;
    int v66 = v54[v65];
    int v67 = 0;
    bool v68 = v66 != v67;
    if (v68) {
    } else {
      helper0(v55, v53, v58, v61, static_cast<int>(__simt_tid3.x));
    }
  } else {
  }
  int v69 = 12;
  int v70 = v69 + v55;
  int v71 = v54[v70];
  int v72;
  v72 = v55;
  switch (v71) {
    case 0:
      {
      int v73 = 16;
      int v74 = v73 + v55;
      int v75 = v54[v74];
      int v76 = 0;
      int v77;
      v77 = v76;
      switch (v75) {
        default:
          {
          int v78 = 20;
          int v79 = v78 + v55;
          int v80 = v54[v79];
          int v81 = 0;
          bool v82 = v80 != v81;
          int v83;
          if (v82) {
            int v84 = 3;
            v83 = v84;
          } else {
            v83 = v55;
          }
          v77 = v83;
          break;
        }
        case 0:
          {
          int v85 = 24;
          int v86 = v85 + v55;
          int v87 = v54[v86];
          int v88;
          v88 = v55;
          switch (v87) {
            default:
              {
              int v89 = 2;
              int v90 = v55 + v89;
              v88 = v90;
              break;
            }
            case 0:
              {
              v88 = v55;
              break;
            }
            case 1:
              {
              int v91 = 4;
              v88 = v91;
              break;
            }
            case 2:
              {
              int v92 = 3;
              int v93 = v55 + v92;
              v88 = v93;
              break;
            }
          }
          bool v94 = true;
          v77 = v88;
          break;
        }
        case 1:
          {
          int v95 = 28;
          int v96 = v95 + v55;
          int v97 = v54[v96];
          int v98 = 1;
          int v99;
          v99 = v98;
          switch (v97) {
            default:
              {
              int v100 = 2;
              int v101 = v55 + v100;
              v99 = v101;
              break;
            }
            case 0:
              {
              int v102 = 4;
              int v103 = v55 + v102;
              v99 = v103;
              break;
            }
            case 1:
              {
              v99 = v55;
              break;
            }
          }
          v77 = v99;
          break;
        }
        case 2:
          {
          int v104 = 32;
          int v105 = v104 + v55;
          int v106 = v54[v105];
          int v107 = 0;
          bool v108 = v106 != v107;
          int v109;
          if (v108) {
            int v110 = 0;
            int v111 = v55 + v110;
            v109 = v111;
          } else {
            int v112 = 3;
            v109 = v112;
          }
          v77 = v109;
          break;
        }
      }
      v72 = v77;
      break;
    }
    case 1:
      {
      int v113 = 36;
      int v114 = v113 + v55;
      int v115 = v54[v114];
      int v116 = 0;
      bool v117 = v115 != v116;
      int v118;
      if (v117) {
        int v119 = 40;
        int v120 = v119 + v55;
        int v121 = v54[v120];
        int v122;
        v122 = v55;
        switch (v121) {
          case 0:
            {
            int v123 = 0;
            int v124 = v55 + v123;
            v122 = v124;
          }
          case 1:
            {
            int v125 = 2;
            v122 = v125;
          }
          default:
            {
            v122 = v55;
            break;
          }
          case 2:
            {
            v122 = v55;
            break;
          }
        }
        bool v126 = true;
        v118 = v122;
      } else {
        int v127 = 44;
        int v128 = v127 + v55;
        int v129 = v54[v128];
        int v130 = 4;
        int v131;
        v131 = v130;
        switch (v129) {
          default:
            {
            int v132 = 4;
            v131 = v132;
            break;
          }
          case 0:
            {
            int v133 = 4;
            int v134 = v55 + v133;
            v131 = v134;
          }
          case 1:
            {
            int v135 = 0;
            v131 = v135;
            break;
          }
        }
        v118 = v131;
      }
      v72 = v118;
      break;
    }
    default:
      {
      int v136 = 48;
      int v137 = v136 + v55;
      int v138 = v54[v137];
      int v139 = 0;
      bool v140 = v138 != v139;
      int v141;
      if (v140) {
        int v142 = 0;
        int v143 = 0;
        int v144;
        int v145;
        v144 = v142;
        v145 = v143;
        while (true) {
          int v146 = 4;
          int v147 = v145 * v146;
          int v148 = v147 + v55;
          int v149 = 52;
          int v150 = v149 + v148;
          int v151 = v54[v150];
          int v152 = 0;
          bool v153 = v151 != v152;
          v144 = v144;
          v145 = v145;
          if (!v153) break;
          int v154 = v144 + v145;
          int v155 = 1;
          int v156 = v145 + v155;
          bool v157 = true;
          v144 = v154;
          v145 = v156;
        }
        v141 = v144;
      } else {
        int v158 = 72;
        int v159 = v158 + v55;
        int v160 = v54[v159];
        int v161;
        v161 = v55;
        switch (v160) {
          case 0:
            {
            v161 = v55;
          }
          default:
            {
            v161 = v55;
          }
          case 1:
            {
            int v162 = 4;
            v161 = v162;
          }
          case 2:
            {
            int v163 = 0;
            v161 = v163;
            break;
          }
        }
        v141 = v161;
      }
      v72 = v141;
      break;
    }
    case 2:
      {
      int v164 = 76;
      int v165 = v164 + v55;
      int v166 = v54[v165];
      int v167 = 4;
      int v168;
      v168 = v167;
      switch (v166) {
        case 0:
          {
          int v169 = 80;
          int v170 = v169 + v55;
          int v171 = v54[v170];
          int v172 = 0;
          bool v173 = v171 != v172;
          int v174;
          if (v173) {
            int v175 = 0;
            v174 = v175;
          } else {
            int v176 = 1;
            v174 = v176;
          }
          v168 = v174;
          break;
        }
        default:
          {
          int v177 = 4;
          int v178 = v55 + v177;
          v168 = v178;
          break;
        }
      }
      v72 = v168;
      break;
    }
  }
  int v179 = 84;
  int v180 = v179 + v55;
  int v181 = v54[v180];
  int v182 = 0;
  bool v183 = v181 != v182;
  int v184;
  if (v183) {
    int v185 = 3;
    v184 = v185;
  } else {
    int v186 = 1;
    v184 = v186;
  }
  int v187 = 16;
  int v188 = v187 + v55;
  bool v189 = true;
  int v190 = simt_wave_count_bits(v189);
  v53[v188] = v190;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
