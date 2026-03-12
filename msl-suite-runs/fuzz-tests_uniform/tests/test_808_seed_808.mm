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
  int v7;
  v7 = v6;
  switch (v5) {
    case 0:
      {
      int v8 = 3;
      int v9 = v0 + v8;
      v7 = v9;
      break;
    }
    case 1:
      {
      int v10 = 2;
      int v11 = v3 % v10;
      int v12;
      v12 = v0;
      switch (v11) {
        default:
          {
          int v13 = 0;
          int v14 = 0;
          int v15;
          int v16;
          v15 = v13;
          v16 = v14;
          while (true) {
            int v17 = 4;
            int v18 = v3 % v17;
            int v19 = 1;
            int v20 = v18 + v19;
            bool v21 = v16 < v20;
            v15 = v15;
            v16 = v16;
            if (!v21) break;
            int v22 = 1;
            int v23 = v16 + v22;
            v15 = v0;
            v16 = v23;
          }
          int v24 = 2;
          v12 = v15;
        }
        case 0:
          {
          int v25 = 3;
          int v26 = v3 % v25;
          int v27 = 4;
          int v28 = v0 + v27;
          int v29;
          v29 = v28;
          switch (v26) {
            case 0:
              {
              int v30 = 1;
              int v31 = v0 + v30;
              v29 = v31;
              break;
            }
            case 1:
              {
              int v32 = 3;
              int v33 = v0 + v32;
              v29 = v33;
            }
            default:
              {
              int v34 = 1;
              int v35 = v0 + v34;
              v29 = v35;
              break;
            }
            case 2:
              {
              v29 = v0;
              break;
            }
          }
          int v36 = 3;
          int v37 = v0 + v36;
          v12 = v29;
          break;
        }
      }
      int v38 = 0;
      v7 = v12;
      break;
    }
    default:
      {
      int v39 = 0;
      int v40 = 0;
      int v41;
      int v42;
      v41 = v39;
      v42 = v40;
      while (true) {
        int v43 = 4;
        int v44 = v3 % v43;
        int v45 = 1;
        int v46 = v44 + v45;
        bool v47 = v42 < v46;
        v41 = v41;
        v42 = v42;
        if (!v47) break;
        int v48 = 3;
        int v49 = v0 + v48;
        int v50 = 1;
        int v51 = v42 + v50;
        v41 = v49;
        v42 = v51;
      }
      v7 = v41;
    }
    case 2:
      {
      int v52 = 4;
      int v53 = v3 % v52;
      int v54;
      v54 = v0;
      switch (v53) {
        case 0:
          {
          int v55 = 0;
          bool v56 = v2 != v55;
          int v57;
          if (v56) {
            v57 = v0;
          } else {
            int v58 = 3;
            int v59 = v0 + v58;
            v57 = v59;
          }
          int v60 = 3;
          int v61 = v0 + v60;
          v54 = v57;
          break;
        }
        case 1:
          {
          int v62 = 3;
          int v63 = v3 % v62;
          int v64 = 2;
          int v65 = v0 + v64;
          int v66;
          v66 = v65;
          switch (v63) {
            case 0:
              {
              int v67 = 3;
              v66 = v67;
            }
            case 1:
              {
              v66 = v0;
            }
            default:
              {
              int v68 = 4;
              int v69 = v0 + v68;
              v66 = v69;
              break;
            }
          }
          int v70 = 3;
          int v71 = v0 + v70;
          v54 = v66;
          break;
        }
        case 2:
          {
          int v72 = 2;
          int v73 = v3 % v72;
          int v74 = 2;
          int v75 = v0 + v74;
          int v76;
          v76 = v75;
          switch (v73) {
            default:
              {
              int v77 = 2;
              v76 = v77;
              break;
            }
            case 0:
              {
              v76 = v0;
              break;
            }
          }
          v54 = v76;
          break;
        }
        default:
          {
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
            int v87 = 3;
            int v88 = 1;
            int v89 = v81 + v88;
            v80 = v87;
            v81 = v89;
          }
          int v90 = 3;
          int v91 = v0 + v90;
          v54 = v80;
          break;
        }
      }
      int v92 = 1;
      v7 = v54;
      break;
    }
  }
  bool v93 = true;
  int v94 = simt_wave_count_bits(v93);
  int v95 = 0;
  int v96 = v95 + v0;
  v1[v96] = v94;
  return;
}

kernel void kernel_main(device int* v97 [[buffer(0)]], device int* v98 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v99 = static_cast<int>(__simt_tid3.x);
  int v100 = 0;
  int v101 = v100 + v99;
  int v102 = v98[v101];
  int v103 = 4;
  int v104 = v103 + v99;
  int v105 = v98[v104];
  helper0(v99, v97, v102, v105, static_cast<int>(__simt_tid3.x));
  int v106 = 0;
  int v107 = v99 + v106;
  int v108 = 8;
  int v109 = v108 + v99;
  int v110 = v98[v109];
  int v111 = 3;
  int v112;
  v112 = v111;
  switch (v110) {
    case 0:
      {
      int v113 = 12;
      int v114 = v113 + v99;
      int v115 = v98[v114];
      int v116 = 3;
      int v117;
      v117 = v116;
      switch (v115) {
        case 0:
          {
          int v118 = 16;
          int v119 = v118 + v99;
          int v120 = v98[v119];
          int v121 = 3;
          int v122;
          v122 = v121;
          switch (v120) {
            default:
              {
              int v123 = 3;
              v122 = v123;
              break;
            }
            case 0:
              {
              int v124 = 0;
              int v125 = v99 + v124;
              v122 = v125;
              break;
            }
            case 1:
              {
              int v126 = 3;
              int v127 = v99 + v126;
              v122 = v127;
              break;
            }
            case 2:
              {
              int v128 = 3;
              int v129 = v99 + v128;
              v122 = v129;
              break;
            }
          }
          bool v130 = true;
          v117 = v122;
          break;
        }
        default:
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
            int v137 = v136 + v99;
            int v138 = 20;
            int v139 = v138 + v137;
            int v140 = v98[v139];
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
            continue;
            ;
          }
          bool v146 = true;
          v117 = v133;
          break;
        }
      }
      bool v147 = true;
      v112 = v117;
    }
    default:
      {
      int v148 = 0;
      int v149 = 0;
      int v150;
      int v151;
      v150 = v148;
      v151 = v149;
      while (true) {
        int v152 = 4;
        int v153 = v151 * v152;
        int v154 = v153 + v99;
        int v155 = 40;
        int v156 = v155 + v154;
        int v157 = v98[v156];
        int v158 = 0;
        bool v159 = v157 != v158;
        v150 = v150;
        v151 = v151;
        if (!v159) break;
        int v160 = 0;
        int v161 = 0;
        int v162;
        int v163;
        v162 = v160;
        v163 = v161;
        while (true) {
          int v164 = 4;
          int v165 = v163 * v164;
          int v166 = v165 + v99;
          int v167 = 60;
          int v168 = v167 + v166;
          int v169 = v98[v168];
          int v170 = 0;
          bool v171 = v169 != v170;
          v162 = v162;
          v163 = v163;
          if (!v171) break;
          int v172 = v162 + v163;
          int v173 = 1;
          int v174 = v163 + v173;
          v162 = v172;
          v163 = v174;
        }
        bool v175 = true;
        int v176 = v150 + v162;
        int v177 = 1;
        int v178 = v151 + v177;
        v150 = v176;
        v151 = v178;
      }
      bool v179 = true;
      v112 = v150;
    }
    case 1:
      {
      v112 = v99;
      break;
    }
  }
  bool v180 = true;
  int v181 = 16;
  int v182 = v181 + v99;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v97[v182] = v184;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 80; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
