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
    int v13 = 4;
    int v14 = v0 + v13;
    int v15 = 1;
    int v16 = v7 + v15;
    v6 = v14;
    v7 = v16;
  }
  bool v17 = true;
  int v18 = simt_wave_count_bits(v17);
  int v19 = 0;
  int v20 = v19 + v0;
  v1[v20] = v18;
  int v21 = 3;
  int v22 = v3 % v21;
  int v23 = 2;
  int v24 = v0 + v23;
  int v25;
  v25 = v24;
  switch (v22) {
    case 0:
      {
      int v26 = 0;
      bool v27 = v2 != v26;
      int v28;
      if (v27) {
        int v29 = 0;
        v28 = v29;
      } else {
        int v30 = 2;
        int v31 = v3 % v30;
        int v32 = 1;
        int v33;
        v33 = v32;
        switch (v31) {
          default:
            {
            int v34 = 4;
            int v35 = v0 + v34;
            v33 = v35;
            break;
          }
          case 0:
            {
            int v36 = 1;
            int v37 = v0 + v36;
            v33 = v37;
            break;
          }
          case 1:
            {
            int v38 = 2;
            v33 = v38;
            break;
          }
        }
        int v39 = 1;
        int v40 = v0 + v39;
        v28 = v33;
      }
      int v41 = 1;
      v25 = v28;
      break;
    }
    case 1:
      {
      int v42 = 0;
      int v43 = 0;
      int v44;
      int v45;
      v44 = v42;
      v45 = v43;
      while (true) {
        int v46 = 4;
        int v47 = v3 % v46;
        int v48 = 1;
        int v49 = v47 + v48;
        bool v50 = v45 < v49;
        v44 = v44;
        v45 = v45;
        if (!v50) break;
        int v51 = 0;
        bool v52 = v2 != v51;
        int v53;
        if (v52) {
          int v54 = 2;
          int v55 = v0 + v54;
          v53 = v55;
        } else {
          v53 = v0;
        }
        int v56 = 3;
        int v57 = v0 + v56;
        int v58 = 1;
        int v59 = v45 + v58;
        v44 = v53;
        v45 = v59;
        break;
        ;
      }
      v25 = v44;
      break;
    }
    case 2:
      {
      int v60 = 0;
      int v61 = 0;
      int v62;
      int v63;
      v62 = v60;
      v63 = v61;
      while (true) {
        int v64 = 4;
        int v65 = v3 % v64;
        int v66 = 1;
        int v67 = v65 + v66;
        bool v68 = v63 < v67;
        v62 = v62;
        v63 = v63;
        if (!v68) break;
        int v69 = 0;
        int v70 = 0;
        int v71;
        int v72;
        v71 = v69;
        v72 = v70;
        while (true) {
          int v73 = 4;
          int v74 = v3 % v73;
          int v75 = 1;
          int v76 = v74 + v75;
          bool v77 = v72 < v76;
          v71 = v71;
          v72 = v72;
          if (!v77) break;
          int v78 = 3;
          int v79 = v0 + v78;
          int v80 = 1;
          int v81 = v72 + v80;
          v71 = v79;
          v72 = v81;
        }
        int v82 = 1;
        int v83 = 1;
        int v84 = v63 + v83;
        v62 = v71;
        v63 = v84;
      }
      v25 = v62;
      break;
    }
    default:
      {
      int v85 = 0;
      int v86 = 0;
      int v87;
      int v88;
      v87 = v85;
      v88 = v86;
      while (true) {
        int v89 = 4;
        int v90 = v3 % v89;
        int v91 = 1;
        int v92 = v90 + v91;
        bool v93 = v88 < v92;
        v87 = v87;
        v88 = v88;
        if (!v93) break;
        int v94 = 0;
        int v95 = 1;
        int v96 = v88 + v95;
        v87 = v94;
        v88 = v96;
        break;
        ;
      }
      int v97 = 2;
      int v98 = v0 + v97;
      v25 = v87;
      break;
    }
  }
  bool v99 = true;
  int v100 = simt_wave_count_bits(v99);
  int v101 = 16;
  int v102 = v101 + v0;
  v1[v102] = v100;
  int v103 = 0;
  bool v104 = v2 != v103;
  int v105 = v104 ? v6 : v25;
  return;
}

kernel void kernel_main(device int* v106 [[buffer(0)]], device int* v107 [[buffer(1)]], uint3 __simt_tid3 [[thread_position_in_grid]], uint3 __simt_group_id [[threadgroup_position_in_grid]], uint3 __simt_local_tid [[thread_position_in_threadgroup]]){
  int v108 = static_cast<int>(__simt_tid3.x);
  int v109 = 0;
  int v110 = v109 + v108;
  int v111 = v107[v110];
  int v112 = 4;
  int v113 = v112 + v108;
  int v114 = v107[v113];
  helper0(v108, v106, v111, v114, static_cast<int>(__simt_tid3.x));
  int v115 = 8;
  int v116 = v115 + v108;
  int v117 = v107[v116];
  int v118 = 0;
  bool v119 = v117 != v118;
  int v120;
  if (v119) {
    int v121 = 12;
    int v122 = v121 + v108;
    int v123 = v107[v122];
    int v124 = 2;
    int v125;
    v125 = v124;
    switch (v123) {
      default:
        {
        int v126 = 16;
        int v127 = v126 + v108;
        int v128 = v107[v127];
        int v129 = 0;
        bool v130 = v128 != v129;
        int v131;
        if (v130) {
          int v132 = 3;
          int v133 = v108 + v132;
          v131 = v133;
        } else {
          v131 = v108;
        }
        v125 = v131;
        break;
      }
      case 0:
        {
        int v134 = 1;
        v125 = v134;
        break;
      }
    }
    bool v135 = true;
    v120 = v125;
  } else {
    int v136 = 3;
    int v137 = v108 + v136;
    v120 = v137;
  }
  int v138 = 32;
  int v139 = v138 + v108;
  bool v140 = true;
  int v141 = simt_wave_count_bits(v140);
  v106[v139] = v141;
  int v142 = 20;
  int v143 = v142 + v108;
  int v144 = v107[v143];
  int v145 = 0;
  bool v146 = v144 != v145;
  int v147;
  if (v146) {
    int v148 = 0;
    int v149 = 0;
    int v150;
    int v151;
    v150 = v148;
    v151 = v149;
    while (true) {
      int v152 = 4;
      int v153 = v151 * v152;
      int v154 = v153 + v108;
      int v155 = 24;
      int v156 = v155 + v154;
      int v157 = v107[v156];
      int v158 = 0;
      bool v159 = v157 != v158;
      v150 = v150;
      v151 = v151;
      if (!v159) break;
      int v160 = 44;
      int v161 = v160 + v108;
      int v162 = v107[v161];
      int v163 = 0;
      bool v164 = v162 != v163;
      int v165;
      if (v164) {
        uint v166 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
        int v167 = (int)(v166);
        v165 = v167;
      } else {
        int v168 = 4;
        int v169 = v108 + v168;
        v165 = v169;
      }
      int v170 = v150 + v165;
      int v171 = 1;
      int v172 = v151 + v171;
      v150 = v170;
      v151 = v172;
    }
    bool v173 = true;
    v147 = v150;
  } else {
    uint v174 = simt_subgroup_id(static_cast<int>(__simt_tid3.x));
    int v175 = (int)(v174);
    v147 = v175;
  }
  int v176 = 48;
  int v177 = v176 + v108;
  bool v178 = true;
  int v179 = simt_wave_count_bits(v178);
  v106[v177] = v179;
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
    static int32_t expected1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
    static int32_t host_actual0[] = {static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0)};
    id<MTLBuffer> actual_buf0 = [device newBufferWithBytes:host_actual0 length:sizeof(host_actual0) options:MTLResourceStorageModeShared];
    if (!actual_buf0) {
      fprintf(stderr, "Unable to create input buffer 0\n");
      return 1;
    }
    static int32_t host_actual1[] = {static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(2), static_cast<int32_t>(3), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0), static_cast<int32_t>(1), static_cast<int32_t>(0)};
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
    for (size_t idx = 0; idx < 48; ++idx) {
      if (actual1[idx] != expected1[idx]) {
        fprintf(stderr, "buffer 1 [%zu]: expected=%d actual=%d\n", idx, expected1[idx], actual1[idx]);
        return 1;
      }
    }
    return 0;
  }
}
