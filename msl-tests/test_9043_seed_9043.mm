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
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 4;
      int v10 = v0 + v9;
      int v11;
      v11 = v10;
      switch (v8) {
        case 0:
          {
          v11 = v0;
          break;
        }
        case 1:
          {
          v11 = v0;
          break;
        }
        default:
          {
          int v12 = 4;
          int v13 = v3 % v12;
          int v14 = 1;
          int v15 = v0 + v14;
          int v16;
          v16 = v15;
          switch (v13) {
            case 0:
              {
              int v17 = 3;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
            default:
              {
              v16 = v0;
              break;
            }
            case 1:
              {
              int v19 = 3;
              int v20 = v0 + v19;
              v16 = v20;
            }
            case 2:
              {
              v16 = v0;
              break;
            }
          }
          v11 = v16;
          break;
        }
        case 2:
          {
          v11 = v0;
          break;
        }
      }
      int v21 = 1;
      int v22 = v0 + v21;
      v6 = v11;
    }
    case 1:
      {
      int v23 = 0;
      int v24 = 0;
      int v25;
      int v26;
      v25 = v23;
      v26 = v24;
      while (true) {
        int v27 = 4;
        int v28 = v3 % v27;
        int v29 = 1;
        int v30 = v28 + v29;
        bool v31 = v26 < v30;
        v25 = v25;
        v26 = v26;
        if (!v31) break;
        int v32 = 1;
        int v33 = v26 + v32;
        v25 = v0;
        v26 = v33;
      }
      v6 = v25;
    }
    case 2:
      {
      int v34 = 0;
      bool v35 = v2 != v34;
      int v36;
      if (v35) {
        int v37 = 4;
        int v38 = v0 + v37;
        int v39;
        v39 = v38;
        switch (v3) {
          case 0:
            {
            int v40 = 1;
            v39 = v40;
            break;
          }
          default:
            {
            int v41 = 2;
            int v42 = v0 + v41;
            v39 = v42;
            break;
          }
        }
        v36 = v39;
      } else {
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
          int v52 = 0;
          int v53 = 1;
          int v54 = v46 + v53;
          v45 = v52;
          v46 = v54;
        }
        int v55 = 1;
        int v56 = v0 + v55;
        v36 = v45;
      }
      v6 = v36;
      break;
    }
    default:
      {
      int v57 = 0;
      int v58 = 0;
      int v59;
      int v60;
      v59 = v57;
      v60 = v58;
      while (true) {
        int v61 = 4;
        int v62 = v3 % v61;
        int v63 = 1;
        int v64 = v62 + v63;
        bool v65 = v60 < v64;
        v59 = v59;
        v60 = v60;
        if (!v65) break;
        int v66 = 4;
        int v67 = v0 + v66;
        int v68;
        v68 = v67;
        switch (v3) {
          default:
            {
            int v69 = 3;
            v68 = v69;
            break;
          }
          case 0:
            {
            v68 = v0;
            break;
          }
        }
        int v70 = 4;
        int v71 = v0 + v70;
        int v72 = 1;
        int v73 = v60 + v72;
        v59 = v68;
        v60 = v73;
        continue;
        ;
      }
      int v74 = 1;
      v6 = v59;
      break;
    }
  }
  bool v75 = true;
  int v76 = simt_wave_count_bits(v75);
  int v77 = 0;
  int v78 = v77 + v0;
  v1[v78] = v76;
  return;
}

kernel void kernel_main(device int* v79 [[buffer(0)]], device int* v80 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v81 = static_cast<int>(__simt_tid3.x);
  int v82 = 0;
  int v83 = v82 + v81;
  int v84 = v80[v83];
  int v85 = 4;
  int v86 = v85 + v81;
  int v87 = v80[v86];
  helper0(v81, v79, v84, v87, static_cast<int>(__simt_tid3.x));
  int v88 = 8;
  int v89 = v88 + v81;
  int v90 = v80[v89];
  uint v91 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v92 = (int)(v91);
  int v93;
  v93 = v92;
  switch (v90) {
    case 0:
      {
      int v94 = 1;
      int v95 = v81 + v94;
      v93 = v95;
    }
    default:
      {
      int v96 = 12;
      int v97 = v96 + v81;
      int v98 = v80[v97];
      int v99;
      v99 = v81;
      switch (v98) {
        case 0:
          {
          int v100 = 16;
          int v101 = v100 + v81;
          int v102 = v80[v101];
          int v103 = 0;
          bool v104 = v102 != v103;
          int v105;
          if (v104) {
            int v106 = 2;
            v105 = v106;
          } else {
            v105 = v81;
          }
          v99 = v105;
          break;
        }
        case 1:
          {
          int v107 = 0;
          int v108 = 0;
          int v109;
          int v110;
          v109 = v107;
          v110 = v108;
          while (true) {
            int v111 = 4;
            int v112 = v110 * v111;
            int v113 = v112 + v81;
            int v114 = 20;
            int v115 = v114 + v113;
            int v116 = v80[v115];
            int v117 = 0;
            bool v118 = v116 != v117;
            v109 = v109;
            v110 = v110;
            if (!v118) break;
            int v119 = v109 + v110;
            int v120 = 1;
            int v121 = v110 + v120;
            v109 = v119;
            v110 = v121;
            break;
            ;
          }
          bool v122 = true;
          v99 = v109;
        }
        default:
          {
          int v123 = 40;
          int v124 = v123 + v81;
          int v125 = v80[v124];
          int v126 = 4;
          int v127;
          v127 = v126;
          switch (v125) {
            case 0:
              {
              int v128 = 4;
              v127 = v128;
              break;
            }
            case 1:
              {
              int v129 = 3;
              v127 = v129;
              break;
            }
            case 2:
              {
              v127 = v81;
              break;
            }
            default:
              {
              v127 = v81;
              break;
            }
          }
          bool v130 = true;
          v99 = v127;
          break;
        }
        case 2:
          {
          int v131 = 0;
          int v132 = 0;
          int v133;
          int v134;
          v133 = v131;
          v134 = v132;
          while (true) {
            int v135 = 4;
            int v136 = v134 * v135;
            int v137 = v136 + v81;
            int v138 = 44;
            int v139 = v138 + v137;
            int v140 = v80[v139];
            int v141 = 0;
            bool v142 = v140 != v141;
            v133 = v133;
            v134 = v134;
            if (!v142) break;
            int v143 = v133 + v134;
            int v144 = 1;
            int v145 = v134 + v144;
            v133 = v143;
            v134 = v145;
            break;
            ;
          }
          bool v146 = true;
          v99 = v133;
          break;
        }
      }
      bool v147 = true;
      v93 = v99;
      break;
    }
    case 1:
      {
      int v148 = 4;
      int v149 = v81 + v148;
      v93 = v149;
      break;
    }
    case 2:
      {
      int v150 = 0;
      int v151 = 0;
      int v152;
      int v153;
      v152 = v150;
      v153 = v151;
      while (true) {
        int v154 = 4;
        int v155 = v153 * v154;
        int v156 = v155 + v81;
        int v157 = 64;
        int v158 = v157 + v156;
        int v159 = v80[v158];
        int v160 = 0;
        bool v161 = v159 != v160;
        v152 = v152;
        v153 = v153;
        if (!v161) break;
        int v162 = 84;
        int v163 = v162 + v81;
        int v164 = v80[v163];
        int v165 = 0;
        bool v166 = v164 != v165;
        int v167;
        if (v166) {
          int v168 = 4;
          int v169 = v81 + v168;
          v167 = v169;
        } else {
          int v170 = 2;
          v167 = v170;
        }
        int v171 = v152 + v167;
        int v172 = 1;
        int v173 = v153 + v172;
        v152 = v171;
        v153 = v173;
      }
      bool v174 = true;
      v93 = v152;
      break;
    }
  }
  bool v175 = true;
  int v176 = 16;
  int v177 = v176 + v81;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v79[v177] = v179;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
