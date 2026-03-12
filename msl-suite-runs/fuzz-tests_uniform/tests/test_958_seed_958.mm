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
  int v5 = v0 + v4;
  int v6 = 0;
  int v7 = 0;
  int v8;
  int v9;
  v8 = v6;
  v9 = v7;
  while (true) {
    int v10 = 4;
    int v11 = v3 % v10;
    int v12 = 1;
    int v13 = v11 + v12;
    bool v14 = v9 < v13;
    v8 = v8;
    v9 = v9;
    if (!v14) break;
    int v15 = 0;
    bool v16 = v2 != v15;
    int v17;
    if (v16) {
      int v18 = 0;
      int v19 = v0 + v18;
      v17 = v19;
    } else {
      uint v20 = simt_subgroup_id(__simt_tid);
      int v21 = (int)(v20);
      v17 = v21;
    }
    uint v22 = simt_subgroup_id(__simt_tid);
    int v23 = (int)(v22);
    int v24 = 1;
    int v25 = v9 + v24;
    v8 = v17;
    v9 = v25;
    break;
    ;
  }
  bool v26 = true;
  int v27 = simt_wave_count_bits(v26);
  int v28 = 0;
  int v29 = v28 + v0;
  v1[v29] = v27;
  int v30 = 0;
  bool v31 = v2 != v30;
  int v32 = v31 ? v5 : v8;
  int v33 = 3;
  int v34 = v3 % v33;
  uint v35 = simt_lane_id(__simt_tid);
  int v36 = (int)(v35);
  int v37;
  v37 = v36;
  switch (v34) {
    case 0:
      {
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
        continue;
        ;
      }
      int v49 = 4;
      int v50 = v0 + v49;
      v37 = v40;
      break;
    }
    case 1:
      {
      int v51 = 0;
      int v52 = 0;
      int v53;
      int v54;
      v53 = v51;
      v54 = v52;
      while (true) {
        int v55 = 4;
        int v56 = v3 % v55;
        int v57 = 1;
        int v58 = v56 + v57;
        bool v59 = v54 < v58;
        v53 = v53;
        v54 = v54;
        if (!v59) break;
        int v60 = 0;
        bool v61 = v2 != v60;
        int v62;
        if (v61) {
          int v63 = 1;
          v62 = v63;
        } else {
          int v64 = 0;
          v62 = v64;
        }
        int v65 = 2;
        int v66 = 1;
        int v67 = v54 + v66;
        v53 = v62;
        v54 = v67;
      }
      v37 = v53;
      break;
    }
    default:
      {
      int v68 = 1;
      v37 = v68;
      break;
    }
    case 2:
      {
      int v69 = 2;
      v37 = v69;
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
  int v76 = v75 ? v32 : v37;
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
  helper0(v79, v77, v82, v85, static_cast<int>(__simt_tid3.x));
  int v86 = 8;
  int v87 = v86 + v79;
  int v88 = v78[v87];
  int v89 = 3;
  int v90 = v79 + v89;
  int v91;
  v91 = v90;
  switch (v88) {
    case 0:
      {
      int v92 = 12;
      int v93 = v92 + v79;
      int v94 = v78[v93];
      int v95 = 3;
      int v96;
      v96 = v95;
      switch (v94) {
        default:
          {
          v96 = v79;
          break;
        }
        case 0:
          {
          int v97 = 0;
          int v98 = 0;
          int v99;
          int v100;
          v99 = v97;
          v100 = v98;
          while (true) {
            int v101 = 4;
            int v102 = v100 * v101;
            int v103 = v102 + v79;
            int v104 = 16;
            int v105 = v104 + v103;
            int v106 = v78[v105];
            int v107 = 0;
            bool v108 = v106 != v107;
            v99 = v99;
            v100 = v100;
            if (!v108) break;
            int v109 = v99 + v100;
            int v110 = 1;
            int v111 = v100 + v110;
            v99 = v109;
            v100 = v111;
            continue;
            ;
          }
          bool v112 = true;
          v96 = v99;
          break;
        }
        case 1:
          {
          int v113 = 36;
          int v114 = v113 + v79;
          int v115 = v78[v114];
          int v116 = 2;
          int v117 = v79 + v116;
          int v118;
          v118 = v117;
          switch (v115) {
            default:
              {
              v118 = v79;
              break;
            }
            case 0:
              {
              v118 = v79;
              break;
            }
            case 1:
              {
              int v119 = 2;
              int v120 = v79 + v119;
              v118 = v120;
              break;
            }
          }
          bool v121 = true;
          v96 = v118;
          break;
        }
        case 2:
          {
          int v122 = 2;
          int v123 = v79 + v122;
          v96 = v123;
          break;
        }
      }
      bool v124 = true;
      v91 = v96;
      break;
    }
    case 1:
      {
      int v125 = 0;
      int v126 = 0;
      int v127;
      int v128;
      v127 = v125;
      v128 = v126;
      while (true) {
        int v129 = 4;
        int v130 = v128 * v129;
        int v131 = v130 + v79;
        int v132 = 40;
        int v133 = v132 + v131;
        int v134 = v78[v133];
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
      v91 = v127;
      break;
    }
    default:
      {
      int v141 = 0;
      int v142 = 0;
      int v143;
      int v144;
      v143 = v141;
      v144 = v142;
      while (true) {
        int v145 = 4;
        int v146 = v144 * v145;
        int v147 = v146 + v79;
        int v148 = 60;
        int v149 = v148 + v147;
        int v150 = v78[v149];
        int v151 = 0;
        bool v152 = v150 != v151;
        v143 = v143;
        v144 = v144;
        if (!v152) break;
        int v153 = v143 + v79;
        int v154 = 1;
        int v155 = v144 + v154;
        v143 = v153;
        v144 = v155;
      }
      bool v156 = true;
      v91 = v143;
      break;
    }
  }
  bool v157 = true;
  int v158 = 32;
  int v159 = v158 + v79;
  bool v160 = true;
  int v161 = simt_wave_count_bits(v160);
  v77[v159] = v161;
  int v162 = 0;
  int v163 = 0;
  int v164;
  int v165;
  v164 = v162;
  v165 = v163;
  while (true) {
    int v166 = 4;
    int v167 = v165 * v166;
    int v168 = v167 + v79;
    int v169 = 80;
    int v170 = v169 + v168;
    int v171 = v78[v170];
    int v172 = 0;
    bool v173 = v171 != v172;
    v164 = v164;
    v165 = v165;
    if (!v173) break;
    int v174 = v164 + v165;
    int v175 = 1;
    int v176 = v165 + v175;
    v164 = v174;
    v165 = v176;
  }
  bool v177 = true;
  int v178 = 48;
  int v179 = v178 + v79;
  bool v180 = true;
  int v181 = simt_wave_count_bits(v180);
  v77[v179] = v181;
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
    static int32_t expected0[] = {static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 52; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 100; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
