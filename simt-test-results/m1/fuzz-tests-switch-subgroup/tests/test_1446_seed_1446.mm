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
    bool v13 = true;
    int v14 = simt_wave_count_bits(v13);
    int v15 = 0;
    int v16 = 4;
    int v17 = v7 * v16;
    int v18 = v15 + v17;
    int v19 = v18 + v0;
    v1[v19] = v14;
    int v20 = 1;
    int v21 = v7 + v20;
    v6 = v14;
    v7 = v21;
  }
  int v22 = 0;
  int v23 = 0;
  int v24;
  int v25;
  v24 = v22;
  v25 = v23;
  while (true) {
    int v26 = 4;
    int v27 = v3 % v26;
    int v28 = 1;
    int v29 = v27 + v28;
    bool v30 = v25 < v29;
    v24 = v24;
    v25 = v25;
    if (!v30) break;
    int v31 = 0;
    int v32 = 0;
    int v33;
    int v34;
    v33 = v31;
    v34 = v32;
    while (true) {
      int v35 = 4;
      int v36 = v3 % v35;
      int v37 = 1;
      int v38 = v36 + v37;
      bool v39 = v34 < v38;
      v33 = v33;
      v34 = v34;
      if (!v39) break;
      int v40 = 0;
      bool v41 = v2 != v40;
      int v42;
      if (v41) {
        bool v43 = true;
        int v44 = simt_wave_count_bits(v43);
        int v45 = 16;
        int v46 = 4;
        int v47 = v34 * v46;
        int v48 = v45 + v47;
        int v49 = v48 + v0;
        v1[v49] = v44;
        v42 = v44;
      } else {
        bool v50 = true;
        int v51 = simt_wave_count_bits(v50);
        int v52 = 32;
        int v53 = 4;
        int v54 = v34 * v53;
        int v55 = v52 + v54;
        int v56 = v55 + v0;
        v1[v56] = v51;
        v42 = v51;
      }
      int v57 = 1;
      int v58 = v34 + v57;
      v33 = v42;
      v34 = v58;
    }
    int v59 = 1;
    int v60 = v25 + v59;
    v24 = v33;
    v25 = v60;
  }
  int v61 = 0;
  bool v62 = v2 != v61;
  int v63 = v62 ? v6 : v24;
  return;
}

kernel void kernel_main(device int* v64 [[buffer(0)]], device int* v65 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v66 = static_cast<int>(__simt_tid3.x);
  int v67 = 0;
  int v68 = v67 + v66;
  int v69 = v65[v68];
  int v70 = 4;
  int v71 = v70 + v66;
  int v72 = v65[v71];
  helper0(v66, v64, v69, v72, static_cast<int>(__simt_tid3.x));
  int v73 = 8;
  int v74 = v73 + v66;
  int v75 = v65[v74];
  int v76 = 3;
  int v77 = v66 + v76;
  int v78;
  v78 = v77;
  switch (v75) {
    case 0:
      {
      int v79 = 12;
      int v80 = v79 + v66;
      int v81 = v65[v80];
      int v82 = 0;
      bool v83 = v81 != v82;
      int v84;
      if (v83) {
        int v85 = 2;
        int v86 = v66 + v85;
        v84 = v86;
      } else {
        int v87 = 16;
        int v88 = v87 + v66;
        int v89 = v65[v88];
        int v90 = 4;
        int v91;
        v91 = v90;
        switch (v89) {
          case 0:
            {
            uint v92 = simt_lane_id(static_cast<int>(__simt_tid3.x));
            int v93 = (int)(v92);
            v91 = v93;
          }
          default:
            {
            uint v94 = simt_lane_id(static_cast<int>(__simt_tid3.x));
            int v95 = (int)(v94);
            v91 = v95;
          }
          case 1:
            {
            uint v96 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
            int v97 = (int)(v96);
            bool v98 = true;
            int v99 = 48;
            int v100 = v99 + v66;
            bool v101 = true;
            int v102 = simt_wave_count_bits(v101);
            v64[v100] = v102;
            v91 = v97;
          }
          case 2:
            {
            bool v103 = true;
            int v104 = 64;
            int v105 = v104 + v66;
            bool v106 = true;
            int v107 = simt_wave_count_bits(v106);
            v64[v105] = v107;
            v91 = v66;
            break;
          }
        }
        v84 = v91;
      }
      int v108 = 80;
      int v109 = v108 + v66;
      bool v110 = true;
      int v111 = simt_wave_count_bits(v110);
      v64[v109] = v111;
      v78 = v84;
      break;
    }
    case 1:
      {
      int v112 = 3;
      v78 = v112;
    }
    case 2:
      {
      uint v113 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
      int v114 = (int)(v113);
      bool v115 = true;
      int v116 = 96;
      int v117 = v116 + v66;
      bool v118 = true;
      int v119 = simt_wave_count_bits(v118);
      v64[v117] = v119;
      v78 = v114;
      break;
    }
    default:
      {
      int v120 = 20;
      int v121 = v120 + v66;
      int v122 = v65[v121];
      int v123;
      v123 = v66;
      switch (v122) {
        case 0:
          {
          int v124 = 24;
          int v125 = v124 + v66;
          int v126 = v65[v125];
          int v127;
          v127 = v66;
          switch (v126) {
            case 0:
              {
              int v128 = 4;
              bool v129 = true;
              int v130 = 112;
              int v131 = v130 + v66;
              bool v132 = true;
              int v133 = simt_wave_count_bits(v132);
              v64[v131] = v133;
              v127 = v128;
            }
            default:
              {
              int v134 = 1;
              int v135 = v66 + v134;
              v127 = v135;
              break;
            }
          }
          v123 = v127;
          break;
        }
        default:
          {
          int v136 = 28;
          int v137 = v136 + v66;
          int v138 = v65[v137];
          uint v139 = simt_lane_id(static_cast<int>(__simt_tid3.x));
          int v140 = (int)(v139);
          int v141;
          v141 = v140;
          switch (v138) {
            case 0:
              {
              int v142 = 3;
              int v143 = v66 + v142;
              v141 = v143;
              break;
            }
            default:
              {
              int v144 = 1;
              bool v145 = true;
              int v146 = 128;
              int v147 = v146 + v66;
              bool v148 = true;
              int v149 = simt_wave_count_bits(v148);
              v64[v147] = v149;
              v141 = v144;
              break;
            }
          }
          bool v150 = true;
          int v151 = 144;
          int v152 = v151 + v66;
          bool v153 = true;
          int v154 = simt_wave_count_bits(v153);
          v64[v152] = v154;
          bool v155 = true;
          int v156 = 160;
          int v157 = v156 + v66;
          bool v158 = true;
          int v159 = simt_wave_count_bits(v158);
          v64[v157] = v159;
          v123 = v141;
          break;
        }
        case 1:
          {
          int v160 = 0;
          int v161 = 0;
          int v162;
          int v163;
          v162 = v160;
          v163 = v161;
          while (true) {
            int v164 = 4;
            int v165 = v163 * v164;
            int v166 = v165 + v66;
            int v167 = 32;
            int v168 = v167 + v166;
            int v169 = v65[v168];
            int v170 = 0;
            bool v171 = v169 != v170;
            v162 = v162;
            v163 = v163;
            if (!v171) break;
            int v172 = v162 + v163;
            int v173 = 1;
            int v174 = v163 + v173;
            bool v175 = true;
            int v176 = 176;
            int v177 = 4;
            int v178 = v163 * v177;
            int v179 = v176 + v178;
            int v180 = v179 + v66;
            bool v181 = true;
            int v182 = simt_wave_count_bits(v181);
            v64[v180] = v182;
            v162 = v172;
            v163 = v174;
            break;
            ;
          }
          v123 = v162;
          break;
        }
      }
      v78 = v123;
      break;
    }
  }
  int v183 = 2;
  uint v184 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v185 = (int)(v184);
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 99; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
