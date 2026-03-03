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
  bool v5 = v2 != v4;
  int v6;
  if (v5) {
    int v7 = 0;
    int v8 = 0;
    int v9;
    int v10;
    v9 = v7;
    v10 = v8;
    while (true) {
      int v11 = 4;
      int v12 = v3 % v11;
      int v13 = 1;
      int v14 = v12 + v13;
      bool v15 = v10 < v14;
      v9 = v9;
      v10 = v10;
      if (!v15) break;
      int v16 = 0;
      bool v17 = v2 != v16;
      int v18;
      if (v17) {
        int v19 = 0;
        v18 = v19;
      } else {
        int v20 = 0;
        v18 = v20;
      }
      uint v21 = simt_lane_id(__simt_tid);
      int v22 = (int)(v21);
      int v23 = 1;
      int v24 = v10 + v23;
      v9 = v18;
      v10 = v24;
    }
    int v25 = 3;
    v6 = v9;
  } else {
    int v26 = 0;
    int v27 = 0;
    int v28;
    int v29;
    v28 = v26;
    v29 = v27;
    while (true) {
      int v30 = 4;
      int v31 = v3 % v30;
      int v32 = 1;
      int v33 = v31 + v32;
      bool v34 = v29 < v33;
      v28 = v28;
      v29 = v29;
      if (!v34) break;
      int v35 = 4;
      int v36 = v3 % v35;
      uint v37 = simt_lane_id(__simt_tid);
      int v38 = (int)(v37);
      int v39;
      v39 = v38;
      switch (v36) {
        default:
          {
          int v40 = 2;
          int v41 = v0 + v40;
          v39 = v41;
          break;
        }
        case 0:
          {
          int v42 = 2;
          v39 = v42;
          break;
        }
        case 1:
          {
          int v43 = 1;
          v39 = v43;
          break;
        }
        case 2:
          {
          int v44 = 4;
          int v45 = v0 + v44;
          v39 = v45;
          break;
        }
      }
      int v46 = 0;
      int v47 = v0 + v46;
      int v48 = 1;
      int v49 = v29 + v48;
      v28 = v39;
      v29 = v49;
      continue;
      ;
    }
    int v50 = 4;
    int v51 = v0 + v50;
    v6 = v28;
  }
  bool v52 = true;
  int v53 = simt_wave_count_bits(v52);
  int v54 = 0;
  int v55 = v54 + v0;
  v1[v55] = v53;
  return;
}

kernel void kernel_main(device int* v56 [[buffer(0)]], device int* v57 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v58 = static_cast<int>(__simt_tid3.x);
  int v59 = 0;
  int v60 = v59 + v58;
  int v61 = v57[v60];
  int v62 = 4;
  int v63 = v62 + v58;
  int v64 = v57[v63];
  helper0(v58, v56, v61, v64, static_cast<int>(__simt_tid3.x));
  int v65 = 0;
  int v66 = 0;
  int v67;
  int v68;
  v67 = v65;
  v68 = v66;
  while (true) {
    int v69 = 4;
    int v70 = v68 * v69;
    int v71 = v70 + v58;
    int v72 = 8;
    int v73 = v72 + v71;
    int v74 = v57[v73];
    int v75 = 0;
    bool v76 = v74 != v75;
    v67 = v67;
    v68 = v68;
    if (!v76) break;
    int v77 = v67 + v68;
    int v78 = 1;
    int v79 = v68 + v78;
    v67 = v77;
    v68 = v79;
  }
  bool v80 = true;
  int v81 = 16;
  int v82 = v81 + v58;
  bool v83 = true;
  int v84 = simt_wave_count_bits(v83);
  v56[v82] = v84;
  int v85 = 28;
  int v86 = v85 + v58;
  int v87 = v57[v86];
  uint v88 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v89 = (int)(v88);
  int v90;
  v90 = v89;
  switch (v87) {
    default:
      {
      int v91 = 0;
      int v92 = 0;
      int v93;
      int v94;
      v93 = v91;
      v94 = v92;
      while (true) {
        int v95 = 4;
        int v96 = v94 * v95;
        int v97 = v96 + v58;
        int v98 = 32;
        int v99 = v98 + v97;
        int v100 = v57[v99];
        int v101 = 0;
        bool v102 = v100 != v101;
        v93 = v93;
        v94 = v94;
        if (!v102) break;
        int v103 = 0;
        int v104 = 0;
        int v105;
        int v106;
        v105 = v103;
        v106 = v104;
        while (true) {
          int v107 = 4;
          int v108 = v106 * v107;
          int v109 = v108 + v58;
          int v110 = 52;
          int v111 = v110 + v109;
          int v112 = v57[v111];
          int v113 = 0;
          bool v114 = v112 != v113;
          v105 = v105;
          v106 = v106;
          if (!v114) break;
          int v115 = v105 + v106;
          int v116 = 1;
          int v117 = v106 + v116;
          v105 = v115;
          v106 = v117;
        }
        bool v118 = true;
        int v119 = v93 + v105;
        int v120 = 1;
        int v121 = v94 + v120;
        v93 = v119;
        v94 = v121;
        break;
        ;
      }
      bool v122 = true;
      v90 = v93;
      break;
    }
    case 0:
      {
      int v123 = 0;
      int v124 = 0;
      int v125;
      int v126;
      v125 = v123;
      v126 = v124;
      while (true) {
        int v127 = 4;
        int v128 = v126 * v127;
        int v129 = v128 + v58;
        int v130 = 72;
        int v131 = v130 + v129;
        int v132 = v57[v131];
        int v133 = 0;
        bool v134 = v132 != v133;
        v125 = v125;
        v126 = v126;
        if (!v134) break;
        int v135 = v125 + v126;
        int v136 = 1;
        int v137 = v126 + v136;
        v125 = v135;
        v126 = v137;
        break;
        ;
      }
      bool v138 = true;
      v90 = v125;
      break;
    }
  }
  bool v139 = true;
  int v140 = 32;
  int v141 = v140 + v58;
  bool v142 = true;
  int v143 = simt_wave_count_bits(v142);
  v56[v141] = v143;
  int v144 = 92;
  int v145 = v144 + v58;
  int v146 = v57[v145];
  int v147;
  v147 = v58;
  switch (v146) {
    case 0:
      {
      int v148 = 96;
      int v149 = v148 + v58;
      int v150 = v57[v149];
      int v151;
      v151 = v58;
      switch (v150) {
        case 0:
          {
          int v152 = 100;
          int v153 = v152 + v58;
          int v154 = v57[v153];
          int v155 = 3;
          int v156 = v58 + v155;
          int v157;
          v157 = v156;
          switch (v154) {
            case 0:
              {
              int v158 = 1;
              int v159 = v58 + v158;
              v157 = v159;
              break;
            }
            default:
              {
              v157 = v58;
              break;
            }
          }
          bool v160 = true;
          v151 = v157;
        }
        case 1:
          {
          int v161 = 1;
          v151 = v161;
        }
        default:
          {
          v151 = v58;
          break;
        }
      }
      bool v162 = true;
      v147 = v151;
    }
    default:
      {
      int v163 = 104;
      int v164 = v163 + v58;
      int v165 = v57[v164];
      int v166 = 0;
      bool v167 = v165 != v166;
      int v168;
      if (v167) {
        int v169 = 108;
        int v170 = v169 + v58;
        int v171 = v57[v170];
        int v172 = 1;
        int v173 = v58 + v172;
        int v174;
        v174 = v173;
        switch (v171) {
          case 0:
            {
            int v175 = 2;
            int v176 = v58 + v175;
            v174 = v176;
            break;
          }
          default:
            {
            int v177 = 1;
            v174 = v177;
            break;
          }
        }
        bool v178 = true;
        v168 = v174;
      } else {
        int v179 = 2;
        int v180 = v58 + v179;
        v168 = v180;
      }
      v147 = v168;
      break;
    }
  }
  bool v181 = true;
  int v182 = 48;
  int v183 = v182 + v58;
  bool v184 = true;
  int v185 = simt_wave_count_bits(v184);
  v56[v183] = v185;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3)};
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
    for (size_t idx = 0; idx < 112; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
