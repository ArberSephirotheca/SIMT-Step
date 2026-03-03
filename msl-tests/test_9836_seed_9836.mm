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
  uint v6 = simt_lane_id(__simt_tid);
  int v7 = (int)(v6);
  int v8;
  v8 = v7;
  switch (v5) {
    case 0:
      {
      int v9 = 4;
      int v10 = v3 % v9;
      int v11 = 0;
      int v12;
      v12 = v11;
      switch (v10) {
        case 0:
          {
          int v13 = 3;
          int v14 = v3 % v13;
          int v15 = 4;
          int v16;
          v16 = v15;
          switch (v14) {
            case 0:
              {
              int v17 = 4;
              int v18 = v0 + v17;
              v16 = v18;
              break;
            }
            case 1:
              {
              int v19 = 2;
              int v20 = v0 + v19;
              v16 = v20;
              break;
            }
            default:
              {
              int v21 = 1;
              int v22 = v0 + v21;
              v16 = v22;
              break;
            }
          }
          int v23 = 2;
          v12 = v16;
          break;
        }
        case 1:
          {
          int v24 = 0;
          int v25 = 0;
          int v26;
          int v27;
          v26 = v24;
          v27 = v25;
          while (true) {
            int v28 = 4;
            int v29 = v3 % v28;
            int v30 = 1;
            int v31 = v29 + v30;
            bool v32 = v27 < v31;
            v26 = v26;
            v27 = v27;
            if (!v32) break;
            int v33 = 0;
            int v34 = v0 + v33;
            int v35 = 1;
            int v36 = v27 + v35;
            v26 = v34;
            v27 = v36;
          }
          int v37 = 4;
          v12 = v26;
          break;
        }
        case 2:
          {
          int v38 = 2;
          int v39 = v3 % v38;
          int v40;
          v40 = v0;
          switch (v39) {
            case 0:
              {
              v40 = v0;
              break;
            }
            default:
              {
              int v41 = 0;
              v40 = v41;
              break;
            }
            case 1:
              {
              int v42 = 1;
              v40 = v42;
              break;
            }
          }
          v12 = v40;
        }
        default:
          {
          int v43 = 0;
          bool v44 = v2 != v43;
          int v45;
          if (v44) {
            int v46 = 1;
            v45 = v46;
          } else {
            int v47 = 4;
            v45 = v47;
          }
          int v48 = 4;
          int v49 = v0 + v48;
          v12 = v45;
          break;
        }
      }
      int v50 = 1;
      int v51 = v0 + v50;
      v8 = v12;
      break;
    }
    case 1:
      {
      int v52 = 0;
      bool v53 = v2 != v52;
      int v54;
      if (v53) {
        int v55 = 0;
        bool v56 = v2 != v55;
        int v57;
        if (v56) {
          int v58 = 3;
          v57 = v58;
        } else {
          int v59 = 0;
          v57 = v59;
        }
        int v60 = 3;
        v54 = v57;
      } else {
        int v61 = 0;
        int v62 = 0;
        int v63;
        int v64;
        v63 = v61;
        v64 = v62;
        while (true) {
          int v65 = 4;
          int v66 = v3 % v65;
          int v67 = 1;
          int v68 = v66 + v67;
          bool v69 = v64 < v68;
          v63 = v63;
          v64 = v64;
          if (!v69) break;
          int v70 = 2;
          int v71 = 1;
          int v72 = v64 + v71;
          v63 = v70;
          v64 = v72;
        }
        v54 = v63;
      }
      int v73 = 1;
      int v74 = v0 + v73;
      v8 = v54;
      break;
    }
    default:
      {
      int v75 = 0;
      bool v76 = v2 != v75;
      int v77;
      if (v76) {
        int v78 = 0;
        int v79 = 0;
        int v80;
        int v81;
        v80 = v78;
        v81 = v79;
        while (true) {
          int v82 = 4;
          int v83 = v3 % v82;
          int v84 = 1;
          int v85 = v83 + v84;
          bool v86 = v81 < v85;
          v80 = v80;
          v81 = v81;
          if (!v86) break;
          int v87 = 2;
          int v88 = 1;
          int v89 = v81 + v88;
          v80 = v87;
          v81 = v89;
          continue;
          ;
        }
        int v90 = 0;
        v77 = v80;
      } else {
        v77 = v0;
      }
      int v91 = 4;
      v8 = v77;
      break;
    }
    case 2:
      {
      int v92 = 0;
      int v93 = 0;
      int v94;
      int v95;
      v94 = v92;
      v95 = v93;
      while (true) {
        int v96 = 4;
        int v97 = v3 % v96;
        int v98 = 1;
        int v99 = v97 + v98;
        bool v100 = v95 < v99;
        v94 = v94;
        v95 = v95;
        if (!v100) break;
        int v101 = 1;
        int v102 = v95 + v101;
        v94 = v0;
        v95 = v102;
        break;
        ;
      }
      int v103 = 1;
      int v104 = v0 + v103;
      v8 = v94;
      break;
    }
  }
  bool v105 = true;
  int v106 = simt_wave_count_bits(v105);
  int v107 = 0;
  int v108 = v107 + v0;
  v1[v108] = v106;
  return;
}

kernel void kernel_main(device int* v109 [[buffer(0)]], device int* v110 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v111 = static_cast<int>(__simt_tid3.x);
  int v112 = 0;
  int v113 = v112 + v111;
  int v114 = v110[v113];
  int v115 = 4;
  int v116 = v115 + v111;
  int v117 = v110[v116];
  helper0(v111, v109, v114, v117, static_cast<int>(__simt_tid3.x));
  int v118 = 8;
  int v119 = v118 + v111;
  int v120 = v110[v119];
  int v121 = 0;
  bool v122 = v120 != v121;
  int v123;
  if (v122) {
    int v124 = 12;
    int v125 = v124 + v111;
    int v126 = v110[v125];
    uint v127 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v128 = (int)(v127);
    int v129;
    v129 = v128;
    switch (v126) {
      case 0:
        {
        int v130 = 0;
        int v131 = 0;
        int v132;
        int v133;
        v132 = v130;
        v133 = v131;
        while (true) {
          int v134 = 4;
          int v135 = v133 * v134;
          int v136 = v135 + v111;
          int v137 = 16;
          int v138 = v137 + v136;
          int v139 = v110[v138];
          int v140 = 0;
          bool v141 = v139 != v140;
          v132 = v132;
          v133 = v133;
          if (!v141) break;
          int v142 = v132 + v133;
          int v143 = 1;
          int v144 = v133 + v143;
          v132 = v142;
          v133 = v144;
        }
        bool v145 = true;
        v129 = v132;
        break;
      }
      default:
        {
        int v146 = 36;
        int v147 = v146 + v111;
        int v148 = v110[v147];
        int v149 = 2;
        int v150 = v111 + v149;
        int v151;
        v151 = v150;
        switch (v148) {
          case 0:
            {
            int v152 = 1;
            v151 = v152;
          }
          default:
            {
            int v153 = 2;
            int v154 = v111 + v153;
            v151 = v154;
            break;
          }
        }
        bool v155 = true;
        v129 = v151;
        break;
      }
      case 1:
        {
        int v156 = 40;
        int v157 = v156 + v111;
        int v158 = v110[v157];
        int v159 = 4;
        int v160 = v111 + v159;
        int v161;
        v161 = v160;
        switch (v158) {
          case 0:
            {
            int v162 = 4;
            v161 = v162;
          }
          case 1:
            {
            int v163 = 2;
            int v164 = v111 + v163;
            v161 = v164;
            break;
          }
          default:
            {
            v161 = v111;
            break;
          }
          case 2:
            {
            v161 = v111;
            break;
          }
        }
        bool v165 = true;
        v129 = v161;
        break;
      }
    }
    bool v166 = true;
    v123 = v129;
  } else {
    int v167 = 3;
    v123 = v167;
  }
  int v168 = 16;
  int v169 = v168 + v111;
  bool v170 = true;
  int v171 = simt_wave_count_bits(v170);
  v109[v169] = v171;
  int v172 = 3;
  int v173 = v111 + v172;
  int v174 = 3;
  int v175 = v111 + v174;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 44; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
