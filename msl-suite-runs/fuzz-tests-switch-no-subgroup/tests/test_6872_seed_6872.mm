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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 0;
      int v10 = v0 + v9;
      v8 = v10;
      break;
    }
    default:
      {
      int v11 = 0;
      bool v12 = v2 != v11;
      int v13;
      if (v12) {
        int v14 = 0;
        bool v15 = v2 != v14;
        int v16;
        if (v15) {
          int v17 = 0;
          v16 = v17;
        } else {
          v16 = v0;
        }
        v13 = v16;
      } else {
        int v18 = 2;
        int v19 = v3 % v18;
        int v20 = 2;
        int v21 = v0 + v20;
        int v22;
        v22 = v21;
        switch (v19) {
          case 0:
            {
            int v23 = 0;
            int v24 = v0 + v23;
            v22 = v24;
            break;
          }
          default:
            {
            int v25 = 4;
            v22 = v25;
            break;
          }
        }
        v13 = v22;
      }
      v8 = v13;
    }
    case 1:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 0;
        int v30 = v0 + v29;
        int v31;
        v31 = v30;
        switch (v3) {
          default:
            {
            v31 = v0;
          }
          case 0:
            {
            int v32 = 1;
            int v33 = v0 + v32;
            v31 = v33;
            break;
          }
        }
        int v34 = 2;
        v28 = v31;
      } else {
        int v35 = 0;
        bool v36 = v2 != v35;
        int v37;
        if (v36) {
          v37 = v0;
        } else {
          int v38 = 1;
          v37 = v38;
        }
        v28 = v37;
      }
      v8 = v28;
      break;
    }
    case 2:
      {
      int v39 = 2;
      int v40 = v3 % v39;
      int v41 = 2;
      int v42 = v0 + v41;
      int v43;
      v43 = v42;
      switch (v40) {
        case 0:
          {
          int v44 = 0;
          int v45 = 0;
          int v46;
          int v47;
          v46 = v44;
          v47 = v45;
          while (true) {
            int v48 = 4;
            int v49 = v3 % v48;
            int v50 = 1;
            int v51 = v49 + v50;
            bool v52 = v47 < v51;
            v46 = v46;
            v47 = v47;
            if (!v52) break;
            int v53 = 1;
            int v54 = v47 + v53;
            v46 = v0;
            v47 = v54;
          }
          v43 = v46;
          break;
        }
        case 1:
          {
          int v55 = 4;
          int v56 = v3 % v55;
          int v57 = 2;
          int v58;
          v58 = v57;
          switch (v56) {
            default:
              {
              int v59 = 2;
              v58 = v59;
              break;
            }
            case 0:
              {
              int v60 = 4;
              v58 = v60;
              break;
            }
            case 1:
              {
              v58 = v0;
              break;
            }
            case 2:
              {
              int v61 = 4;
              v58 = v61;
              break;
            }
          }
          v43 = v58;
          break;
        }
        default:
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
            int v71 = 3;
            int v72 = 1;
            int v73 = v65 + v72;
            v64 = v71;
            v65 = v73;
            continue;
            ;
          }
          v43 = v64;
          break;
        }
      }
      v8 = v43;
      break;
    }
  }
  bool v74 = true;
  int v75 = simt_wave_count_bits(v74);
  int v76 = 0;
  int v77 = v76 + v0;
  v1[v77] = v75;
  return;
}

kernel void kernel_main(device int* v78 [[buffer(0)]], device int* v79 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v80 = static_cast<int>(__simt_tid3.x);
  int v81 = 0;
  int v82 = v81 + v80;
  int v83 = v79[v82];
  int v84 = 4;
  int v85 = v84 + v80;
  int v86 = v79[v85];
  int v87 = 0;
  bool v88 = v83 != v87;
  if (v88) {
  } else {
    int v89 = 0;
    int v90 = 0;
    int v91;
    int v92;
    v91 = v89;
    v92 = v90;
    while (true) {
      int v93 = 1;
      bool v94 = v92 < v93;
      v91 = v91;
      v92 = v92;
      if (!v94) break;
      helper0(v80, v78, v83, v86, static_cast<int>(__simt_tid3.x));
      int v95 = 1;
      int v96 = v92 + v95;
      v91 = v91;
      v92 = v96;
    }
  }
  int v97 = 8;
  int v98 = v97 + v80;
  int v99 = v79[v98];
  int v100 = 2;
  int v101;
  v101 = v100;
  switch (v99) {
    case 0:
      {
      int v102 = 12;
      int v103 = v102 + v80;
      int v104 = v79[v103];
      int v105 = 2;
      int v106 = v80 + v105;
      int v107;
      v107 = v106;
      switch (v104) {
        case 0:
          {
          int v108 = 16;
          int v109 = v108 + v80;
          int v110 = v79[v109];
          int v111 = 4;
          int v112;
          v112 = v111;
          switch (v110) {
            case 0:
              {
              int v113 = 2;
              v112 = v113;
              break;
            }
            default:
              {
              int v114 = 0;
              int v115 = v80 + v114;
              v112 = v115;
              break;
            }
          }
          bool v116 = true;
          v107 = v112;
          break;
        }
        default:
          {
          int v117 = 20;
          int v118 = v117 + v80;
          int v119 = v79[v118];
          int v120;
          v120 = v80;
          switch (v119) {
            case 0:
              {
              int v121 = 3;
              v120 = v121;
              break;
            }
            default:
              {
              int v122 = 1;
              v120 = v122;
              break;
            }
            case 1:
              {
              v120 = v80;
              break;
            }
            case 2:
              {
              int v123 = 3;
              v120 = v123;
              break;
            }
          }
          bool v124 = true;
          v107 = v120;
          break;
        }
      }
      v101 = v107;
      break;
    }
    case 1:
      {
      int v125 = 24;
      int v126 = v125 + v80;
      int v127 = v79[v126];
      int v128 = 0;
      bool v129 = v127 != v128;
      int v130;
      if (v129) {
        int v131 = 28;
        int v132 = v131 + v80;
        int v133 = v79[v132];
        int v134;
        v134 = v80;
        switch (v133) {
          case 0:
            {
            int v135 = 4;
            int v136 = v80 + v135;
            v134 = v136;
            break;
          }
          case 1:
            {
            int v137 = 1;
            v134 = v137;
          }
          case 2:
            {
            v134 = v80;
            break;
          }
          default:
            {
            int v138 = 3;
            int v139 = v80 + v138;
            v134 = v139;
            break;
          }
        }
        bool v140 = true;
        v130 = v134;
      } else {
        int v141 = 32;
        int v142 = v141 + v80;
        int v143 = v79[v142];
        int v144 = 0;
        bool v145 = v143 != v144;
        int v146;
        if (v145) {
          v146 = v80;
        } else {
          int v147 = 3;
          int v148 = v80 + v147;
          v146 = v148;
        }
        v130 = v146;
      }
      v101 = v130;
      break;
    }
    default:
      {
      int v149 = 36;
      int v150 = v149 + v80;
      int v151 = v79[v150];
      int v152 = 0;
      bool v153 = v151 != v152;
      int v154;
      if (v153) {
        int v155 = 40;
        int v156 = v155 + v80;
        int v157 = v79[v156];
        int v158;
        v158 = v80;
        switch (v157) {
          case 0:
            {
            int v159 = 1;
            int v160 = v80 + v159;
            v158 = v160;
            break;
          }
          case 1:
            {
            int v161 = 2;
            int v162 = v80 + v161;
            v158 = v162;
            break;
          }
          default:
            {
            int v163 = 3;
            int v164 = v80 + v163;
            v158 = v164;
            break;
          }
          case 2:
            {
            int v165 = 0;
            int v166 = v80 + v165;
            v158 = v166;
            break;
          }
        }
        v154 = v158;
      } else {
        int v167 = 44;
        int v168 = v167 + v80;
        int v169 = v79[v168];
        int v170 = 0;
        bool v171 = v169 != v170;
        int v172;
        if (v171) {
          int v173 = 0;
          int v174 = v80 + v173;
          v172 = v174;
        } else {
          v172 = v80;
        }
        v154 = v172;
      }
      v101 = v154;
      break;
    }
  }
  uint v175 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v176 = (int)(v175);
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
