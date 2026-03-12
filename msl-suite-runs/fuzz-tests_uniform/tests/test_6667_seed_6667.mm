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
    uint v9 = simt_lane_id(__simt_tid);
    int v10 = (int)(v9);
    int v11;
    v11 = v10;
    switch (v8) {
      case 0:
        {
        int v12 = 0;
        bool v13 = v2 != v12;
        int v14;
        if (v13) {
          v14 = v0;
        } else {
          v14 = v0;
        }
        int v15 = 4;
        int v16 = v0 + v15;
        v11 = v14;
        break;
      }
      default:
        {
        int v17 = 4;
        int v18 = v3 % v17;
        int v19;
        v19 = v0;
        switch (v18) {
          case 0:
            {
            int v20 = 2;
            v19 = v20;
          }
          case 1:
            {
            v19 = v0;
            break;
          }
          case 2:
            {
            int v21 = 3;
            v19 = v21;
            break;
          }
          default:
            {
            v19 = v0;
            break;
          }
        }
        int v22 = 0;
        int v23 = v0 + v22;
        v11 = v19;
        break;
      }
      case 1:
        {
        int v24 = 2;
        int v25 = v3 % v24;
        int v26 = 2;
        int v27;
        v27 = v26;
        switch (v25) {
          case 0:
            {
            int v28 = 3;
            int v29 = v0 + v28;
            v27 = v29;
            break;
          }
          default:
            {
            int v30 = 4;
            v27 = v30;
            break;
          }
        }
        int v31 = 1;
        v11 = v27;
      }
      case 2:
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
          int v41 = 3;
          int v42 = 1;
          int v43 = v35 + v42;
          v34 = v41;
          v35 = v43;
          continue;
          ;
        }
        int v44 = 2;
        int v45 = v0 + v44;
        v11 = v34;
        break;
      }
    }
    uint v46 = simt_subgroup_id(__simt_tid);
    int v47 = (int)(v46);
    v6 = v11;
  } else {
    int v48 = 0;
    bool v49 = v2 != v48;
    int v50;
    if (v49) {
      int v51 = 3;
      int v52 = v3 % v51;
      uint v53 = simt_lane_id(__simt_tid);
      int v54 = (int)(v53);
      int v55;
      v55 = v54;
      switch (v52) {
        case 0:
          {
          v55 = v0;
        }
        default:
          {
          int v56 = 0;
          int v57 = v0 + v56;
          v55 = v57;
          break;
        }
        case 1:
          {
          int v58 = 4;
          v55 = v58;
          break;
        }
        case 2:
          {
          int v59 = 1;
          v55 = v59;
          break;
        }
      }
      uint v60 = simt_subgroup_id(__simt_tid);
      int v61 = (int)(v60);
      v50 = v55;
    } else {
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
      int v73 = 4;
      v50 = v64;
    }
    uint v74 = simt_subgroup_id(__simt_tid);
    int v75 = (int)(v74);
    v6 = v50;
  }
  bool v76 = true;
  int v77 = simt_wave_count_bits(v76);
  int v78 = 0;
  int v79 = v78 + v0;
  v1[v79] = v77;
  return;
}

kernel void kernel_main(device int* v80 [[buffer(0)]], device int* v81 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v82 = static_cast<int>(__simt_tid3.x);
  int v83 = 0;
  int v84 = v83 + v82;
  int v85 = v81[v84];
  int v86 = 4;
  int v87 = v86 + v82;
  int v88 = v81[v87];
  helper0(v82, v80, v85, v88, static_cast<int>(__simt_tid3.x));
  int v89 = 8;
  int v90 = v89 + v82;
  int v91 = v81[v90];
  uint v92 = simt_lane_id(static_cast<int>(__simt_tid3.x));
  int v93 = (int)(v92);
  int v94;
  v94 = v93;
  switch (v91) {
    case 0:
      {
      int v95 = 3;
      v94 = v95;
      break;
    }
    case 1:
      {
      int v96 = 12;
      int v97 = v96 + v82;
      int v98 = v81[v97];
      int v99;
      v99 = v82;
      switch (v98) {
        case 0:
          {
          int v100 = 16;
          int v101 = v100 + v82;
          int v102 = v81[v101];
          int v103 = 1;
          int v104 = v82 + v103;
          int v105;
          v105 = v104;
          switch (v102) {
            case 0:
              {
              int v106 = 1;
              int v107 = v82 + v106;
              v105 = v107;
              break;
            }
            case 1:
              {
              int v108 = 3;
              int v109 = v82 + v108;
              v105 = v109;
              break;
            }
            default:
              {
              int v110 = 4;
              v105 = v110;
              break;
            }
          }
          bool v111 = true;
          v99 = v105;
          break;
        }
        default:
          {
          int v112 = 20;
          int v113 = v112 + v82;
          int v114 = v81[v113];
          int v115 = 0;
          bool v116 = v114 != v115;
          int v117;
          if (v116) {
            int v118 = 1;
            int v119 = v82 + v118;
            v117 = v119;
          } else {
            int v120 = 2;
            int v121 = v82 + v120;
            v117 = v121;
          }
          v99 = v117;
          break;
        }
      }
      bool v122 = true;
      v94 = v99;
      break;
    }
    default:
      {
      int v123 = 24;
      int v124 = v123 + v82;
      int v125 = v81[v124];
      int v126 = 0;
      bool v127 = v125 != v126;
      int v128;
      if (v127) {
        int v129 = 28;
        int v130 = v129 + v82;
        int v131 = v81[v130];
        int v132 = 0;
        bool v133 = v131 != v132;
        int v134;
        if (v133) {
          int v135 = 0;
          v134 = v135;
        } else {
          int v136 = 1;
          v134 = v136;
        }
        v128 = v134;
      } else {
        int v137 = 32;
        int v138 = v137 + v82;
        int v139 = v81[v138];
        int v140;
        v140 = v82;
        switch (v139) {
          default:
            {
            int v141 = 1;
            int v142 = v82 + v141;
            v140 = v142;
            break;
          }
          case 0:
            {
            int v143 = 4;
            int v144 = v82 + v143;
            v140 = v144;
            break;
          }
          case 1:
            {
            int v145 = 0;
            v140 = v145;
            break;
          }
        }
        bool v146 = true;
        v128 = v140;
      }
      v94 = v128;
      break;
    }
    case 2:
      {
      int v147 = 36;
      int v148 = v147 + v82;
      int v149 = v81[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 40;
        int v154 = v153 + v82;
        int v155 = v81[v154];
        int v156 = 0;
        bool v157 = v155 != v156;
        int v158;
        if (v157) {
          int v159 = 4;
          int v160 = v82 + v159;
          v158 = v160;
        } else {
          v158 = v82;
        }
        v152 = v158;
      } else {
        int v161 = 44;
        int v162 = v161 + v82;
        int v163 = v81[v162];
        int v164 = 4;
        int v165 = v82 + v164;
        int v166;
        v166 = v165;
        switch (v163) {
          case 0:
            {
            int v167 = 3;
            v166 = v167;
          }
          default:
            {
            int v168 = 1;
            v166 = v168;
            break;
          }
        }
        bool v169 = true;
        v152 = v166;
      }
      v94 = v152;
      break;
    }
  }
  bool v170 = true;
  int v171 = 16;
  int v172 = v171 + v82;
  bool v173 = true;
  int v174 = simt_wave_count_bits(v173);
  v80[v172] = v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
