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
  int v5 = 0;
  int v6;
  int v7;
  v6 = v4;
  v7 = v5;
  while (true) {
    int v8 = 4;
    int v9 = v3 % v8;
    int v10 = 1;
    int v11 = v9 + v10;
    bool v12 = v7 < v11;
    v6 = v6;
    v7 = v7;
    if (!v12) break;
    int v13 = 0;
    bool v14 = v2 != v13;
    int v15;
    if (v14) {
      uint v16 = simt_subgroup_id(__simt_tid);
      int v17 = (int)(v16);
      int v18;
      v18 = v17;
      switch (v3) {
        case 0:
          {
          int v19 = 1;
          v18 = v19;
          break;
        }
        default:
          {
          v18 = v0;
          break;
        }
      }
      v15 = v18;
    } else {
      int v20 = 0;
      bool v21 = v2 != v20;
      int v22;
      if (v21) {
        bool v23 = true;
        int v24 = simt_wave_count_bits(v23);
        int v25 = 0;
        int v26 = 4;
        int v27 = v7 * v26;
        int v28 = v25 + v27;
        int v29 = v28 + v0;
        v1[v29] = v24;
        v22 = v24;
      } else {
        bool v30 = true;
        int v31 = simt_wave_count_bits(v30);
        int v32 = 16;
        int v33 = 4;
        int v34 = v7 * v33;
        int v35 = v32 + v34;
        int v36 = v35 + v0;
        v1[v36] = v31;
        v22 = v31;
      }
      v15 = v22;
    }
    int v37 = 1;
    int v38 = v7 + v37;
    v6 = v15;
    v7 = v38;
  }
  return;
}

kernel void kernel_main(device int* v39 [[buffer(0)]], device int* v40 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v41 = static_cast<int>(__simt_tid3.x);
  int v42 = 0;
  int v43 = v42 + v41;
  int v44 = v40[v43];
  int v45 = 4;
  int v46 = v45 + v41;
  int v47 = v40[v46];
  int v48 = 0;
  bool v49 = v44 != v48;
  if (v49) {
    int v50 = 0;
    int v51 = 0;
    int v52;
    int v53;
    v52 = v50;
    v53 = v51;
    while (true) {
      int v54 = 1;
      bool v55 = v53 < v54;
      v52 = v52;
      v53 = v53;
      if (!v55) break;
      helper0(v41, v39, v44, v47, static_cast<int>(__simt_tid3.x));
      int v56 = 1;
      int v57 = v53 + v56;
      v52 = v52;
      v53 = v57;
    }
  } else {
  }
  int v58 = 0;
  int v59 = 0;
  int v60;
  int v61;
  v60 = v58;
  v61 = v59;
  while (true) {
    int v62 = 4;
    int v63 = v61 * v62;
    int v64 = v63 + v41;
    int v65 = 8;
    int v66 = v65 + v64;
    int v67 = v40[v66];
    int v68 = 0;
    bool v69 = v67 != v68;
    v60 = v60;
    v61 = v61;
    if (!v69) break;
    int v70 = v60 + v61;
    int v71 = 1;
    int v72 = v61 + v71;
    bool v73 = true;
    int v74 = 32;
    int v75 = 4;
    int v76 = v61 * v75;
    int v77 = v74 + v76;
    int v78 = v77 + v41;
    bool v79 = true;
    int v80 = simt_wave_count_bits(v79);
    v39[v78] = v80;
    v60 = v70;
    v61 = v72;
    break;
    ;
  }
  int v81 = 28;
  int v82 = v81 + v41;
  int v83 = v40[v82];
  int v84 = 2;
  int v85;
  v85 = v84;
  switch (v83) {
    case 0:
      {
      int v86 = 32;
      int v87 = v86 + v41;
      int v88 = v40[v87];
      int v89;
      v89 = v41;
      switch (v88) {
        default:
          {
          int v90 = 0;
          int v91 = 0;
          int v92;
          int v93;
          v92 = v90;
          v93 = v91;
          while (true) {
            int v94 = 4;
            int v95 = v93 * v94;
            int v96 = v95 + v41;
            int v97 = 36;
            int v98 = v97 + v96;
            int v99 = v40[v98];
            int v100 = 0;
            bool v101 = v99 != v100;
            v92 = v92;
            v93 = v93;
            if (!v101) break;
            int v102 = v92 + v93;
            int v103 = 1;
            int v104 = v93 + v103;
            bool v105 = true;
            v92 = v102;
            v93 = v104;
          }
          v89 = v92;
          break;
        }
        case 0:
          {
          int v106 = 0;
          int v107 = 0;
          int v108;
          int v109;
          v108 = v106;
          v109 = v107;
          while (true) {
            int v110 = 4;
            int v111 = v109 * v110;
            int v112 = v111 + v41;
            int v113 = 56;
            int v114 = v113 + v112;
            int v115 = v40[v114];
            int v116 = 0;
            bool v117 = v115 != v116;
            v108 = v108;
            v109 = v109;
            if (!v117) break;
            int v118 = v108 + v109;
            int v119 = 1;
            int v120 = v109 + v119;
            bool v121 = true;
            v108 = v118;
            v109 = v120;
            continue;
            ;
          }
          v89 = v108;
          break;
        }
        case 1:
          {
          int v122 = 0;
          int v123 = 0;
          int v124;
          int v125;
          v124 = v122;
          v125 = v123;
          while (true) {
            int v126 = 4;
            int v127 = v125 * v126;
            int v128 = v127 + v41;
            int v129 = 76;
            int v130 = v129 + v128;
            int v131 = v40[v130];
            int v132 = 0;
            bool v133 = v131 != v132;
            v124 = v124;
            v125 = v125;
            if (!v133) break;
            int v134 = v124 + v125;
            int v135 = 1;
            int v136 = v125 + v135;
            bool v137 = true;
            v124 = v134;
            v125 = v136;
            continue;
            ;
          }
          v89 = v124;
          break;
        }
        case 2:
          {
          int v138 = 96;
          int v139 = v138 + v41;
          int v140 = v40[v139];
          int v141 = 3;
          int v142 = v41 + v141;
          int v143;
          v143 = v142;
          switch (v140) {
            case 0:
              {
              v143 = v41;
            }
            default:
              {
              v143 = v41;
              break;
            }
            case 1:
              {
              int v144 = 1;
              v143 = v144;
              break;
            }
            case 2:
              {
              int v145 = 1;
              int v146 = v41 + v145;
              v143 = v146;
              break;
            }
          }
          v89 = v143;
          break;
        }
      }
      v85 = v89;
      break;
    }
    case 1:
      {
      int v147 = 0;
      int v148 = 0;
      int v149;
      int v150;
      v149 = v147;
      v150 = v148;
      while (true) {
        int v151 = 4;
        int v152 = v150 * v151;
        int v153 = v152 + v41;
        int v154 = 100;
        int v155 = v154 + v153;
        int v156 = v40[v155];
        int v157 = 0;
        bool v158 = v156 != v157;
        v149 = v149;
        v150 = v150;
        if (!v158) break;
        int v159 = 0;
        int v160 = 0;
        int v161;
        int v162;
        v161 = v159;
        v162 = v160;
        while (true) {
          int v163 = 4;
          int v164 = v162 * v163;
          int v165 = v164 + v41;
          int v166 = 120;
          int v167 = v166 + v165;
          int v168 = v40[v167];
          int v169 = 0;
          bool v170 = v168 != v169;
          v161 = v161;
          v162 = v162;
          if (!v170) break;
          int v171 = v161 + v162;
          int v172 = 1;
          int v173 = v162 + v172;
          bool v174 = true;
          v161 = v171;
          v162 = v173;
        }
        int v175 = v149 + v161;
        int v176 = 1;
        int v177 = v150 + v176;
        bool v178 = true;
        v149 = v175;
        v150 = v177;
        break;
        ;
      }
      v85 = v149;
      break;
    }
    default:
      {
      v85 = v41;
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
    static int32_t expected0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 140; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
