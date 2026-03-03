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
  int v4 = 1;
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
    int v16 = 0;
    int v17;
    int v18;
    v17 = v15;
    v18 = v16;
    while (true) {
      int v19 = 4;
      int v20 = v3 % v19;
      int v21 = 1;
      int v22 = v20 + v21;
      bool v23 = v18 < v22;
      v17 = v17;
      v18 = v18;
      if (!v23) break;
      int v24 = 2;
      int v25 = 1;
      int v26 = v18 + v25;
      v17 = v24;
      v18 = v26;
      continue;
      ;
    }
    uint v27 = simt_subgroup_id(__simt_tid);
    int v28 = (int)(v27);
    int v29 = 1;
    int v30 = v9 + v29;
    v8 = v17;
    v9 = v30;
  }
  bool v31 = true;
  int v32 = simt_wave_count_bits(v31);
  int v33 = 0;
  int v34 = v33 + v0;
  v1[v34] = v32;
  int v35 = 0;
  bool v36 = v2 != v35;
  int v37 = v36 ? v5 : v8;
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
    int v47 = 0;
    bool v48 = v2 != v47;
    int v49;
    if (v48) {
      int v50 = 4;
      int v51 = v0 + v50;
      v49 = v51;
    } else {
      int v52 = 0;
      int v53 = 0;
      int v54;
      int v55;
      v54 = v52;
      v55 = v53;
      while (true) {
        int v56 = 4;
        int v57 = v3 % v56;
        int v58 = 1;
        int v59 = v57 + v58;
        bool v60 = v55 < v59;
        v54 = v54;
        v55 = v55;
        if (!v60) break;
        int v61 = 1;
        int v62 = v55 + v61;
        v54 = v0;
        v55 = v62;
        continue;
        ;
      }
      uint v63 = simt_lane_id(__simt_tid);
      int v64 = (int)(v63);
      v49 = v54;
    }
    int v65 = 1;
    int v66 = 1;
    int v67 = v41 + v66;
    v40 = v49;
    v41 = v67;
  }
  bool v68 = true;
  int v69 = simt_wave_count_bits(v68);
  int v70 = 16;
  int v71 = v70 + v0;
  v1[v71] = v69;
  int v72 = 0;
  bool v73 = v2 != v72;
  int v74 = v73 ? v37 : v40;
  return;
}

kernel void kernel_main(device int* v75 [[buffer(0)]], device int* v76 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v77 = static_cast<int>(__simt_tid3.x);
  int v78 = 0;
  int v79 = v78 + v77;
  int v80 = v76[v79];
  int v81 = 4;
  int v82 = v81 + v77;
  int v83 = v76[v82];
  helper0(v77, v75, v80, v83, static_cast<int>(__simt_tid3.x));
  int v84 = 8;
  int v85 = v84 + v77;
  int v86 = v76[v85];
  int v87 = 1;
  int v88;
  v88 = v87;
  switch (v86) {
    case 0:
      {
      int v89 = 0;
      int v90 = 0;
      int v91;
      int v92;
      v91 = v89;
      v92 = v90;
      while (true) {
        int v93 = 4;
        int v94 = v92 * v93;
        int v95 = v94 + v77;
        int v96 = 12;
        int v97 = v96 + v95;
        int v98 = v76[v97];
        int v99 = 0;
        bool v100 = v98 != v99;
        v91 = v91;
        v92 = v92;
        if (!v100) break;
        int v101 = v91 + v92;
        int v102 = 1;
        int v103 = v92 + v102;
        v91 = v101;
        v92 = v103;
      }
      bool v104 = true;
      v88 = v91;
      break;
    }
    default:
      {
      int v105 = 32;
      int v106 = v105 + v77;
      int v107 = v76[v106];
      int v108 = 0;
      int v109;
      v109 = v108;
      switch (v107) {
        default:
          {
          int v110 = 36;
          int v111 = v110 + v77;
          int v112 = v76[v111];
          int v113 = 2;
          int v114;
          v114 = v113;
          switch (v112) {
            case 0:
              {
              v114 = v77;
              break;
            }
            default:
              {
              int v115 = 0;
              v114 = v115;
              break;
            }
          }
          bool v116 = true;
          v109 = v114;
        }
        case 0:
          {
          v109 = v77;
          break;
        }
      }
      bool v117 = true;
      v88 = v109;
      break;
    }
    case 1:
      {
      int v118 = 0;
      int v119 = 0;
      int v120;
      int v121;
      v120 = v118;
      v121 = v119;
      while (true) {
        int v122 = 4;
        int v123 = v121 * v122;
        int v124 = v123 + v77;
        int v125 = 40;
        int v126 = v125 + v124;
        int v127 = v76[v126];
        int v128 = 0;
        bool v129 = v127 != v128;
        v120 = v120;
        v121 = v121;
        if (!v129) break;
        int v130 = v120 + v121;
        int v131 = 1;
        int v132 = v121 + v131;
        v120 = v130;
        v121 = v132;
      }
      bool v133 = true;
      v88 = v120;
      break;
    }
    case 2:
      {
      int v134 = 60;
      int v135 = v134 + v77;
      int v136 = v76[v135];
      int v137 = 0;
      int v138 = v77 + v137;
      int v139;
      v139 = v138;
      switch (v136) {
        case 0:
          {
          int v140 = 0;
          int v141 = 0;
          int v142;
          int v143;
          v142 = v140;
          v143 = v141;
          while (true) {
            int v144 = 4;
            int v145 = v143 * v144;
            int v146 = v145 + v77;
            int v147 = 64;
            int v148 = v147 + v146;
            int v149 = v76[v148];
            int v150 = 0;
            bool v151 = v149 != v150;
            v142 = v142;
            v143 = v143;
            if (!v151) break;
            int v152 = v142 + v143;
            int v153 = 1;
            int v154 = v143 + v153;
            v142 = v152;
            v143 = v154;
          }
          bool v155 = true;
          v139 = v142;
        }
        case 1:
          {
          int v156 = 84;
          int v157 = v156 + v77;
          int v158 = v76[v157];
          int v159 = 0;
          bool v160 = v158 != v159;
          int v161;
          if (v160) {
            int v162 = 4;
            int v163 = v77 + v162;
            v161 = v163;
          } else {
            v161 = v77;
          }
          v139 = v161;
          break;
        }
        case 2:
          {
          int v164 = 88;
          int v165 = v164 + v77;
          int v166 = v76[v165];
          int v167 = 0;
          bool v168 = v166 != v167;
          int v169;
          if (v168) {
            int v170 = 3;
            int v171 = v77 + v170;
            v169 = v171;
          } else {
            v169 = v77;
          }
          v139 = v169;
          break;
        }
        default:
          {
          int v172 = 92;
          int v173 = v172 + v77;
          int v174 = v76[v173];
          int v175 = 0;
          bool v176 = v174 != v175;
          int v177;
          if (v176) {
            int v178 = 0;
            v177 = v178;
          } else {
            int v179 = 2;
            v177 = v179;
          }
          v139 = v177;
          break;
        }
      }
      bool v180 = true;
      v88 = v139;
      break;
    }
  }
  bool v181 = true;
  int v182 = 32;
  int v183 = v182 + v77;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v75[v183] = v185;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 96; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
