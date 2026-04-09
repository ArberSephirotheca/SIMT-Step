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
        bool v31 = true;
        int v32 = simt_wave_count_bits(v31);
        int v33 = 0;
        int v34 = 4;
        int v35 = v25 * v34;
        int v36 = v33 + v35;
        int v37 = v36 + v0;
        v1[v37] = v32;
        int v38 = 1;
        int v39 = v25 + v38;
        v24 = v32;
        v25 = v39;
        break;
        ;
      }
      int v40 = 1;
      int v41 = v16 + v40;
      v15 = v24;
      v16 = v41;
      continue;
      ;
    }
    int v42 = 1;
    int v43 = v7 + v42;
    v6 = v15;
    v7 = v43;
  }
  return;
}

kernel void kernel_main(device int* v44 [[buffer(0)]], device int* v45 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v46 = static_cast<int>(__simt_tid3.x);
  int v47 = 0;
  int v48 = v47 + v46;
  int v49 = v45[v48];
  int v50 = 4;
  int v51 = v50 + v46;
  int v52 = v45[v51];
  int v53 = 0;
  bool v54 = v49 != v53;
  if (v54) {
    int v55 = 0;
    int v56 = 0;
    int v57;
    int v58;
    v57 = v55;
    v58 = v56;
    while (true) {
      int v59 = 1;
      bool v60 = v58 < v59;
      v57 = v57;
      v58 = v58;
      if (!v60) break;
      helper0(v46, v44, v49, v52, static_cast<int>(__simt_tid3.x));
      int v61 = 1;
      int v62 = v58 + v61;
      v57 = v57;
      v58 = v62;
    }
  } else {
  }
  int v63 = 1;
  int v64 = 8;
  int v65 = v64 + v46;
  int v66 = v45[v65];
  uint v67 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
  int v68 = (int)(v67);
  int v69;
  v69 = v68;
  switch (v66) {
    case 0:
      {
      v69 = v46;
      break;
    }
    case 1:
      {
      int v70 = 12;
      int v71 = v70 + v46;
      int v72 = v45[v71];
      int v73 = 0;
      bool v74 = v72 != v73;
      int v75;
      if (v74) {
        int v76 = 16;
        int v77 = v76 + v46;
        int v78 = v45[v77];
        int v79 = 0;
        bool v80 = v78 != v79;
        int v81;
        if (v80) {
          v81 = v46;
        } else {
          int v82 = 2;
          v81 = v82;
        }
        v75 = v81;
      } else {
        int v83 = 0;
        int v84 = 0;
        int v85;
        int v86;
        v85 = v83;
        v86 = v84;
        while (true) {
          int v87 = 4;
          int v88 = v86 * v87;
          int v89 = v88 + v46;
          int v90 = 20;
          int v91 = v90 + v89;
          int v92 = v45[v91];
          int v93 = 0;
          bool v94 = v92 != v93;
          v85 = v85;
          v86 = v86;
          if (!v94) break;
          int v95 = v85 + v86;
          int v96 = 1;
          int v97 = v86 + v96;
          bool v98 = true;
          v85 = v95;
          v86 = v97;
        }
        v75 = v85;
      }
      v69 = v75;
      break;
    }
    default:
      {
      int v99 = 40;
      int v100 = v99 + v46;
      int v101 = v45[v100];
      int v102 = 2;
      int v103 = v46 + v102;
      int v104;
      v104 = v103;
      switch (v101) {
        case 0:
          {
          int v105 = 0;
          int v106 = 0;
          int v107;
          int v108;
          v107 = v105;
          v108 = v106;
          while (true) {
            int v109 = 4;
            int v110 = v108 * v109;
            int v111 = v110 + v46;
            int v112 = 44;
            int v113 = v112 + v111;
            int v114 = v45[v113];
            int v115 = 0;
            bool v116 = v114 != v115;
            v107 = v107;
            v108 = v108;
            if (!v116) break;
            int v117 = v107 + v108;
            int v118 = 1;
            int v119 = v108 + v118;
            bool v120 = true;
            v107 = v117;
            v108 = v119;
          }
          v104 = v107;
        }
        case 1:
          {
          int v121 = 64;
          int v122 = v121 + v46;
          int v123 = v45[v122];
          int v124 = 0;
          bool v125 = v123 != v124;
          int v126;
          if (v125) {
            int v127 = 1;
            v126 = v127;
          } else {
            int v128 = 0;
            int v129 = v46 + v128;
            v126 = v129;
          }
          v104 = v126;
          break;
        }
        default:
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
            int v136 = v135 + v46;
            int v137 = 68;
            int v138 = v137 + v136;
            int v139 = v45[v138];
            int v140 = 0;
            bool v141 = v139 != v140;
            v132 = v132;
            v133 = v133;
            if (!v141) break;
            int v142 = v132 + v133;
            int v143 = 1;
            int v144 = v133 + v143;
            bool v145 = true;
            v132 = v142;
            v133 = v144;
          }
          v104 = v132;
          break;
        }
      }
      bool v146 = true;
      v69 = v104;
      break;
    }
    case 2:
      {
      int v147 = 88;
      int v148 = v147 + v46;
      int v149 = v45[v148];
      int v150 = 0;
      bool v151 = v149 != v150;
      int v152;
      if (v151) {
        int v153 = 92;
        int v154 = v153 + v46;
        int v155 = v45[v154];
        int v156;
        v156 = v46;
        switch (v155) {
          case 0:
            {
            int v157 = 2;
            int v158 = v46 + v157;
            v156 = v158;
            break;
          }
          case 1:
            {
            v156 = v46;
          }
          default:
            {
            v156 = v46;
            break;
          }
        }
        v152 = v156;
      } else {
        int v159 = 96;
        int v160 = v159 + v46;
        int v161 = v45[v160];
        int v162 = 4;
        int v163 = v46 + v162;
        int v164;
        v164 = v163;
        switch (v161) {
          case 0:
            {
            v164 = v46;
            break;
          }
          case 1:
            {
            v164 = v46;
            break;
          }
          default:
            {
            int v165 = 1;
            v164 = v165;
            break;
          }
        }
        bool v166 = true;
        v152 = v164;
      }
      v69 = v152;
      break;
    }
  }
  int v167 = 0;
  int v168 = 0;
  int v169;
  int v170;
  v169 = v167;
  v170 = v168;
  while (true) {
    int v171 = 4;
    int v172 = v170 * v171;
    int v173 = v172 + v46;
    int v174 = 100;
    int v175 = v174 + v173;
    int v176 = v45[v175];
    int v177 = 0;
    bool v178 = v176 != v177;
    v169 = v169;
    v170 = v170;
    if (!v178) break;
    int v179 = v169 + v46;
    int v180 = 1;
    int v181 = v170 + v180;
    bool v182 = true;
    int v183 = 16;
    int v184 = 4;
    int v185 = v170 * v184;
    int v186 = v183 + v185;
    int v187 = v186 + v46;
    bool v188 = true;
    int v189 = simt_wave_count_bits(v188);
    v44[v187] = v189;
    v169 = v179;
    v170 = v181;
    continue;
    ;
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
    static int32_t expected0[] = {static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(4), static_cast<int32_t>(0), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(2), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1)};
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 32; ++idx) {
      if (actual0[idx] != expected0[idx]) {
        fprintf(stderr, "buffer 0 [%zu]: expected=%d actual=%d\n", idx, expected0[idx], actual0[idx]);
        return 1;
      }
    }
    int32_t *actual1 = static_cast<int32_t *>([actual_buf1 contents]);
    for (size_t idx = 0; idx < 120; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
