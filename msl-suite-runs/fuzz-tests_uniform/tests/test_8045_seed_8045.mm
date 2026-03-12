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
  int v6;
  v6 = v0;
  switch (v5) {
    case 0:
      {
      int v7 = 3;
      int v8 = v3 % v7;
      int v9 = 4;
      int v10;
      v10 = v9;
      switch (v8) {
        case 0:
          {
          int v11 = 0;
          int v12 = 0;
          int v13;
          int v14;
          v13 = v11;
          v14 = v12;
          while (true) {
            int v15 = 4;
            int v16 = v3 % v15;
            int v17 = 1;
            int v18 = v16 + v17;
            bool v19 = v14 < v18;
            v13 = v13;
            v14 = v14;
            if (!v19) break;
            int v20 = 3;
            int v21 = 1;
            int v22 = v14 + v21;
            v13 = v20;
            v14 = v22;
            break;
            ;
          }
          v10 = v13;
          break;
        }
        default:
          {
          int v23 = 0;
          int v24 = 0;
          int v25;
          int v26;
          v25 = v23;
          v26 = v24;
          while (true) {
            int v27 = 4;
            int v28 = v3 % v27;
            int v29 = 1;
            int v30 = v28 + v29;
            bool v31 = v26 < v30;
            v25 = v25;
            v26 = v26;
            if (!v31) break;
            int v32 = 1;
            int v33 = v26 + v32;
            v25 = v0;
            v26 = v33;
          }
          int v34 = 0;
          int v35 = v0 + v34;
          v10 = v25;
        }
        case 1:
          {
          int v36 = 2;
          int v37 = v3 % v36;
          int v38 = 1;
          int v39;
          v39 = v38;
          switch (v37) {
            default:
              {
              v39 = v0;
              break;
            }
            case 0:
              {
              int v40 = 1;
              v39 = v40;
              break;
            }
          }
          int v41 = 0;
          int v42 = v0 + v41;
          v10 = v39;
        }
        case 2:
          {
          int v43 = 0;
          int v44 = 0;
          int v45;
          int v46;
          v45 = v43;
          v46 = v44;
          while (true) {
            int v47 = 4;
            int v48 = v3 % v47;
            int v49 = 1;
            int v50 = v48 + v49;
            bool v51 = v46 < v50;
            v45 = v45;
            v46 = v46;
            if (!v51) break;
            int v52 = 1;
            int v53 = v46 + v52;
            v45 = v0;
            v46 = v53;
          }
          int v54 = 1;
          v10 = v45;
          break;
        }
      }
      int v55 = 1;
      v6 = v10;
      break;
    }
    case 1:
      {
      int v56 = 0;
      int v57 = 0;
      int v58;
      int v59;
      v58 = v56;
      v59 = v57;
      while (true) {
        int v60 = 4;
        int v61 = v3 % v60;
        int v62 = 1;
        int v63 = v61 + v62;
        bool v64 = v59 < v63;
        v58 = v58;
        v59 = v59;
        if (!v64) break;
        int v65 = 3;
        int v66 = v3 % v65;
        int v67 = 2;
        int v68;
        v68 = v67;
        switch (v66) {
          case 0:
            {
            v68 = v0;
            break;
          }
          default:
            {
            int v69 = 1;
            int v70 = v0 + v69;
            v68 = v70;
            break;
          }
          case 1:
            {
            int v71 = 4;
            int v72 = v0 + v71;
            v68 = v72;
            break;
          }
          case 2:
            {
            int v73 = 1;
            int v74 = v0 + v73;
            v68 = v74;
            break;
          }
        }
        int v75 = 1;
        int v76 = v59 + v75;
        v58 = v68;
        v59 = v76;
        continue;
        ;
      }
      v6 = v58;
      break;
    }
    default:
      {
      int v77 = 3;
      int v78 = v3 % v77;
      int v79 = 0;
      int v80 = v0 + v79;
      int v81;
      v81 = v80;
      switch (v78) {
        case 0:
          {
          int v82 = 0;
          bool v83 = v2 != v82;
          int v84;
          if (v83) {
            int v85 = 2;
            v84 = v85;
          } else {
            v84 = v0;
          }
          int v86 = 0;
          v81 = v84;
          break;
        }
        case 1:
          {
          int v87 = 2;
          int v88 = v3 % v87;
          int v89 = 4;
          int v90 = v0 + v89;
          int v91;
          v91 = v90;
          switch (v88) {
            case 0:
              {
              int v92 = 2;
              int v93 = v0 + v92;
              v91 = v93;
              break;
            }
            default:
              {
              int v94 = 4;
              v91 = v94;
              break;
            }
            case 1:
              {
              int v95 = 3;
              v91 = v95;
              break;
            }
          }
          int v96 = 0;
          v81 = v91;
        }
        default:
          {
          int v97 = 1;
          int v98 = v0 + v97;
          v81 = v98;
          break;
        }
      }
      int v99 = 2;
      v6 = v81;
      break;
    }
  }
  bool v100 = true;
  int v101 = simt_wave_count_bits(v100);
  int v102 = 0;
  int v103 = v102 + v0;
  v1[v103] = v101;
  return;
}

kernel void kernel_main(device int* v104 [[buffer(0)]], device int* v105 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v106 = static_cast<int>(__simt_tid3.x);
  int v107 = 0;
  int v108 = v107 + v106;
  int v109 = v105[v108];
  int v110 = 4;
  int v111 = v110 + v106;
  int v112 = v105[v111];
  helper0(v106, v104, v109, v112, static_cast<int>(__simt_tid3.x));
  int v113 = 0;
  int v114 = 0;
  int v115;
  int v116;
  v115 = v113;
  v116 = v114;
  while (true) {
    int v117 = 4;
    int v118 = v116 * v117;
    int v119 = v118 + v106;
    int v120 = 8;
    int v121 = v120 + v119;
    int v122 = v105[v121];
    int v123 = 0;
    bool v124 = v122 != v123;
    v115 = v115;
    v116 = v116;
    if (!v124) break;
    int v125 = 0;
    int v126 = 0;
    int v127;
    int v128;
    v127 = v125;
    v128 = v126;
    while (true) {
      int v129 = 4;
      int v130 = v128 * v129;
      int v131 = v130 + v106;
      int v132 = 28;
      int v133 = v132 + v131;
      int v134 = v105[v133];
      int v135 = 0;
      bool v136 = v134 != v135;
      v127 = v127;
      v128 = v128;
      if (!v136) break;
      int v137 = v127 + v128;
      int v138 = 1;
      int v139 = v128 + v138;
      v127 = v137;
      v128 = v139;
    }
    bool v140 = true;
    int v141 = v115 + v127;
    int v142 = 1;
    int v143 = v116 + v142;
    v115 = v141;
    v116 = v143;
  }
  bool v144 = true;
  int v145 = 16;
  int v146 = v145 + v106;
  bool v147 = true;
  int v148 = simt_wave_count_bits(v147);
  v104[v146] = v148;
  int v149 = 0;
  int v150 = 0;
  int v151;
  int v152;
  v151 = v149;
  v152 = v150;
  while (true) {
    int v153 = 4;
    int v154 = v152 * v153;
    int v155 = v154 + v106;
    int v156 = 48;
    int v157 = v156 + v155;
    int v158 = v105[v157];
    int v159 = 0;
    bool v160 = v158 != v159;
    v151 = v151;
    v152 = v152;
    if (!v160) break;
    int v161 = 0;
    int v162 = 0;
    int v163;
    int v164;
    v163 = v161;
    v164 = v162;
    while (true) {
      int v165 = 4;
      int v166 = v164 * v165;
      int v167 = v166 + v106;
      int v168 = 68;
      int v169 = v168 + v167;
      int v170 = v105[v169];
      int v171 = 0;
      bool v172 = v170 != v171;
      v163 = v163;
      v164 = v164;
      if (!v172) break;
      int v173 = v163 + v164;
      int v174 = 1;
      int v175 = v164 + v174;
      v163 = v173;
      v164 = v175;
    }
    bool v176 = true;
    int v177 = v151 + v163;
    int v178 = 1;
    int v179 = v152 + v178;
    v151 = v177;
    v152 = v179;
    continue;
    ;
  }
  bool v180 = true;
  int v181 = 32;
  int v182 = v181 + v106;
  bool v183 = true;
  int v184 = simt_wave_count_bits(v183);
  v104[v182] = v184;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 88; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
