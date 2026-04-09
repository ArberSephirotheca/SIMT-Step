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
  int v6;
  v6 = v0;
  switch (v5) {
    default:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 0;
        int v11 = 0;
        int v12;
        int v13;
        v12 = v10;
        v13 = v11;
        while (true) {
          int v14 = 4;
          int v15 = v3 % v14;
          int v16 = 1;
          int v17 = v15 + v16;
          bool v18 = v13 < v17;
          v12 = v12;
          v13 = v13;
          if (!v18) break;
          int v19 = 1;
          int v20 = v13 + v19;
          v12 = v0;
          v13 = v20;
        }
        v9 = v12;
      } else {
        int v21 = 1;
        v9 = v21;
      }
      v6 = v9;
      break;
    }
    case 0:
      {
      int v22 = 1;
      v6 = v22;
    }
    case 1:
      {
      int v23 = 0;
      bool v24 = v2 != v23;
      int v25;
      if (v24) {
        int v26 = 4;
        int v27 = v3 % v26;
        int v28 = 4;
        int v29 = v0 + v28;
        int v30;
        v30 = v29;
        switch (v27) {
          default:
            {
            v30 = v0;
            break;
          }
          case 0:
            {
            v30 = v0;
            break;
          }
          case 1:
            {
            int v31 = 1;
            int v32 = v0 + v31;
            v30 = v32;
            break;
          }
          case 2:
            {
            v30 = v0;
            break;
          }
        }
        v25 = v30;
      } else {
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
          int v43 = 1;
          int v44 = v36 + v43;
          v35 = v42;
          v36 = v44;
        }
        v25 = v35;
      }
      v6 = v25;
      break;
    }
  }
  bool v45 = true;
  int v46 = simt_wave_count_bits(v45);
  int v47 = 0;
  int v48 = v47 + v0;
  v1[v48] = v46;
  return;
}

kernel void kernel_main(device int* v49 [[buffer(0)]], device int* v50 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v51 = static_cast<int>(__simt_tid3.x);
  int v52 = 0;
  int v53 = v52 + v51;
  int v54 = v50[v53];
  int v55 = 4;
  int v56 = v55 + v51;
  int v57 = v50[v56];
  helper0(v51, v49, v54, v57, static_cast<int>(__simt_tid3.x));
  uint v58 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v59 = (int)(v58);
  int v60 = 8;
  int v61 = v60 + v51;
  int v62 = v50[v61];
  int v63;
  v63 = v51;
  switch (v62) {
    case 0:
      {
      int v64 = 12;
      int v65 = v64 + v51;
      int v66 = v50[v65];
      int v67 = 3;
      int v68 = v51 + v67;
      int v69;
      v69 = v68;
      switch (v66) {
        case 0:
          {
          int v70 = 16;
          int v71 = v70 + v51;
          int v72 = v50[v71];
          int v73 = 0;
          bool v74 = v72 != v73;
          int v75;
          if (v74) {
            int v76 = 0;
            int v77 = v51 + v76;
            v75 = v77;
          } else {
            int v78 = 3;
            v75 = v78;
          }
          v69 = v75;
          break;
        }
        default:
          {
          int v79 = 0;
          int v80 = 0;
          int v81;
          int v82;
          v81 = v79;
          v82 = v80;
          while (true) {
            int v83 = 4;
            int v84 = v82 * v83;
            int v85 = v84 + v51;
            int v86 = 20;
            int v87 = v86 + v85;
            int v88 = v50[v87];
            int v89 = 0;
            bool v90 = v88 != v89;
            v81 = v81;
            v82 = v82;
            if (!v90) break;
            int v91 = v81 + v82;
            int v92 = 1;
            int v93 = v82 + v92;
            bool v94 = true;
            v81 = v91;
            v82 = v93;
          }
          v69 = v81;
        }
        case 1:
          {
          int v95 = 40;
          int v96 = v95 + v51;
          int v97 = v50[v96];
          int v98 = 3;
          int v99 = v51 + v98;
          int v100;
          v100 = v99;
          switch (v97) {
            case 0:
              {
              v100 = v51;
              break;
            }
            default:
              {
              int v101 = 3;
              v100 = v101;
              break;
            }
            case 1:
              {
              int v102 = 3;
              v100 = v102;
              break;
            }
            case 2:
              {
              v100 = v51;
              break;
            }
          }
          bool v103 = true;
          v69 = v100;
          break;
        }
      }
      v63 = v69;
      break;
    }
    default:
      {
      v63 = v51;
      break;
    }
    case 1:
      {
      int v104 = 2;
      int v105 = v51 + v104;
      v63 = v105;
      break;
    }
    case 2:
      {
      int v106 = 44;
      int v107 = v106 + v51;
      int v108 = v50[v107];
      int v109 = 0;
      bool v110 = v108 != v109;
      int v111;
      if (v110) {
        int v112 = 4;
        v111 = v112;
      } else {
        int v113 = 0;
        int v114 = 0;
        int v115;
        int v116;
        v115 = v113;
        v116 = v114;
        while (true) {
          int v117 = 4;
          int v118 = v116 * v117;
          int v119 = v118 + v51;
          int v120 = 48;
          int v121 = v120 + v119;
          int v122 = v50[v121];
          int v123 = 0;
          bool v124 = v122 != v123;
          v115 = v115;
          v116 = v116;
          if (!v124) break;
          int v125 = v115 + v116;
          int v126 = 1;
          int v127 = v116 + v126;
          bool v128 = true;
          v115 = v125;
          v116 = v127;
        }
        v111 = v115;
      }
      v63 = v111;
      break;
    }
  }
  int v129 = 68;
  int v130 = v129 + v51;
  int v131 = v50[v130];
  uint v132 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v133 = (int)(v132);
  int v134;
  v134 = v133;
  switch (v131) {
    case 0:
      {
      int v135 = 72;
      int v136 = v135 + v51;
      int v137 = v50[v136];
      int v138 = 0;
      bool v139 = v137 != v138;
      int v140;
      if (v139) {
        int v141 = 76;
        int v142 = v141 + v51;
        int v143 = v50[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        int v146;
        if (v145) {
          int v147 = 3;
          v146 = v147;
        } else {
          v146 = v51;
        }
        v140 = v146;
      } else {
        v140 = v51;
      }
      v134 = v140;
      break;
    }
    default:
      {
      int v148 = 2;
      int v149 = v51 + v148;
      v134 = v149;
      break;
    }
    case 1:
      {
      int v150 = 80;
      int v151 = v150 + v51;
      int v152 = v50[v151];
      int v153 = 4;
      int v154 = v51 + v153;
      int v155;
      v155 = v154;
      switch (v152) {
        case 0:
          {
          int v156 = 0;
          int v157 = 0;
          int v158;
          int v159;
          v158 = v156;
          v159 = v157;
          while (true) {
            int v160 = 4;
            int v161 = v159 * v160;
            int v162 = v161 + v51;
            int v163 = 84;
            int v164 = v163 + v162;
            int v165 = v50[v164];
            int v166 = 0;
            bool v167 = v165 != v166;
            v158 = v158;
            v159 = v159;
            if (!v167) break;
            int v168 = v158 + v159;
            int v169 = 1;
            int v170 = v159 + v169;
            bool v171 = true;
            v158 = v168;
            v159 = v170;
          }
          v155 = v158;
          break;
        }
        default:
          {
          int v172 = 0;
          int v173 = 0;
          int v174;
          int v175;
          v174 = v172;
          v175 = v173;
          while (true) {
            int v176 = 4;
            int v177 = v175 * v176;
            int v178 = v177 + v51;
            int v179 = 104;
            int v180 = v179 + v178;
            int v181 = v50[v180];
            int v182 = 0;
            bool v183 = v181 != v182;
            v174 = v174;
            v175 = v175;
            if (!v183) break;
            int v184 = v174 + v175;
            int v185 = 1;
            int v186 = v175 + v185;
            bool v187 = true;
            v174 = v184;
            v175 = v186;
          }
          v155 = v174;
          break;
        }
        case 1:
          {
          int v188 = 124;
          int v189 = v188 + v51;
          int v190 = v50[v189];
          int v191;
          v191 = v51;
          switch (v190) {
            case 0:
              {
              int v192 = 3;
              v191 = v192;
            }
            default:
              {
              int v193 = 4;
              v191 = v193;
              break;
            }
          }
          v155 = v191;
          break;
        }
      }
      v134 = v155;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 4; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 128; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
