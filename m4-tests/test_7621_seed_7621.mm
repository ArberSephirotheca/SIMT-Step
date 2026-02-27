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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      v6 = v0;
    }
    case 1:
      {
      int v7 = 0;
      bool v8 = v2 != v7;
      int v9;
      if (v8) {
        int v10 = 4;
        int v11 = v3 % v10;
        int v12 = 3;
        int v13 = v0 + v12;
        int v14;
        v14 = v13;
        switch (v11) {
          case 0:
            {
            v14 = v0;
          }
          case 1:
            {
            int v15 = 1;
            v14 = v15;
            break;
          }
          case 2:
            {
            v14 = v0;
          }
          default:
            {
            int v16 = 4;
            v14 = v16;
            break;
          }
        }
        v9 = v14;
      } else {
        int v17 = 0;
        bool v18 = v2 != v17;
        int v19;
        if (v18) {
          int v20 = 0;
          int v21 = v0 + v20;
          v19 = v21;
        } else {
          int v22 = 4;
          int v23 = v0 + v22;
          v19 = v23;
        }
        v9 = v19;
      }
      v6 = v9;
      break;
    }
    case 2:
      {
      v6 = v0;
    }
    default:
      {
      int v24 = 0;
      bool v25 = v2 != v24;
      int v26;
      if (v25) {
        int v27 = 1;
        int v28;
        v28 = v27;
        switch (v3) {
          case 0:
            {
            int v29 = 0;
            v28 = v29;
          }
          default:
            {
            v28 = v0;
            break;
          }
        }
        v26 = v28;
      } else {
        int v30 = 2;
        int v31 = v3 % v30;
        int v32;
        v32 = v0;
        switch (v31) {
          case 0:
            {
            int v33 = 1;
            int v34 = v0 + v33;
            v32 = v34;
            break;
          }
          default:
            {
            int v35 = 0;
            v32 = v35;
            break;
          }
          case 1:
            {
            int v36 = 2;
            int v37 = v0 + v36;
            v32 = v37;
            break;
          }
        }
        v26 = v32;
      }
      v6 = v26;
      break;
    }
  }
  bool v38 = true;
  int v39 = simt_wave_count_bits(v38);
  int v40 = 0;
  int v41 = v40 + v0;
  v1[v41] = v39;
  return;
}

kernel void kernel_main(device int* v42 [[buffer(0)]], device int* v43 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v44 = static_cast<int>(__simt_tid3.x);
  int v45 = 0;
  int v46 = v45 + v44;
  int v47 = v43[v46];
  int v48 = 4;
  int v49 = v48 + v44;
  int v50 = v43[v49];
  int v51 = 0;
  bool v52 = v47 != v51;
  if (v52) {
    int v53 = 0;
    int v54 = 0;
    int v55;
    int v56;
    v55 = v53;
    v56 = v54;
    while (true) {
      int v57 = 1;
      bool v58 = v56 < v57;
      v55 = v55;
      v56 = v56;
      if (!v58) break;
      helper0(v44, v42, v47, v50, static_cast<int>(__simt_tid3.x));
      int v59 = 1;
      int v60 = v56 + v59;
      v55 = v55;
      v56 = v60;
    }
  } else {
  }
  int v61 = 8;
  int v62 = v61 + v44;
  int v63 = v43[v62];
  uint v64 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v65 = (int)(v64);
  int v66;
  v66 = v65;
  switch (v63) {
    case 0:
      {
      int v67 = 0;
      int v68 = 0;
      int v69;
      int v70;
      v69 = v67;
      v70 = v68;
      while (true) {
        int v71 = 4;
        int v72 = v70 * v71;
        int v73 = v72 + v44;
        int v74 = 12;
        int v75 = v74 + v73;
        int v76 = v43[v75];
        int v77 = 0;
        bool v78 = v76 != v77;
        v69 = v69;
        v70 = v70;
        if (!v78) break;
        int v79 = v69 + v70;
        int v80 = 1;
        int v81 = v70 + v80;
        bool v82 = true;
        v69 = v79;
        v70 = v81;
      }
      v66 = v69;
      break;
    }
    default:
      {
      int v83 = 32;
      int v84 = v83 + v44;
      int v85 = v43[v84];
      int v86 = 4;
      int v87 = v44 + v86;
      int v88;
      v88 = v87;
      switch (v85) {
        case 0:
          {
          int v89 = 36;
          int v90 = v89 + v44;
          int v91 = v43[v90];
          int v92 = 4;
          int v93;
          v93 = v92;
          switch (v91) {
            default:
              {
              int v94 = 2;
              int v95 = v44 + v94;
              v93 = v95;
              break;
            }
            case 0:
              {
              int v96 = 3;
              v93 = v96;
              break;
            }
          }
          v88 = v93;
          break;
        }
        default:
          {
          int v97 = 40;
          int v98 = v97 + v44;
          int v99 = v43[v98];
          int v100;
          v100 = v44;
          switch (v99) {
            default:
              {
              int v101 = 3;
              v100 = v101;
              break;
            }
            case 0:
              {
              v100 = v44;
              break;
            }
            case 1:
              {
              int v102 = 1;
              v100 = v102;
              break;
            }
          }
          bool v103 = true;
          v88 = v100;
          break;
        }
        case 1:
          {
          int v104 = 44;
          int v105 = v104 + v44;
          int v106 = v43[v105];
          int v107;
          v107 = v44;
          switch (v106) {
            default:
              {
              v107 = v44;
              break;
            }
            case 0:
              {
              int v108 = 4;
              v107 = v108;
              break;
            }
          }
          bool v109 = true;
          v88 = v107;
          break;
        }
      }
      bool v110 = true;
      v66 = v88;
      break;
    }
  }
  int v111 = 48;
  int v112 = v111 + v44;
  int v113 = v43[v112];
  int v114;
  v114 = v44;
  switch (v113) {
    default:
      {
      int v115 = 52;
      int v116 = v115 + v44;
      int v117 = v43[v116];
      int v118 = 0;
      bool v119 = v117 != v118;
      int v120;
      if (v119) {
        int v121 = 56;
        int v122 = v121 + v44;
        int v123 = v43[v122];
        int v124 = 2;
        int v125 = v44 + v124;
        int v126;
        v126 = v125;
        switch (v123) {
          case 0:
            {
            v126 = v44;
            break;
          }
          default:
            {
            int v127 = 2;
            v126 = v127;
            break;
          }
        }
        bool v128 = true;
        v120 = v126;
      } else {
        int v129 = 4;
        int v130 = v44 + v129;
        v120 = v130;
      }
      v114 = v120;
      break;
    }
    case 0:
      {
      v114 = v44;
      break;
    }
    case 1:
      {
      int v131 = 60;
      int v132 = v131 + v44;
      int v133 = v43[v132];
      int v134 = 2;
      int v135;
      v135 = v134;
      switch (v133) {
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
            int v142 = v141 + v44;
            int v143 = 64;
            int v144 = v143 + v142;
            int v145 = v43[v144];
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
            continue;
            ;
          }
          v135 = v138;
          break;
        }
        case 1:
          {
          int v152 = 84;
          int v153 = v152 + v44;
          int v154 = v43[v153];
          int v155 = 0;
          bool v156 = v154 != v155;
          int v157;
          if (v156) {
            v157 = v44;
          } else {
            v157 = v44;
          }
          v135 = v157;
        }
        default:
          {
          int v158 = 88;
          int v159 = v158 + v44;
          int v160 = v43[v159];
          int v161;
          v161 = v44;
          switch (v160) {
            default:
              {
              int v162 = 4;
              v161 = v162;
              break;
            }
            case 0:
              {
              v161 = v44;
              break;
            }
          }
          v135 = v161;
        }
        case 2:
          {
          int v163 = 92;
          int v164 = v163 + v44;
          int v165 = v43[v164];
          int v166;
          v166 = v44;
          switch (v165) {
            default:
              {
              int v167 = 4;
              v166 = v167;
              break;
            }
            case 0:
              {
              int v168 = 3;
              int v169 = v44 + v168;
              v166 = v169;
              break;
            }
          }
          v135 = v166;
          break;
        }
      }
      bool v170 = true;
      v114 = v135;
    }
    case 2:
      {
      int v171 = 4;
      int v172 = v44 + v171;
      v114 = v172;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
