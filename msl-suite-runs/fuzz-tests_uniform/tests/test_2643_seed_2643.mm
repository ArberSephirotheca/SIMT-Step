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
  int v6 = 0;
  int v7 = v0 + v6;
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
          int v12 = 3;
          v11 = v12;
          break;
        }
        default:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 4;
          int v16 = v0 + v15;
          int v17;
          v17 = v16;
          switch (v14) {
            case 0:
              {
              v17 = v0;
            }
            default:
              {
              v17 = v0;
            }
            case 1:
              {
              v17 = v0;
            }
            case 2:
              {
              int v18 = 3;
              v17 = v18;
              break;
            }
          }
          int v19 = 2;
          int v20 = v0 + v19;
          v11 = v17;
          break;
        }
        case 1:
          {
          int v21 = 0;
          bool v22 = v2 != v21;
          int v23;
          if (v22) {
            int v24 = 0;
            int v25 = v0 + v24;
            v23 = v25;
          } else {
            int v26 = 4;
            int v27 = v0 + v26;
            v23 = v27;
          }
          v11 = v23;
        }
        case 2:
          {
          int v28 = 3;
          int v29 = v3 % v28;
          int v30 = 0;
          int v31 = v0 + v30;
          int v32;
          v32 = v31;
          switch (v29) {
            case 0:
              {
              int v33 = 4;
              v32 = v33;
              break;
            }
            default:
              {
              int v34 = 2;
              v32 = v34;
              break;
            }
            case 1:
              {
              int v35 = 3;
              int v36 = v0 + v35;
              v32 = v36;
              break;
            }
          }
          int v37 = 4;
          v11 = v32;
          break;
        }
      }
      int v38 = 3;
      int v39 = v0 + v38;
      v8 = v11;
    }
    case 1:
      {
      int v40 = 2;
      int v41 = v3 % v40;
      int v42;
      v42 = v0;
      switch (v41) {
        default:
          {
          int v43 = 2;
          v42 = v43;
          break;
        }
        case 0:
          {
          int v44 = 1;
          int v45;
          v45 = v44;
          switch (v3) {
            case 0:
              {
              int v46 = 0;
              v45 = v46;
              break;
            }
            default:
              {
              int v47 = 3;
              v45 = v47;
              break;
            }
          }
          int v48 = 0;
          int v49 = v0 + v48;
          v42 = v45;
          break;
        }
        case 1:
          {
          int v50 = 4;
          int v51 = v3 % v50;
          int v52 = 0;
          int v53;
          v53 = v52;
          switch (v51) {
            default:
              {
              int v54 = 3;
              int v55 = v0 + v54;
              v53 = v55;
              break;
            }
            case 0:
              {
              int v56 = 3;
              v53 = v56;
              break;
            }
            case 1:
              {
              int v57 = 1;
              int v58 = v0 + v57;
              v53 = v58;
              break;
            }
            case 2:
              {
              int v59 = 1;
              int v60 = v0 + v59;
              v53 = v60;
              break;
            }
          }
          int v61 = 3;
          v42 = v53;
          break;
        }
      }
      v8 = v42;
    }
    default:
      {
      v8 = v0;
      break;
    }
  }
  bool v62 = true;
  int v63 = simt_wave_count_bits(v62);
  int v64 = 0;
  int v65 = v64 + v0;
  v1[v65] = v63;
  return;
}

kernel void kernel_main(device int* v66 [[buffer(0)]], device int* v67 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v68 = static_cast<int>(__simt_tid3.x);
  int v69 = 0;
  int v70 = v69 + v68;
  int v71 = v67[v70];
  int v72 = 4;
  int v73 = v72 + v68;
  int v74 = v67[v73];
  helper0(v68, v66, v71, v74, static_cast<int>(__simt_tid3.x));
  int v75 = 8;
  int v76 = v75 + v68;
  int v77 = v67[v76];
  int v78 = 0;
  bool v79 = v77 != v78;
  int v80;
  if (v79) {
    int v81 = 12;
    int v82 = v81 + v68;
    int v83 = v67[v82];
    int v84 = 0;
    bool v85 = v83 != v84;
    int v86;
    if (v85) {
      int v87 = 16;
      int v88 = v87 + v68;
      int v89 = v67[v88];
      int v90 = 0;
      bool v91 = v89 != v90;
      int v92;
      if (v91) {
        int v93 = 2;
        v92 = v93;
      } else {
        uint v94 = simt_lane_id(static_cast<int>(__simt_tid3.x));
        int v95 = (int)(v94);
        v92 = v95;
      }
      v86 = v92;
    } else {
      int v96 = 0;
      int v97 = 0;
      int v98;
      int v99;
      v98 = v96;
      v99 = v97;
      while (true) {
        int v100 = 4;
        int v101 = v99 * v100;
        int v102 = v101 + v68;
        int v103 = 20;
        int v104 = v103 + v102;
        int v105 = v67[v104];
        int v106 = 0;
        bool v107 = v105 != v106;
        v98 = v98;
        v99 = v99;
        if (!v107) break;
        int v108 = v98 + v99;
        int v109 = 1;
        int v110 = v99 + v109;
        v98 = v108;
        v99 = v110;
      }
      bool v111 = true;
      v86 = v98;
    }
    v80 = v86;
  } else {
    int v112 = 40;
    int v113 = v112 + v68;
    int v114 = v67[v113];
    uint v115 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v116 = (int)(v115);
    int v117;
    v117 = v116;
    switch (v114) {
      default:
        {
        v117 = v68;
      }
      case 0:
        {
        int v118 = 4;
        int v119 = v68 + v118;
        v117 = v119;
      }
      case 1:
        {
        int v120 = 44;
        int v121 = v120 + v68;
        int v122 = v67[v121];
        int v123 = 4;
        int v124;
        v124 = v123;
        switch (v122) {
          case 0:
            {
            v124 = v68;
          }
          case 1:
            {
            v124 = v68;
            break;
          }
          default:
            {
            int v125 = 3;
            v124 = v125;
          }
          case 2:
            {
            v124 = v68;
            break;
          }
        }
        bool v126 = true;
        v117 = v124;
        break;
      }
    }
    bool v127 = true;
    v80 = v117;
  }
  int v128 = 16;
  int v129 = v128 + v68;
  bool v130 = true;
  int v131 = simt_wave_count_bits(v130);
  v66[v129] = v131;
  int v132 = 48;
  int v133 = v132 + v68;
  int v134 = v67[v133];
  int v135 = 0;
  bool v136 = v134 != v135;
  int v137;
  if (v136) {
    int v138 = 52;
    int v139 = v138 + v68;
    int v140 = v67[v139];
    uint v141 = simt_lane_id(static_cast<int>(__simt_tid3.x));
    int v142 = (int)(v141);
    int v143;
    v143 = v142;
    switch (v140) {
      case 0:
        {
        int v144 = 56;
        int v145 = v144 + v68;
        int v146 = v67[v145];
        int v147 = 1;
        int v148 = v68 + v147;
        int v149;
        v149 = v148;
        switch (v146) {
          default:
            {
            int v150 = 2;
            v149 = v150;
            break;
          }
          case 0:
            {
            int v151 = 1;
            int v152 = v68 + v151;
            v149 = v152;
            break;
          }
        }
        bool v153 = true;
        v143 = v149;
        break;
      }
      default:
        {
        int v154 = 60;
        int v155 = v154 + v68;
        int v156 = v67[v155];
        int v157;
        v157 = v68;
        switch (v156) {
          case 0:
            {
            v157 = v68;
            break;
          }
          default:
            {
            int v158 = 2;
            int v159 = v68 + v158;
            v157 = v159;
            break;
          }
          case 1:
            {
            v157 = v68;
            break;
          }
          case 2:
            {
            v157 = v68;
            break;
          }
        }
        bool v160 = true;
        v143 = v157;
        break;
      }
    }
    bool v161 = true;
    v137 = v143;
  } else {
    int v162 = 0;
    int v163 = 0;
    int v164;
    int v165;
    v164 = v162;
    v165 = v163;
    while (true) {
      int v166 = 4;
      int v167 = v165 * v166;
      int v168 = v167 + v68;
      int v169 = 64;
      int v170 = v169 + v168;
      int v171 = v67[v170];
      int v172 = 0;
      bool v173 = v171 != v172;
      v164 = v164;
      v165 = v165;
      if (!v173) break;
      int v174 = v164 + v165;
      int v175 = 1;
      int v176 = v165 + v175;
      v164 = v174;
      v165 = v176;
    }
    bool v177 = true;
    v137 = v164;
  }
  int v178 = 32;
  int v179 = v178 + v68;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v66[v179] = v181;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 84; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
