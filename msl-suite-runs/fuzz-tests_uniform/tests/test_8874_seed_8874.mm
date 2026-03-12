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
  int v5 = v3 % v4;
  int v6 = 2;
  int v7 = v0 + v6;
  int v8;
  v8 = v7;
  switch (v5) {
    default:
      {
      int v9 = 2;
      int v10 = v3 % v9;
      int v11;
      v11 = v0;
      switch (v10) {
        case 0:
          {
          int v12 = 4;
          int v13 = v3 % v12;
          int v14;
          v14 = v0;
          switch (v13) {
            case 0:
              {
              v14 = v0;
              break;
            }
            case 1:
              {
              v14 = v0;
              break;
            }
            case 2:
              {
              v14 = v0;
              break;
            }
            default:
              {
              int v15 = 2;
              v14 = v15;
              break;
            }
          }
          int v16 = 0;
          int v17 = v0 + v16;
          v11 = v14;
          break;
        }
        case 1:
          {
          int v18 = 2;
          int v19 = v3 % v18;
          int v20 = 0;
          int v21 = v0 + v20;
          int v22;
          v22 = v21;
          switch (v19) {
            default:
              {
              int v23 = 0;
              v22 = v23;
              break;
            }
            case 0:
              {
              int v24 = 4;
              int v25 = v0 + v24;
              v22 = v25;
              break;
            }
            case 1:
              {
              int v26 = 0;
              v22 = v26;
              break;
            }
          }
          int v27 = 2;
          int v28 = v0 + v27;
          v11 = v22;
          break;
        }
        default:
          {
          int v29 = 2;
          int v30 = v3 % v29;
          int v31 = 1;
          int v32;
          v32 = v31;
          switch (v30) {
            case 0:
              {
              int v33 = 0;
              v32 = v33;
              break;
            }
            case 1:
              {
              int v34 = 2;
              v32 = v34;
              break;
            }
            default:
              {
              v32 = v0;
              break;
            }
          }
          v11 = v32;
          break;
        }
      }
      v8 = v11;
    }
    case 0:
      {
      int v35 = 0;
      bool v36 = v2 != v35;
      int v37;
      if (v36) {
        int v38 = 0;
        int v39 = 0;
        int v40;
        int v41;
        v40 = v38;
        v41 = v39;
        while (true) {
          int v42 = 4;
          int v43 = v3 % v42;
          int v44 = 1;
          int v45 = v43 + v44;
          bool v46 = v41 < v45;
          v40 = v40;
          v41 = v41;
          if (!v46) break;
          int v47 = 1;
          int v48 = v41 + v47;
          v40 = v0;
          v41 = v48;
        }
        v37 = v40;
      } else {
        int v49 = 0;
        bool v50 = v2 != v49;
        int v51;
        if (v50) {
          v51 = v0;
        } else {
          int v52 = 3;
          int v53 = v0 + v52;
          v51 = v53;
        }
        int v54 = 0;
        int v55 = v0 + v54;
        v37 = v51;
      }
      int v56 = 2;
      int v57 = v0 + v56;
      v8 = v37;
    }
    case 1:
      {
      int v58 = 3;
      int v59 = v3 % v58;
      int v60 = 0;
      int v61;
      v61 = v60;
      switch (v59) {
        case 0:
          {
          int v62 = 0;
          int v63 = 0;
          int v64;
          int v65;
          v64 = v62;
          v65 = v63;
          while (true) {
            int v66 = 4;
            int v67 = v3 % v66;
            int v68 = 1;
            int v69 = v67 + v68;
            bool v70 = v65 < v69;
            v64 = v64;
            v65 = v65;
            if (!v70) break;
            int v71 = 1;
            int v72 = v65 + v71;
            v64 = v0;
            v65 = v72;
          }
          v61 = v64;
          break;
        }
        case 1:
          {
          int v73 = 3;
          v61 = v73;
          break;
        }
        default:
          {
          int v74 = 0;
          int v75 = 0;
          int v76;
          int v77;
          v76 = v74;
          v77 = v75;
          while (true) {
            int v78 = 4;
            int v79 = v3 % v78;
            int v80 = 1;
            int v81 = v79 + v80;
            bool v82 = v77 < v81;
            v76 = v76;
            v77 = v77;
            if (!v82) break;
            int v83 = 1;
            int v84 = 1;
            int v85 = v77 + v84;
            v76 = v83;
            v77 = v85;
          }
          int v86 = 4;
          v61 = v76;
          break;
        }
      }
      int v87 = 0;
      int v88 = v0 + v87;
      v8 = v61;
      break;
    }
    case 2:
      {
      int v89 = 0;
      int v90 = 0;
      int v91;
      int v92;
      v91 = v89;
      v92 = v90;
      while (true) {
        int v93 = 4;
        int v94 = v3 % v93;
        int v95 = 1;
        int v96 = v94 + v95;
        bool v97 = v92 < v96;
        v91 = v91;
        v92 = v92;
        if (!v97) break;
        int v98 = 1;
        int v99 = v92 + v98;
        v91 = v0;
        v92 = v99;
      }
      int v100 = 4;
      int v101 = v0 + v100;
      v8 = v91;
      break;
    }
  }
  bool v102 = true;
  int v103 = simt_wave_count_bits(v102);
  int v104 = 0;
  int v105 = v104 + v0;
  v1[v105] = v103;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  int v115 = 8;
  int v116 = v115 + v108;
  int v117 = v107[v116];
  int v118 = 0;
  bool v119 = v117 != v118;
  int v120;
  if (v119) {
    int v121 = 12;
    int v122 = v121 + v108;
    int v123 = v107[v122];
    int v124 = 0;
    bool v125 = v123 != v124;
    int v126;
    if (v125) {
      int v127 = 2;
      int v128 = v108 + v127;
      v126 = v128;
    } else {
      int v129 = 16;
      int v130 = v129 + v108;
      int v131 = v107[v130];
      int v132 = 0;
      int v133;
      v133 = v132;
      switch (v131) {
        default:
          {
          v133 = v108;
          break;
        }
        case 0:
          {
          int v134 = 0;
          v133 = v134;
        }
        case 1:
          {
          v133 = v108;
          break;
        }
      }
      bool v135 = true;
      v126 = v133;
    }
    v120 = v126;
  } else {
    int v136 = 20;
    int v137 = v136 + v108;
    int v138 = v107[v137];
    uint v139 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v140 = (int)(v139);
    int v141;
    v141 = v140;
    switch (v138) {
      default:
        {
        int v142 = 24;
        int v143 = v142 + v108;
        int v144 = v107[v143];
        int v145;
        v145 = v108;
        switch (v144) {
          case 0:
            {
            int v146 = 3;
            int v147 = v108 + v146;
            v145 = v147;
            break;
          }
          default:
            {
            int v148 = 0;
            int v149 = v108 + v148;
            v145 = v149;
            break;
          }
        }
        bool v150 = true;
        v141 = v145;
      }
      case 0:
        {
        int v151 = 28;
        int v152 = v151 + v108;
        int v153 = v107[v152];
        int v154 = 0;
        bool v155 = v153 != v154;
        int v156;
        if (v155) {
          int v157 = 3;
          int v158 = v108 + v157;
          v156 = v158;
        } else {
          v156 = v108;
        }
        v141 = v156;
        break;
      }
      case 1:
        {
        int v159 = 32;
        int v160 = v159 + v108;
        int v161 = v107[v160];
        int v162 = 1;
        int v163;
        v163 = v162;
        switch (v161) {
          default:
            {
            int v164 = 2;
            v163 = v164;
            break;
          }
          case 0:
            {
            int v165 = 2;
            int v166 = v108 + v165;
            v163 = v166;
            break;
          }
        }
        bool v167 = true;
        v141 = v163;
      }
      case 2:
        {
        int v168 = 36;
        int v169 = v168 + v108;
        int v170 = v107[v169];
        int v171 = 0;
        int v172 = v108 + v171;
        int v173;
        v173 = v172;
        switch (v170) {
          case 0:
            {
            int v174 = 1;
            v173 = v174;
            break;
          }
          case 1:
            {
            v173 = v108;
          }
          default:
            {
            v173 = v108;
            break;
          }
          case 2:
            {
            v173 = v108;
            break;
          }
        }
        bool v175 = true;
        v141 = v173;
        break;
      }
    }
    bool v176 = true;
    v120 = v141;
  }
  int v177 = 16;
  int v178 = v177 + v108;
  bool v179 = true;
  int v180 = simt_wave_count_bits(v179);
  v106[v178] = v180;
  uint v181 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v182 = (int)(v181);
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 40; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
