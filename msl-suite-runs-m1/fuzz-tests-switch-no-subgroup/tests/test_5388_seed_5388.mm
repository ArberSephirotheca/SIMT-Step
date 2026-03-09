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
  int v6 = 4;
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 4;
      int v9 = v3 % v8;
      int v10 = 1;
      int v11;
      v11 = v10;
      switch (v9) {
        default:
          {
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
            int v21 = 1;
            int v22 = v15 + v21;
            v14 = v0;
            v15 = v22;
            continue;
            ;
          }
          v11 = v14;
          break;
        }
        case 0:
          {
          v11 = v0;
          break;
        }
        case 1:
          {
          int v23 = 3;
          int v24 = v3 % v23;
          int v25;
          v25 = v0;
          switch (v24) {
            case 0:
              {
              int v26 = 4;
              v25 = v26;
            }
            case 1:
              {
              v25 = v0;
              break;
            }
            default:
              {
              int v27 = 2;
              v25 = v27;
              break;
            }
          }
          v11 = v25;
        }
        case 2:
          {
          int v28 = 2;
          int v29 = v3 % v28;
          int v30 = 1;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            case 0:
              {
              int v33 = 2;
              v32 = v33;
              break;
            }
            default:
              {
              int v34 = 1;
              int v35 = v0 + v34;
              v32 = v35;
              break;
            }
            case 1:
              {
              int v36 = 0;
              int v37 = v0 + v36;
              v32 = v37;
              break;
            }
          }
          v11 = v32;
          break;
        }
      }
      int v38 = 2;
      v7 = v11;
    }
    case 1:
      {
      int v39 = 0;
      int v40 = v0 + v39;
      int v41;
      v41 = v40;
      switch (v3) {
        default:
          {
          int v42 = 2;
          int v43 = v3 % v42;
          int v44;
          v44 = v0;
          switch (v43) {
            case 0:
              {
              v44 = v0;
              break;
            }
            default:
              {
              v44 = v0;
              break;
            }
          }
          v41 = v44;
        }
        case 0:
          {
          int v45 = 0;
          int v46 = 0;
          int v47;
          int v48;
          v47 = v45;
          v48 = v46;
          while (true) {
            int v49 = 4;
            int v50 = v3 % v49;
            int v51 = 1;
            int v52 = v50 + v51;
            bool v53 = v48 < v52;
            v47 = v47;
            v48 = v48;
            if (!v53) break;
            int v54 = 1;
            int v55 = v48 + v54;
            v47 = v0;
            v48 = v55;
            break;
            ;
          }
          v41 = v47;
          break;
        }
      }
      int v56 = 1;
      int v57 = v0 + v56;
      v7 = v41;
      break;
    }
    case 2:
      {
      int v58 = 0;
      int v59 = 0;
      int v60;
      int v61;
      v60 = v58;
      v61 = v59;
      while (true) {
        int v62 = 4;
        int v63 = v3 % v62;
        int v64 = 1;
        int v65 = v63 + v64;
        bool v66 = v61 < v65;
        v60 = v60;
        v61 = v61;
        if (!v66) break;
        int v67 = 3;
        int v68 = v3 % v67;
        int v69 = 1;
        int v70 = v0 + v69;
        int v71;
        v71 = v70;
        switch (v68) {
          default:
            {
            int v72 = 1;
            int v73 = v0 + v72;
            v71 = v73;
            break;
          }
          case 0:
            {
            int v74 = 3;
            v71 = v74;
            break;
          }
          case 1:
            {
            int v75 = 3;
            int v76 = v0 + v75;
            v71 = v76;
            break;
          }
          case 2:
            {
            int v77 = 2;
            v71 = v77;
            break;
          }
        }
        int v78 = 1;
        int v79 = v61 + v78;
        v60 = v71;
        v61 = v79;
      }
      v7 = v60;
      break;
    }
    default:
      {
      int v80 = 2;
      int v81 = v3 % v80;
      int v82 = 3;
      int v83;
      v83 = v82;
      switch (v81) {
        case 0:
          {
          int v84 = 0;
          bool v85 = v2 != v84;
          int v86;
          if (v85) {
            int v87 = 2;
            int v88 = v0 + v87;
            v86 = v88;
          } else {
            v86 = v0;
          }
          v83 = v86;
          break;
        }
        case 1:
          {
          int v89 = 0;
          bool v90 = v2 != v89;
          int v91;
          if (v90) {
            int v92 = 0;
            int v93 = v0 + v92;
            v91 = v93;
          } else {
            v91 = v0;
          }
          v83 = v91;
          break;
        }
        default:
          {
          v83 = v0;
          break;
        }
      }
      v7 = v83;
      break;
    }
  }
  bool v94 = true;
  int v95 = simt_wave_count_bits(v94);
  int v96 = 0;
  int v97 = v96 + v0;
  v1[v97] = v95;
  return;
}

kernel void kernel_main(device int* v98 [[buffer(0)]], device int* v99 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v100 = static_cast<int>(__simt_tid3.x);
  int v101 = 0;
  int v102 = v101 + v100;
  int v103 = v99[v102];
  int v104 = 4;
  int v105 = v104 + v100;
  int v106 = v99[v105];
  int v107 = 0;
  bool v108 = v103 != v107;
  if (v108) {
    int v109 = 8;
    int v110 = v109 + v100;
    int v111 = v99[v110];
    int v112 = 0;
    bool v113 = v111 != v112;
    if (v113) {
      helper0(v100, v98, v103, v106, static_cast<int>(__simt_tid3.x));
    } else {
    }
  } else {
  }
  int v114 = 12;
  int v115 = v114 + v100;
  int v116 = v99[v115];
  uint v117 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v118 = (int)(v117);
  int v119;
  v119 = v118;
  switch (v116) {
    case 0:
      {
      int v120 = 1;
      v119 = v120;
    }
    case 1:
      {
      int v121 = 1;
      int v122 = v100 + v121;
      v119 = v122;
      break;
    }
    default:
      {
      int v123 = 0;
      int v124 = 0;
      int v125;
      int v126;
      v125 = v123;
      v126 = v124;
      while (true) {
        int v127 = 4;
        int v128 = v126 * v127;
        int v129 = v128 + v100;
        int v130 = 16;
        int v131 = v130 + v129;
        int v132 = v99[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        v125 = v125;
        v126 = v126;
        if (!v134) break;
        int v135 = 36;
        int v136 = v135 + v100;
        int v137 = v99[v136];
        int v138 = 0;
        int v139 = v100 + v138;
        int v140;
        v140 = v139;
        switch (v137) {
          default:
            {
            int v141 = 4;
            v140 = v141;
            break;
          }
          case 0:
            {
            int v142 = 2;
            int v143 = v100 + v142;
            v140 = v143;
            break;
          }
          case 1:
            {
            int v144 = 3;
            v140 = v144;
            break;
          }
          case 2:
            {
            int v145 = 4;
            v140 = v145;
            break;
          }
        }
        int v146 = v125 + v140;
        int v147 = 1;
        int v148 = v126 + v147;
        bool v149 = true;
        v125 = v146;
        v126 = v148;
      }
      v119 = v125;
    }
    case 2:
      {
      int v150 = 40;
      int v151 = v150 + v100;
      int v152 = v99[v151];
      int v153;
      v153 = v100;
      switch (v152) {
        case 0:
          {
          int v154 = 0;
          int v155 = 0;
          int v156;
          int v157;
          v156 = v154;
          v157 = v155;
          while (true) {
            int v158 = 4;
            int v159 = v157 * v158;
            int v160 = v159 + v100;
            int v161 = 44;
            int v162 = v161 + v160;
            int v163 = v99[v162];
            int v164 = 0;
            bool v165 = v163 != v164;
            v156 = v156;
            v157 = v157;
            if (!v165) break;
            int v166 = v156 + v157;
            int v167 = 1;
            int v168 = v157 + v167;
            bool v169 = true;
            v156 = v166;
            v157 = v168;
            continue;
            ;
          }
          v153 = v156;
          break;
        }
        case 1:
          {
          v153 = v100;
          break;
        }
        case 2:
          {
          v153 = v100;
          break;
        }
        default:
          {
          int v170 = 64;
          int v171 = v170 + v100;
          int v172 = v99[v171];
          int v173 = 0;
          bool v174 = v172 != v173;
          int v175;
          if (v174) {
            int v176 = 1;
            v175 = v176;
          } else {
            v175 = v100;
          }
          v153 = v175;
          break;
        }
      }
      bool v177 = true;
      v119 = v153;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 3; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 68; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
