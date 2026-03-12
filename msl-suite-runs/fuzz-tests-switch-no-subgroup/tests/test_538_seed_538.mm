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
  bool v4 = true;
  int v5 = simt_wave_count_bits(v4);
  int v6 = 0;
  int v7 = v6 + v0;
  v1[v7] = v5;
  int v8 = 2;
  int v9 = v3 % v8;
  int v10 = 3;
  int v11;
  v11 = v10;
  switch (v9) {
    case 0:
      {
      int v12 = 0;
      bool v13 = v2 != v12;
      int v14;
      if (v13) {
        int v15 = 3;
        int v16 = v3 % v15;
        int v17 = 2;
        int v18;
        v18 = v17;
        switch (v16) {
          case 0:
            {
            int v19 = 2;
            int v20 = v0 + v19;
            v18 = v20;
          }
          default:
            {
            int v21 = 0;
            int v22 = v0 + v21;
            v18 = v22;
          }
          case 1:
            {
            v18 = v0;
            break;
          }
          case 2:
            {
            int v23 = 4;
            v18 = v23;
            break;
          }
        }
        int v24 = 0;
        int v25 = v0 + v24;
        v14 = v18;
      } else {
        int v26 = 0;
        bool v27 = v2 != v26;
        int v28;
        if (v27) {
          int v29 = 0;
          v28 = v29;
        } else {
          int v30 = 3;
          int v31 = v0 + v30;
          v28 = v31;
        }
        v14 = v28;
      }
      v11 = v14;
      break;
    }
    case 1:
      {
      v11 = v0;
      break;
    }
    default:
      {
      int v32 = 3;
      int v33 = v3 % v32;
      int v34 = 3;
      int v35;
      v35 = v34;
      switch (v33) {
        case 0:
          {
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
            int v45 = 0;
            int v46 = 1;
            int v47 = v39 + v46;
            v38 = v45;
            v39 = v47;
          }
          v35 = v38;
          break;
        }
        default:
          {
          int v48 = 0;
          int v49 = v0 + v48;
          v35 = v49;
          break;
        }
        case 1:
          {
          int v50 = 0;
          int v51 = 0;
          int v52;
          int v53;
          v52 = v50;
          v53 = v51;
          while (true) {
            int v54 = 4;
            int v55 = v3 % v54;
            int v56 = 1;
            int v57 = v55 + v56;
            bool v58 = v53 < v57;
            v52 = v52;
            v53 = v53;
            if (!v58) break;
            int v59 = 1;
            int v60 = v53 + v59;
            v52 = v0;
            v53 = v60;
          }
          v35 = v52;
        }
        case 2:
          {
          int v61 = 4;
          int v62 = v3 % v61;
          int v63 = 1;
          int v64;
          v64 = v63;
          switch (v62) {
            case 0:
              {
              v64 = v0;
            }
            default:
              {
              v64 = v0;
            }
            case 1:
              {
              int v65 = 0;
              int v66 = v0 + v65;
              v64 = v66;
            }
            case 2:
              {
              v64 = v0;
              break;
            }
          }
          int v67 = 4;
          int v68 = v0 + v67;
          v35 = v64;
          break;
        }
      }
      int v69 = 2;
      v11 = v35;
      break;
    }
  }
  bool v70 = true;
  int v71 = simt_wave_count_bits(v70);
  int v72 = 16;
  int v73 = v72 + v0;
  v1[v73] = v71;
  int v74 = 0;
  bool v75 = v2 != v74;
  int v76 = v75 ? v5 : v11;
  return;
}

kernel void kernel_main(device int* v77 [[buffer(0)]], device int* v78 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v79 = static_cast<int>(__simt_tid3.x);
  int v80 = 0;
  int v81 = v80 + v79;
  int v82 = v78[v81];
  int v83 = 4;
  int v84 = v83 + v79;
  int v85 = v78[v84];
  int v86 = 0;
  bool v87 = v82 != v86;
  if (v87) {
    int v88 = 0;
    int v89 = 0;
    int v90;
    int v91;
    v90 = v88;
    v91 = v89;
    while (true) {
      int v92 = 1;
      bool v93 = v91 < v92;
      v90 = v90;
      v91 = v91;
      if (!v93) break;
      int v94 = 3;
      int v95 = v79 % v94;
      int v96;
      v96 = v79;
      switch (v95) {
        case 0:
          {
          int v97 = 1;
          int v98 = v96 + v97;
          v96 = v98;
          break;
        }
        case 1:
          {
          int v99 = 4;
          int v100 = v96 + v99;
          v96 = v100;
          break;
        }
        default:
          {
          int v101 = 3;
          int v102 = v96 + v101;
          v96 = v102;
          break;
        }
      }
      helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
      int v103 = 1;
      int v104 = v91 + v103;
      v90 = v90;
      v91 = v104;
    }
  } else {
  }
  int v105 = 8;
  int v106 = v105 + v79;
  int v107 = v78[v106];
  int v108 = 4;
  int v109;
  v109 = v108;
  switch (v107) {
    default:
      {
      int v110 = 12;
      int v111 = v110 + v79;
      int v112 = v78[v111];
      int v113;
      v113 = v79;
      switch (v112) {
        default:
          {
          int v114 = 16;
          int v115 = v114 + v79;
          int v116 = v78[v115];
          int v117 = 2;
          int v118 = v79 + v117;
          int v119;
          v119 = v118;
          switch (v116) {
            case 0:
              {
              v119 = v79;
              break;
            }
            default:
              {
              int v120 = 0;
              v119 = v120;
              break;
            }
            case 1:
              {
              int v121 = 1;
              int v122 = v79 + v121;
              v119 = v122;
              break;
            }
            case 2:
              {
              v119 = v79;
              break;
            }
          }
          v113 = v119;
          break;
        }
        case 0:
          {
          int v123 = 20;
          int v124 = v123 + v79;
          int v125 = v78[v124];
          int v126 = 0;
          bool v127 = v125 != v126;
          int v128;
          if (v127) {
            v128 = v79;
          } else {
            int v129 = 4;
            int v130 = v79 + v129;
            v128 = v130;
          }
          v113 = v128;
          break;
        }
      }
      v109 = v113;
      break;
    }
    case 0:
      {
      int v131 = 24;
      int v132 = v131 + v79;
      int v133 = v78[v132];
      int v134 = 0;
      int v135;
      v135 = v134;
      switch (v133) {
        default:
          {
          v135 = v79;
        }
        case 0:
          {
          int v136 = 0;
          int v137 = 0;
          int v138;
          int v139;
          v138 = v136;
          v139 = v137;
          while (true) {
            int v140 = 4;
            int v141 = v139 * v140;
            int v142 = v141 + v79;
            int v143 = 28;
            int v144 = v143 + v142;
            int v145 = v78[v144];
            int v146 = 0;
            bool v147 = v145 != v146;
            v138 = v138;
            v139 = v139;
            if (!v147) break;
            int v148 = v138 + v139;
            int v149 = 1;
            int v150 = v139 + v149;
            bool v151 = true;
            v138 = v148;
            v139 = v150;
          }
          v135 = v138;
          break;
        }
        case 1:
          {
          int v152 = 0;
          int v153 = 0;
          int v154;
          int v155;
          v154 = v152;
          v155 = v153;
          while (true) {
            int v156 = 4;
            int v157 = v155 * v156;
            int v158 = v157 + v79;
            int v159 = 48;
            int v160 = v159 + v158;
            int v161 = v78[v160];
            int v162 = 0;
            bool v163 = v161 != v162;
            v154 = v154;
            v155 = v155;
            if (!v163) break;
            int v164 = v154 + v155;
            int v165 = 1;
            int v166 = v155 + v165;
            bool v167 = true;
            v154 = v164;
            v155 = v166;
          }
          v135 = v154;
          break;
        }
      }
      v109 = v135;
      break;
    }
    case 1:
      {
      int v168 = 1;
      int v169 = v79 + v168;
      v109 = v169;
      break;
    }
  }
  int v170 = 1;
  int v171 = v79 + v170;
  uint v172 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v173 = (int)(v172);
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 19; ++idx) {
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
